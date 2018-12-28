package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class IdCheckAction
 */
@WebServlet("/member/idcheck.do")
public class IdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO m = new MemberDTO();
		String userid=req.getParameter("userid");
		MemberDAO dao = new MemberDAO();
		String check=dao.idcheck(userid);
		PrintWriter out = resp.getWriter();
		out.println(check);	
		
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
