package book;


import java.sql.*;



import java.util.*;


import static db.JdbcUtil.*;

public class BookDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	
	// 전체 게시물 목록 갯수를 조회하는 selectListCount()
		public int selectListCount() {
			int listCount = 0;

			try {
				con = getConnection();

				String sql = "SELECT COUNT(num) FROM book";
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
		
		// 전체 한국도서 게시물 목록 갯수를 조회하는 selectKBookListCount()
				public int selectKBookListCount() {
					int listCount = 0;

					try {
						con = getConnection();

						String sql = "SELECT COUNT(num) FROM book WHERE kind='국내도서'";
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
				
				// 전체 외국도서 게시물 목록 갯수를 조회하는 selectKBookListCount()
				public int selectWBookListCount() {
					int listCount = 0;

					try {
						con = getConnection();

						String sql = "SELECT COUNT(num) FROM book WHERE kind='해외도서'";
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
			
				// 전체 ebook 게시물 목록 갯수를 조회하는 selectEBookListCount()
				public int selectEBookListCount() {
					int listCount = 0;

					try {
						con = getConnection();

						String sql = "SELECT COUNT(num) FROM book WHERE kind='ebook'";
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();

						// 조회된 결과값의 첫번째 값(1번 인덱스)을 listCount 변수에 저장
						if (rs.next()) {
							listCount = rs.getInt(1);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("SQL 구문 오류 - selectEBookListCount()");
					} finally {
						close(rs);
						close(pstmt);
						close(con);
					}

					return listCount;
				}	
				
				
		// 게시물 목록 조회작업을 수행하는 selectBookList()
		// => 파라미터 : 현재 페이지 번호(pageNum), 표시할 목록 갯수(listLimit)
		// 리턴타입 : java.util.ArrayList<BookBean>(bookList)
		public ArrayList<BookBean> selectBookList(int pageNum, int listLimit) {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				// news 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
				// => SELECT 컬럼명 FROM 테이블명 LIMIT 시작행번호,목록갯수;
				String sql = "SELECT * FROM book ORDER BY num DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, listLimit);

				rs = pstmt.executeQuery();

				// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
				bookList = new ArrayList<BookBean>();

				while (rs.next()) {
					// 1개 레코드를 저장할 BookBean 객체 생성
					BookBean book = new BookBean();

					// BookBean 객체에 조회된 1개 레코드 정보를 모두 저장
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
					
					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 BookBean 객체 추가
					bookList.add(book);
				}
				
				System.out.println(bookList);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectBookList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return bookList;
		}
		
		// 국내도서 게시물 목록 조회작업을 수행하는 selectKBookList()
		public ArrayList<BookBean> selectKBookList(int pageNum, int listLimit) {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				// news 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
				// => SELECT 컬럼명 FROM 테이블명 LIMIT 시작행번호,목록갯수;
				String sql = "SELECT * FROM book WHERE kind = '국내도서' ORDER BY num DESC LIMIT ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, listLimit);

				rs = pstmt.executeQuery();

				// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
				bookList = new ArrayList<BookBean>();

				while (rs.next()) {
					// 1개 레코드를 저장할 NewsBean 객체 생성
					BookBean book = new BookBean();

					// NewsBean 객체에 조회된 1개 레코드 정보를 모두 저장
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
//					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
					
					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
					bookList.add(book);
				}
				
				//System.out.println(kbookList);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectKBookList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return bookList;
		}
		
		// 해외도서 게시물 목록 조회작업을 수행하는 selectWBookList()
		public ArrayList<BookBean> selectWBookList(int pageNum, int listLimit) {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				// news 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
				// => SELECT 컬럼명 FROM 테이블명 LIMIT 시작행번호,목록갯수;
				String sql = "SELECT * FROM book WHERE kind = '해외도서' ORDER BY num DESC LIMIT ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, listLimit);

				rs = pstmt.executeQuery();

				// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
				bookList = new ArrayList<BookBean>();

				while (rs.next()) {
					// 1개 레코드를 저장할 NewsBean 객체 생성
					BookBean book = new BookBean();

					// NewsBean 객체에 조회된 1개 레코드 정보를 모두 저장
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
//					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
					
					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
					bookList.add(book);
				}
				
				//System.out.println(kbookList);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectKBookList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return bookList;
		}
		
		// ebook 게시물 목록 조회작업을 수행하는 selectWBookList()
		public ArrayList<BookBean> selectEBookList(int pageNum, int listLimit) {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				// news 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
				// => SELECT 컬럼명 FROM 테이블명 LIMIT 시작행번호,목록갯수;
				String sql = "SELECT * FROM book WHERE kind = 'ebook' ORDER BY num DESC LIMIT ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, listLimit);

				rs = pstmt.executeQuery();

				// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
				bookList = new ArrayList<BookBean>();

				while (rs.next()) {
					// 1개 레코드를 저장할 NewsBean 객체 생성
					BookBean book = new BookBean();

					// NewsBean 객체에 조회된 1개 레코드 정보를 모두 저장
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
//					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
					
					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
					bookList.add(book);
				}
				
				//System.out.println(kbookList);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectKBookList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return bookList;
		}
		
		
		// 게시물 상세 내용 조회하는 selectNews()
		// => 파라미터 : 글번호(num), 리턴타입 : NewsBean(news)
		public BookBean selectBook(int num) {
			BookBean book = null;

			try {
				con = getConnection();

				String sql = "SELECT * FROM book WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					book = new BookBean();
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectBook()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return book;
		}
		
		public ArrayList<BookBean> selectRecentBookList() {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				String sql = "SELECT * FROM book ORDER BY num DESC LIMIT ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, 4);

				rs = pstmt.executeQuery();

				// 전체 레코드를 저장할 ArrayList<NewsBean> 객체 생성
				bookList = new ArrayList<BookBean>();

				while (rs.next()) {
					BookBean book = new BookBean();
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));

					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 NewsBean 객체 추가
					bookList.add(book);
				}

			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectRecentBookList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return bookList;
		}
		
		public int selectSearchListCount(String search) {
			int listCount = 0;

			try {
				con = getConnection();

				String sql = "SELECT COUNT(num) FROM book WHERE subject LIKE ?";
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
		public ArrayList<BookBean> selectSearchBookList(int pageNum, int listLimit, String search) {
			ArrayList<BookBean> bookList = null;

			try {
				con = getConnection();

				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				String sql = "SELECT * FROM book WHERE subject LIKE ? "
						+ "ORDER BY num DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, listLimit);
				rs = pstmt.executeQuery();
				
				bookList = new ArrayList<BookBean>();
				
				while(rs.next()) {
					BookBean book = new BookBean();
					book.setNum(rs.getInt("num"));
					book.setSubject(rs.getString("subject"));
					book.setName(rs.getString("name"));
					book.setPublisher(rs.getString("publisher"));
					book.setContent(rs.getString("content"));
					book.setPrice(rs.getInt("price"));
					book.setKind(rs.getString("kind"));
					book.setImage(rs.getString("image"));
					
					bookList.add(book);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectNewsList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			return bookList;
		}
		
		
}
