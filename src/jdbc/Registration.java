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


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Registration() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String studentid = request.getParameter("student_ID"); 
			String firstname = request.getParameter("frname");
			String lastname = request.getParameter("lstname");
			String address = request.getParameter("adrs");
			String email = request.getParameter("email");
			String telephone = request.getParameter("tel"); 
			String password = request.getParameter("pass");
			String sql="insert into student(student_id,fname,lname,address,email,telephone,password) values(?,?,?,?,?,?,?)";
			
			String sql1="insert into login(email,password,user_type) values(?,?,?)";
			
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
			PreparedStatement ps = conn.prepareStatement(sql);
			
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			
			ps.setString(1, studentid);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, address);
			ps.setString(5, email);
			ps.setString(6, telephone);
			ps.setString(7, password);
			ps.executeUpdate();
			
			ps1.setString(1, email);
			ps1.setString(2, password);
			ps1.setString(3, "student");
			ps1.executeUpdate();
			
			response.sendRedirect("student.jsp");
			conn.close();
			
					
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
	}

}
