package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.MemberDTO;

public class MemberInsert implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		// throws를 사용하면 메소드를 호출한 곳에서 예외처리를 해줘야한다.
		
		System.out.println("MemberInsert");
		
		request.setCharacterEncoding("utf-8");
		// 값을 받기 전에!
		
		MemberDTO member = new MemberDTO();
		// 힙메모리에 기억할 공간 생성
		
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setJumin1(request.getParameter("jumin1"));
		member.setJumin2(request.getParameter("jumin2"));
		member.setMailid(request.getParameter("mailid"));
		member.setDomain(request.getParameter("domain"));
		member.setTel1(request.getParameter("tel1"));
		member.setTel2(request.getParameter("tel2"));
		member.setTel3(request.getParameter("tel3"));
		member.setPhone1(request.getParameter("phone1"));
		member.setPhone2(request.getParameter("phone2"));
		member.setPhone3(request.getParameter("phone3"));
		member.setPost(request.getParameter("post"));
		member.setAddress(request.getParameter("address"));
		member.setGender(request.getParameter("gender"));
		
		String[] hobby = request.getParameterValues("hobby");
		String h = "";
		for(String h1 : hobby) {
			h += h1 + "-";
		}
		member.setHobby(h);
		
		member.setIntro(request.getParameter("intro"));
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.insert(member);		// insert SQL문 실행
		if(result == 1) {
			System.out.println("회원가입 성공");
		}
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.println("<script>");
			out.println("location.href='./member/result.jsp'");
			out.println("</script>");
			}
			
		// 위 문장을 수행하려면 아래 문장을 막아야함
		
		/*
		ActionForward forward = new ActionForward();
		// 더이상 forward는 null값이 아니다. 그래서 컨트롤러에서 포워딩을 처리한다.

		forward.setRedirect(false);		// dispatcher 방식으로 포워딩
		forward.setPath("./member/loginform.jsp");	// 포워딩 파일명
		// webapp파일 기준
		
		return forward;
		*/
		return null;
	}

	
	
	
}
