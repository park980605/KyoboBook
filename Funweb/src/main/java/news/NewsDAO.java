package news;

import java.sql.*;


import java.util.*;

import static db.JdbcUtil.*;

public class NewsDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;

	// 글쓰기 작업 수행하는 insertNews()
	// => 파라미터 : BoardBean 객체 리턴타입 : int(insertCount)
	public int insertNews(NewsBean news) {
		int insertCount = 0;
		int num = 1; // 새 글 번호를 저장할 변수(초기값으로 1 지정)

		try {
			con = getConnection();

			// 새 글 번호(num) 계산
			String sql = "SELECT MAX(num) FROM news";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			// 2) 글 쓰기 작업 수행(글번호는 num 변수값, 작성일은 now() 함수, 조회수는 0 으로 설정)
			sql = "INSERT INTO news VALUES (?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, news.getName());
			pstmt2.setString(3, news.getPass());
			pstmt2.setString(4, news.getSubject());
			pstmt2.setString(5, news.getContent());

			insertCount = pstmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertNews()");
		} finally {
			// 자원 반환(static import 로 인해 JdbcUtil 클래스명 생략 가능)
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}

		return insertCount;
	}

	// 게시물 목록 조회작업을 수행하는 selectBoardList()
	// => 파라미터 : 현재 페이지 번호(pageNum), 표시할 목록 갯수(listLimit)
	// 리턴타입 : java.util.ArrayList<BoardBean>(boardList)
	public ArrayList<NewsBean> selectNewsList(int pageNum, int listLimit) {
		ArrayList<NewsBean> newsList = null;

		try {
			con = getConnection();

			// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
			int startRow = (pageNum - 1) * listLimit;

			// news 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
			// => SELECT 컬럼명 FROM 테이블명 LIMIT 시작행번호,목록갯수;
			String sql = "SELECT * FROM news ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);

			rs = pstmt.executeQuery();

			// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
			newsList = new ArrayList<NewsBean>();

			while (rs.next()) {
				// 1개 레코드를 저장할 NewsBean 객체 생성
				NewsBean news = new NewsBean();

				// NewsBean 객체에 조회된 1개 레코드 정보를 모두 저장
				news.setNum(rs.getInt("num"));
				news.setName(rs.getString("name"));
				news.setPass(rs.getString("pass"));
				news.setSubject(rs.getString("subject"));
				news.setContent(rs.getString("content"));
				news.setDate(rs.getDate("date"));
				news.setReadcount(rs.getInt("readcount"));

				// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
				newsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectNewsList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return newsList;
	}

	// 전체 게시물 목록 갯수를 조회하는 selectListCount()
	public int selectListCount() {
		int listCount = 0;

		try {
			con = getConnection();

			String sql = "SELECT COUNT(num) FROM news";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 조회된 결과값의 첫번째 값(1번 인덱스)을 listCount 변수에 저장
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return listCount;
	}

	// 게시물 상세 내용 조회하는 selectNews()
	// => 파라미터 : 글번호(num), 리턴타입 : NewsBean(news)
	public NewsBean selectNews(int num) {
		NewsBean news = null;

		try {
			con = getConnection();

			String sql = "SELECT * FROM news WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				news = new NewsBean();
				news.setNum(rs.getInt("num"));
				news.setName(rs.getString("name"));
				news.setPass(rs.getString("pass"));
				news.setSubject(rs.getString("subject"));
				news.setContent(rs.getString("content"));
				news.setDate(rs.getDate("date"));
				news.setReadcount(rs.getInt("readcount"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectNews()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return news;
	}

	// 전달받은 글번호에 해당하는 게시물 조회수 증가하는 updateReadcount()
	// => 파라미터 : 글번호(num), 리턴타입 : void
	public void updateReadCount(int num) {

		try {
			con = getConnection();

			String sql = "UPDATE news SET readcount = readcount+1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateReadcount()");
		} finally {
			close(pstmt);
			close(con);
		}

	}

	// 게시물 수정 작업
	// => 파라미터 : NewsBean 객체(news), 리턴타입 : int(updateCount)
	public int updateNews(NewsBean news) {
		int updateCount = 0;

		try {
			con = getConnection();

			// 1. 패스워드 판별 작업
			String sql = "SELECT pass FROM news WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) { // 조회 결과가 존재할 경우
				// 패스워드 판별 작업 수행
				if (rs.getString("pass").equals(news.getPass())) { // 패스워드 일치 시
					// 2. 수정(UPDATE) 작업
					// => 번호에 해당하는 작성자, 제목, 내용 수정
					sql = "UPDATE news SET name=?, subject=?, content=? WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, news.getName());
					pstmt2.setString(2, news.getSubject());
					pstmt2.setString(3, news.getContent());
					pstmt2.setInt(4, news.getNum());

					updateCount = pstmt2.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateNews()");
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
			close(con);
		}

		return updateCount;
	}

	// 게시물 삭제 작업
	// => 파라미터 : 글번호(num), 패스워드(pass) 리턴타입 : int(deleteCount)
	public int deleteNews(int num, String pass) {
		int deleteCount = 0;

		try {
			con = getConnection();

			// 글번호와 패스워드가 모두 일치하는 게시물 조회
			String sql = "SELECT * FROM news WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 조회 결과가 있을 경우(= 패스워드까지 일치할 경우)에만 삭제 작업 수행
				sql = "DELETE FROM news WHERE num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, num);
				deleteCount = pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - deleteNews()");
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
			close(con);
		}

		return deleteCount;
	}

	// 최근 게시물 5개 조회 후 리턴하는 selectRecentNewsList()
	// => 파라미터 : 없음 리턴타입 : ArrayList<NewsBean>(newsList)
	public ArrayList<NewsBean> selectRecentNewsList() {
		ArrayList<NewsBean> newsList = null;

		try {
			con = getConnection();

			String sql = "SELECT * FROM news ORDER BY num DESC LIMIT ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);

			rs = pstmt.executeQuery();

			// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
			newsList = new ArrayList<NewsBean>();

			while (rs.next()) {
				NewsBean news = new NewsBean();
				news.setNum(rs.getInt("num"));
				news.setName(rs.getString("name"));
				news.setPass(rs.getString("pass"));
				news.setSubject(rs.getString("subject"));
				news.setContent(rs.getString("content"));
				news.setDate(rs.getDate("date"));
				news.setReadcount(rs.getInt("readcount"));

				// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
				newsList.add(news);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectRecentNewsList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return newsList;
	}

	// ---------------------- 검색 기능 ----------------------
	// 검색어에 해당하는 게시물 목록 갯수를 조회하는 selectSearchListCount()
	// => 파라미터 : 검색어(search), 리턴타입 : int(listCount)
	public int selectSearchListCount(String search) {
		int listCount = 0;

		try {
			con = getConnection();

			String sql = "SELECT COUNT(num) FROM news WHERE subject LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return listCount;
	}

	// 검색어에 해당하는 게시물 목록 조회작업을 수행하는 selectSearchNewsList()
	// => 파라미터 : 현재 페이지 번호(pageNum), 표시할 목록 갯수(listLimit), 검색어(search)
	// 리턴타입 : java.util.ArrayList<NewsBean>(newsList)
	public ArrayList<NewsBean> selectSearchNewsList(int pageNum, int listLimit, String search) {
		ArrayList<NewsBean> newsList = null;

		try {
			con = getConnection();

			// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
			int startRow = (pageNum - 1) * listLimit;
			
			String sql = "SELECT * FROM news WHERE subject LIKE ? "
					+ "ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			newsList = new ArrayList<NewsBean>();
			
			while(rs.next()) {
				NewsBean news = new NewsBean();
				news.setNum(rs.getInt("num"));
				news.setName(rs.getString("name"));
				news.setPass(rs.getString("pass"));
				news.setSubject(rs.getString("subject"));
				news.setContent(rs.getString("content"));
				news.setDate(rs.getDate("date"));
				news.setReadcount(rs.getInt("readcount"));
				
				newsList.add(news);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectNewsList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return newsList;
	}

}