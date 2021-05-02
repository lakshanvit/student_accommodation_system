package jdbc;

import java.io.IOException;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/Property")
public class Property extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Property() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("pid");
		String email = request.getParameter("pemail");
		
try {
		
			String sql="UPDATE property SET status='Unavailable' WHERE property_id='"+id+"'";
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
			response.sendRedirect("afterloginOwner.jsp?name=Successfuly+added&email="+email+"");
			conn.close();
					
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			
			String address = request.getParameter("adrs");
			String type = request.getParameter("types");
			String tenant = request.getParameter("tenants"); 
			String rent = request.getParameter("rent");
			String telephone = request.getParameter("tel");
			String owner_email = request.getParameter("email");
			String status = "Available";
			
			String sql="insert into property(p_address,type,number_of_tenance,rent,owner_telephone,Email,status) values(?,?,?,?,?,?,'"+status+"')";
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			
			
			ps.setString(1,address);
			ps.setString(2, type);
			ps.setString(3, tenant);
			ps.setString(4, rent);
			ps.setString(5, telephone);
			ps.setString(6, owner_email);
			
			ps.executeUpdate();
			
			response.sendRedirect("afterloginOwner.jsp?name=Successfuly+added&email="+owner_email+"");
			conn.close();
					
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
