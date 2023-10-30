package send;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryString
 */
@WebServlet(description = "값전달 연습", urlPatterns = { "/QueryString" })
public class QueryString extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
	
		
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String vclass = request.getParameter("class");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("회원정보 : get방식으로 전달<br>");
		out.println("아이디 : " + id + "<br>" );
		out.println("이름 : " + name + "<br>" );
		out.println("회원구분 : " + vclass + "<br>" );
		out.println("전화번호 : "+ phone1 + "-" + phone2 + "-" + phone3 + "-" +"<br>");
		out.println("<a href = 'javascript:history.go(-1)'>다시</a>");
		out.println("</body>");
		out.println("</html>");
		out.close();
		
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 현재문서의 한글값이 깨지지않도록 해준다.
		response.setContentType("text/html;charset=UTF-8");
		
		// post방식으로 한글값이 전달된 경우에 utf-8로 인코딩을 시켜준다.
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String vclass = request.getParameter("class");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("회원정보 : post방식으로 전달<br>");
		out.println("아이디 : " + id + "<br>" );
		out.println("이름 : " + name + "<br>" );
		out.println("회원구분 : " + vclass + "<br>" );
		out.println("전화번호 : "+ phone1 + "-" + phone2 + "-" + phone3 + "-" +"<br>");
		out.println("<a href = 'javascript:history.go(-1)'>다시</a>");
		out.println("</body>");
		out.println("</html>");
		out.close();
		
		QueryDTO dto = new QueryDTO();

		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setVclass(vclass);
		dto.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		
		QueryDAO dao = QueryDAO.getInstance();
		
		int result = dao.insert(dto);
		
		if(result == 1) System.out.println("회원가입 완료");
		
		
		
	}

}
