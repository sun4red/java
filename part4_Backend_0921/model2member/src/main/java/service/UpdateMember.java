package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberDTO;

public class UpdateMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("UpdateMember");
		
		
		HttpSession session = request.getSession();
		// request 와 session은 항상 붙어다닌다.
		
		String id = (String)session.getAttribute("id");
		// 세션에 포함된 자료형으로 다운캐스팅을 해줘야한다.
		
		
		MemberDAO dao = MemberDAO.getInstance();
		
		// 1명의 상세정보 구하기
		MemberDTO member = dao.getMember(id);
		System.out.println("수정폼 : " +  member);
		
		String hobby = member.getHobby();
		String [] h = hobby.split("-");
		
		// 공유 설정
		request.setAttribute("member", member);
		request.setAttribute("h", h);
		
		
		// request객체로 공유한 경우에는 dispatcher 방식으로 포워딩을 해야
		// view 페이지에서 공유한 값에 접근할 수 있다.
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);		// dispatcher방식 포워딩
		forward.setPath("./member/updateform.jsp");
		
		
		return forward;
		
		// 리턴값이 null이 아니니 forward할 수 있다.
		
	}

	

}
