package com.guestbook.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbook.model.GuestDAO;
import com.guestbook.model.GuestDTO;
import com.guestbook.model.PageDTO;

/**
 * Servlet implementation class SearchAction
 */
@WebServlet("/guestbook/search")
public class SearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		GuestDAO dao = new GuestDAO();
		//paging
	      String pageNum = request.getParameter("pageNum")==null?"1":request.getParameter("pageNum");
	      String field=request.getParameter("field");
	      String word= request.getParameter("word");
	      PageDTO p = new PageDTO();
	      int currentpage = Integer.parseInt(pageNum);
	      int pageSize = 5;
	      int startRow = (currentpage-1)*pageSize+1; //현 페이지  시작 행
	      int endRow = currentpage * pageSize; //현 페이지 끝행
	      ArrayList<GuestDTO> arr=dao.guestlist(field,word,startRow,endRow);
	      int count = dao.guestCount(field,word);
	      int totpage = count/pageSize+(count%pageSize==0?0:1);
	      int blockpage =3; // [이전] 1 2 3 [다음]
	      int startpage = ((currentpage-1)/blockpage)*blockpage+1;
	      int endpage = startpage + blockpage;

	      if(endpage > totpage)
	         endpage = totpage;

		p.setCurrentpage(currentpage);
		p.setBlockpage(blockpage);
		p.setEndpage(endpage);
		p.setStartpage(startpage);
		p.setTotpage(totpage);
	
		request.setAttribute("p", p);
		request.setAttribute("lists", arr);
		request.setAttribute("count", count);
		request.setAttribute("field", field);
		request.setAttribute("word", word);
		RequestDispatcher dispatcher = request.getRequestDispatcher("searchResult.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
