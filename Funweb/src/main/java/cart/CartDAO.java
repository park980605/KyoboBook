package cart;


import java.sql.*;

import java.util.*;


import static db.JdbcUtil.*;

public class CartDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	public int insertCart(CartBean cart) {
		int insertCount = 0;
		int qty = cart.getQty();
		int price = cart.getPrice();
		if(qty > 0) {
			price *= qty;
		}
		try {
			con = getConnection();
			
			
			String sql = "SELECT * FROM cart WHERE subject=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getSubject());
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 이미 책이 있는 경우
				sql = "UPDATE cart SET qty=?,price=? WHERE subject=?";
				qty += rs.getInt("qty");
				price += rs.getInt("price");
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, qty);
				pstmt2.setInt(2, price);
				pstmt2.setString(3, rs.getString("subject"));
			} else {
				 sql = "INSERT INTO cart VALUES (?, ?, ?, ?)";
				 pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, cart.getSubject());
					pstmt2.setInt(2, price);
					pstmt2.setInt(3, qty);
					pstmt2.setString(4, cart.getId());
			}
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertCart()");
		} finally {
			close(pstmt);
			close(con);
		}
		return insertCount;
		
	}
	
	public ArrayList<CartBean> selectCartList(String id) {
		ArrayList<CartBean> cartList = null;
		
		try {
			con = getConnection();
			
			String sql = "SELECT * FROM cart WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			rs = pstmt.executeQuery();
			cartList = new ArrayList<CartBean>();
			
			while(rs.next()) {
				CartBean cart = new CartBean();
				cart.setId(rs.getString("id"));
				cart.setSubject(rs.getString("subject"));
				cart.setPrice(rs.getInt("price"));
				cart.setQty(rs.getInt("qty"));
//				cart.setId(rs.getString("image"));
				
				cartList.add(cart);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectCartList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return cartList;
	}
	
	public ArrayList<CartBean> selectImageList(String subject) {
		ArrayList<CartBean> imageList = null;
		
		try {
			con = getConnection();
			
			String sql = "SELECT * FROM book WHERE subject=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			rs = pstmt.executeQuery();
			
			imageList = new ArrayList<CartBean>();
			
			while(rs.next()) {
				CartBean cart = new CartBean();
				cart.setImage(rs.getString("image"));
				
				imageList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		
		return imageList;
	}
}
