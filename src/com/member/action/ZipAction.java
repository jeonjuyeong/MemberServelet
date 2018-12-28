package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import com.member.model.MemberDAO;
import com.member.model.ZipcodeDTO;


/**
 * Servlet implementation class ZipAction
 */
@WebServlet("/member/zip.do")
public class ZipAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("zipcheck.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dong =req.getParameter("dong");
		MemberDAO dao = new MemberDAO();
		ArrayList<ZipcodeDTO> arr = dao.zipSearch(dong);
		resp.setContentType("text/html;charset=utf-8");

		JSONArray jarr = new JSONArray();
		for(ZipcodeDTO z:arr){
			JSONObject obj = new JSONObject();
			obj.put("zipcode", z.getZipcode());
			obj.put("sido",z.getSido());
			obj.put("gugun",z.getGugun());
			obj.put("dong",z.getDong());
			obj.put("bunji",z.getBunji());
			jarr.add(obj);
		}
		PrintWriter out = resp.getWriter();
		out.println(jarr.toString());
		
	}

}
