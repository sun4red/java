package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberDTO;

public class Delete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Delete");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		MemberDAO dao = MemberDAO.getInstance();

		// 1명의 상세 정보 구하기
		MemberDTO db = dao.getMember(id);
		
		// 비번 비교
		if(db.getPasswd().equals(passwd)) {		// 비번 일치 시
			int result = dao.delete(id);		// delete SQL문 실행
			if(result == 1) {
				System.out.println("회원 탈퇴 성공");
				session.invalidate();
			}
			
		}else {		// 비번 불일치 시
			out.println("<script>");
			out.println("alert('비번이 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
			// null값 return 해줘야 하단의 forward를 실행하지 않음
		}
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./member/loginform.jsp");
		
		return forward;
	}

}
