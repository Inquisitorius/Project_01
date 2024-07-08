package MyPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyPageContent/*")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf('/');
		String command = uri.substring(lastSlash);
		String uri2 = req.getHeader("Referer");
		if (uri2 != null && !uri2.contains("/MyPageContent")) {
			req.getSession().setAttribute("prevPage", uri2);
		}
		if (command.equals("/UpdateTry")) {
			UpdateTry(req, resp);
		}

		if (command.equals("/DeleteTry")) {
			DeleteTry(req, resp);
		}
		if (command.equals("/QuestionUpload")) {
			QuestionUpload(req, resp);
		}
		if (command.equals("/QuestionShow")) {
			QuestionShow(req, resp);
		}
	}

	private void UpdateTry(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {
			MyPageDAO dao = new MyPageDAO();
			String id = req.getParameter("id");
			java.util.Enumeration<String> parameterNames = req.getParameterNames();
			int result = 0;
			while (parameterNames.hasMoreElements()) {
				String column = parameterNames.nextElement();
				String inputData = req.getParameter(column);

				result = dao.updateData(column, inputData, id);
				HttpSession session = req.getSession();
				session.setAttribute(column, inputData);
				System.out.println("Update Try 안의 값 column = " + column + " inputData = " + inputData);
			}
			if (result != 0) {
				out.write("{\"status\": \"success\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.write("{\"status\": \"error\"}");
		}
	}

	private void DeleteTry(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {
			MyPageDAO dao = new MyPageDAO();
			String id = req.getParameter("id");
			int result = 0;
			result = dao.DeleteData(id);
			if (result != 0) {
				HttpSession session = req.getSession();
				session.invalidate();
				out.write("{\"status\": \"success\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.write("{\"status\": \"error\"}");
		}
	}

	private void QuestionUpload(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {
			MyPageDAO dao = new MyPageDAO();
			QuestionDTO dto = new QuestionDTO();
			
			dto.setQdx(dao.lastQdx());
			dto.setQue_category(req.getParameter("que_category"));
			dto.setQue_title(req.getParameter("que_title"));
			dto.setQue_contents(req.getParameter("que_contents"));
			int result = dao.uploadQuestion(dto);
			JsonObject jsonResponse = new JsonObject();
			if(result == 1) {
			jsonResponse.addProperty("status", "success");
			Gson gson = new Gson();
			jsonResponse.add("dto", gson.toJsonTree(dto));
			
			}else {
				jsonResponse.addProperty("status", "fail");
			}
			out.print(jsonResponse.toString());
		} catch (Exception e) {
			e.printStackTrace();
			JsonObject errorResponse = new JsonObject();
			errorResponse.addProperty("status", "error");
			errorResponse.addProperty("message", "Failed to upload question: " + e.getMessage());

			out.print(errorResponse.toString());
		}
	}
	
	private void QuestionShow(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {
			MyPageDAO dao = new MyPageDAO();
			List<QuestionDTO> qlist = dao.showAllQuestion();
			int count = dao.countQuestion();
			JsonObject jsonResponse = new JsonObject();
			jsonResponse.addProperty("status", "success");
			Gson gson = new Gson();
			jsonResponse.add("qlist", gson.toJsonTree(qlist));
			jsonResponse.add("count", gson.toJsonTree(count));
			out.print(jsonResponse.toString());
		} catch (Exception e) {
			e.printStackTrace();
			JsonObject errorResponse = new JsonObject();
			errorResponse.addProperty("status", "error");
			errorResponse.addProperty("message", "Failed to upload question: " + e.getMessage());

			out.print(errorResponse.toString());
		}
	}
}