package com.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;



/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/member/join.do")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO m = new MemberDTO();
		String name=req.getParameter("name");
		String userid=req.getParameter("userid");
		String pwd=req.getParameter("pwd");
		String phone=req.getParameter("phone");
		String zipcode=req.getParameter("zipcode");
		String email = req.getParameter("email");
		String addr=req.getParameter("addr");
		int admin =Integer.parseInt(req.getParameter("admin"));
		m.setName(name);
		m.setUserid(userid);
		m.setPwd(pwd);
		m.setPhone(phone);
		m.setEmail(email);
		m.setZipcode(zipcode);
		m.setAddr(addr);
		m.setAdmin(admin);
		MemberDAO dao = new MemberDAO();
		dao.memberInsert(m);
//		req.setAttribute("count",count);
//		req.setAttribute("arr", arr);
//		RequestDispatcher rd =req.getRequestDispatcher("searchResult.jsp");
//		rd.forward(req, resp);
//		resp.getWriter().append("Served at: ").append(req.getContextPath());
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
