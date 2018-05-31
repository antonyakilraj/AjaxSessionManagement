//This program is used to create a validate a session using an ajax call.
package com.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Trial")
public class Trial extends HttpServlet {
	private static final long serialVersionUID = 1L;




	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String users="akil";		
		System.out.println(" inside servlet");

		PrintWriter out = response.getWriter();
		out.println("Session is created!!");

		String action = (String)request.getParameter("reqFor");

		System.out.println("action "+action);

		HttpSession session = request.getSession(true);
		if(action ==""|| action.equalsIgnoreCase("first")) {
			session.setAttribute("user", users);
			System.out.println(session.getAttribute("user"));
			session.setMaxInactiveInterval(1*10);
		} else {
			System.out.println(" inside else");
			if(session.getAttribute("user")==null) {
				//out.println("session expired");
				System.out.println(session.getAttribute("user"));
				System.out.println(" exception");
				
				//throw new ServletException();

			}else {
				
				out.println("Session is valid");

			}
		}
	}
}
