package jdbc;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Registerowner")
public class Registerowner extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Registerowner() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			
			String name = request.getParameter("pn");
			String email = request.getParameter("email");
			String telephone = request.getParameter("tel"); 
			String password = request.getParameter("pass");
			String sql="insert into owner(name,email,telephone,password) values(?,?,?,?)";
			
			String sql1="insert into login(email,password,user_type) values(?,?,?)";
			
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
			PreparedStatement ps = conn.prepareStatement(sql);
			
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			
			
			ps.setString(1,name);
			ps.setString(2, email);
			ps.setString(3, telephone);
			ps.setString(4, password);
			ps.executeUpdate();
			
			ps1.setString(1, email);
			ps1.setString(2, password);
			ps1.setString(3, "propertier");
			ps1.executeUpdate();
			
			response.sendRedirect("owner.jsp");
			conn.close();
			
					
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
