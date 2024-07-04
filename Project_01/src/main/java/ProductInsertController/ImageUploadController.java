package ProductInsertController;

import java.io.File;
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

@WebServlet("/SellerPage/ImageUpload.do")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class ImageUploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIRECTORY = "C:\\img"; // 적절한 경로로 수정
    private static final String IMAGE_URL_PREFIX = "/img/"; // 이미지 URL 경로 prefix

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파일을 전송하는 파트(part)를 가져옵니다.
        Part filePart = request.getPart("productImg");

        // 파트가 null인지 확인
        if (filePart != null) {
            // 파일명 추출
            String fileName = extractFileName(filePart);

            // 파일명에서 공백 제거
            fileName = fileName.replaceAll("\\s+", "");

            // 저장할 고유한 파일명 생성
            String savedFileName = UUID.randomUUID().toString() + "_" + fileName;

            // 파일이 저장될 디렉토리 경로 설정
            String uploadPath = UPLOAD_DIRECTORY;

            // 디렉토리가 존재하지 않으면 생성
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 파일 저장 경로 설정
            String filePath = uploadPath + File.separator + savedFileName;

            // 파일 스트림 열고 복사
            try (InputStream input = filePart.getInputStream();
                 OutputStream output = new FileOutputStream(filePath)) {

                // 파일 복사
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }

                // 클라이언트에게 JSON 응답 보내기
                String imageUrl = request.getContextPath() + IMAGE_URL_PREFIX + savedFileName;
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
        } else {
            // 파일 파트가 null인 경우에 대한 처리
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("파일 파트가 null입니다.");
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