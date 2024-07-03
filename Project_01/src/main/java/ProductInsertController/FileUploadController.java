package ProductInsertController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/SellerPage/fileUpload.do")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class FileUploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_DIRECTORY = "C:/img"; // 이미지가 저장될 디렉토리 경로 설정

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // HTTP 요청에서 파일 파트를 가져옵니다.
        Part filePart = request.getPart("file");
        
        // 원본 파일명 가져오기
        String fileName = extractFileName(filePart);
        
        // 고유한 파일명 생성
        String savedFileName = UUID.randomUUID().toString() + "_" + fileName;
        
        // 저장할 디렉토리 경로 설정
        String uploadPath = UPLOAD_DIRECTORY;
        
        // 저장할 디렉토리가 없으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        // 파일 저장 경로 설정
        String filePath = uploadPath + File.separator + savedFileName;
        
        // 파일 스트림 열기 및 복사
        try (InputStream input = filePart.getInputStream();
             OutputStream output = new FileOutputStream(filePath)) {
            
            // 파일 복사
            int bytesRead;
            byte[] buffer = new byte[4096];
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            
            // 업로드 성공 시 클라이언트에게 JSON 응답 보내기
            String imageUrl = request.getContextPath() + "/SellerPage/fileUpload.do?file=" + savedFileName;
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("url", imageUrl);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());
            
        } catch (IOException e) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", e.getMessage());
            
            response.setContentType("application/json");
            response.getWriter().write(errorResponse.toString());
        }
    }
    
    // 클라이언트가 요청한 이미지 출력
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("file");
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            File imageFile = new File(filePath);
            
            if (imageFile.exists()) {
                // 이미지 파일을 읽어들이고 출력 스트림을 설정하여 클라이언트에게 전송
                response.setContentType("image/jpeg"); // 이미지 타입에 맞게 설정
                try (FileInputStream input = new FileInputStream(imageFile);
                     OutputStream output = response.getOutputStream()) {
                    
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = input.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
    
    // Part에서 파일명 추출하는 메서드
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
