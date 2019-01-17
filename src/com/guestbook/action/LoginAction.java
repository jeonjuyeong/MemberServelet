package com.guestbook.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/guestbook/login")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDTO m = new MemberDTO();
		String userid= request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		int check=dao.userCheck(userid,pwd);
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check==1) {
			session.setAttribute("userid",userid);
			RequestDispatcher rd = request.getRequestDispatcher("guestInsert.jsp");
			rd.forward(request, response);
		}else if(check==-1) {
			out.println("<script> alert('비밀번호가 맞지 않습니다.'); location.href='login.jsp'; </script>");
			out.flush();
		}else {
			out.println("<script> alert('없는아이디입니다.'); location.href='login.jsp'; </script>");
			out.flush();
		}
	
	}
	/** 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid= request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		MemberDTO m = dao.memberView(userid);
		int check=dao.userCheck(userid,pwd);
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check==1) {
			session.setAttribute("m",m);
			RequestDispatcher rd = request.getRequestDispatcher("guestInsert.jsp");
			rd.forward(request, response);
		}else if(check==-1) {
			out.println("<script> alert('비밀번호가 맞지 않습니다.'); location.href='login.jsp'; </script>");
			out.flush();
		}else {
			out.println("<script> alert('없는아이디입니다.'); location.href='login.jsp'; </script>");
			out.flush();
		}	
	}
}

