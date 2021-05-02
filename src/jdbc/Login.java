package jdbc;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			String email = request.getParameter("email");
			String password = request.getParameter("psw");
			
			String dbEmail = null;
			String dbPass = null;
			String dbUtype = null;
			
			String sql="select * from login where email=? and password=?";
			
			
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				dbEmail = rs.getString(1);
				dbPass = rs.getString(2);
				dbUtype = rs.getString(3);
			}
			if (email.equals(dbEmail)&& password.equals(dbPass)) {
				if (dbUtype.equals("student")) {
					HttpSession session = request.getSession();
					session.setAttribute("email", dbEmail);
					response.sendRedirect("afterloginstudent.jsp");
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("email", dbEmail);
					
					request.getRequestDispatcher("afterloginOwner.jsp").forward(request, response);
					//response.sendRedirect("afterloginOwner.jsp");
				}
			}
			else {
				response.sendRedirect("login.jsp");
			}
			
			
			
			
			
					
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
