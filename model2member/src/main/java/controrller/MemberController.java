package controrller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;
import service.ActionForward;
import service.MemberInsert;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	// doGet(), doPost() 메소드에서 공통적인 작업을 처리하는 메소드
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("command : " + command);
		
		// command 변수에 요청이름값이 나오게 된다.
		// service 클래스의 이름은 클라이언트가 요청하는 파일과 같게 생성한다.
		
				
		/*
		requestURI : /model2member/MemberInsert.do
		contextPath : /model2member
		command : /MemberInsert.do
		*/		
		
		Action action = null;
		ActionForward forward = null;
		
		// 회원가입
		
		if(command.equals("/MemberInsert.do")) {
			try {
				action = new MemberInsert();		// 업캐스팅?
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		// 포워딩 처리
		
		if(forward != null) {
			if(forward.isRedirect()) {	// redirect 방식으로 포워딩
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher =
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
	}		// doProcess() end
	


	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
		
		doProcess(request, response);	// doProcess()메소드 호출
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");

		doProcess(request, response);	// doProcess()메소드 호출
	}

}
