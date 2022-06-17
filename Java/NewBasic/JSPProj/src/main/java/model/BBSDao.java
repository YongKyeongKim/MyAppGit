package model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import service.DAOService;



/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직을 갖고 있는 객체
 * 
 */
public class BBSDao implements DAOService<BBSDto> {
	//멤버변수(속성들)
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	//생성자
	public BBSDao(ServletContext context) {
		try {
			/*
			//방법1]ResourceBundle(java.util패키지) API 사용
			//.properties파일은 반드시 클래스패스인 src/main/java에 위치시키자
			//파일명만(.properties빼고)
			//ResourceBundle resource = ResourceBundle.getBundle("/resources/database");
			//String username=resource.getString("username");
			//String password=resource.getString("password");
			//방법2]ServletContext의 getResourceAsStream()메소드와 Properties API 사용
			InputStream is= context.getResourceAsStream("/WEB-INF/resources/database.properties");
			Properties props = new Properties();
			props.load(is);
			String username=props.getProperty("username");
			String password=props.getProperty("password");
			
			//드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE-DRIVER"));
			//데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE-URL"),username,password);
			System.out.println("데이터베이스 연결 성공");
			*/
			//커넥션풀 사용하기]
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("JNDI-ROOT")+"/jsp");
			conn = source.getConnection();
			
		}
		//catch(ClassNotFoundException | SQLException | IOException e) {e.printStackTrace();}
		catch(SQLException | NamingException e) {e.printStackTrace();}
		
	}///////////BBSDao
	//자원반납용
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		}
		catch(SQLException e) {e.printStackTrace();}
	}//////////close
	//회원 여부 판단용
	public boolean isMember(String id,String pwd) {
		String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setString(2,pwd);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}///////////isMember
	//전체 목록 가져오기]
	/*
	 * 페이징 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체 목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가	
	 */
	public List<BBSDto> selectList(Map map){
		List<BBSDto> articles= new Vector<BBSDto>();
		//페이징 적용 前 쿼리- 전체 목록 쿼리
		//String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ORDER BY no DESC";
		
		//페이징 적용 - 구간 쿼리
		//String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		//검색 추가시
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		if(map.get("searchWord") !=null) {
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}
		sql+= " ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정
			psmt.setString(1, map.get("start").toString());			
			psmt.setString(2, map.get("end").toString());
			
			rs= psmt.executeQuery();
			while(rs.next()) {
				BBSDto dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setHitCount(rs.getString(5));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setName(rs.getString(7));
				articles.add(dto);
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return articles;
	}////////////////selectList
	//총 레코드 수 얻기용
	public int getTotalRecordCount(Map map) {
		int totalRecordCount=0;
		//String sql="SELECT COUNT(*) FROM bbs";
		//검색시에도 페이징 적용
		String sql="SELECT COUNT(*) FROM bbs b JOIN member m ON m.id=b.id ";
		if(map.get("searchWord") !=null) {
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}
		try {
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			rs.next();
			totalRecordCount= rs.getInt(1);
		}
		catch(SQLException e) {e.printStackTrace();}		
		return totalRecordCount;
	}////////////////getTotalRecordCount
	//입력용
	public int insert(BBSDto dto) {
		int affected=0;
		String sql="INSERT INTO bbs(no,id,title,content) VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			//입력된 행의 키값 가져오려면 두번째 인자를 추가해야 한다
			psmt= conn.prepareStatement(sql, new String[] {"no"});//두번째 인자는 키값인 컬럼의 배열명.혹은 인덱스로 new int[]{1}
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			affected=psmt.executeUpdate();
			//입력된 행의 키값 가져오기		
			rs=psmt.getGeneratedKeys();
			if(rs.next()) {
				System.out.println("키값(no컬럼):"+rs.getLong(1));
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return affected;
	}/////////////////
	/*
	 //제너릭 인터페이스 변경전
	 public BBSDto selectOne(String no,String prev) {
		BBSDto dto=null;
		//레코드 하나 조회
		
		try {
			
			//목록에서 넘어온 경우에만 조회수 증가
			if(prev !=null && prev.toUpperCase().startsWith("LIST")) {
				//조회 수 업데이트
				psmt= conn.prepareStatement("UPDATE bbs SET hitcount=hitcount+1 WHERE no=?");
				psmt.setString(1, no);
				psmt.executeUpdate();
			}		
			String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id WHERE no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs= psmt.executeQuery();
			while(rs.next()) {
				dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setHitCount(rs.getString(5));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setName(rs.getString(7));				
			}
		}
		catch(SQLException e) {e.printStackTrace();}		
		return dto;
	}/////////////////
	 */
	
	//상세보기용 --제너릭 인터페이스용
	public BBSDto selectOne(String ...one) {
		BBSDto dto=null;
		//레코드 하나 조회
		
		try {
			
			//목록에서 넘어온 경우에만 조회수 증가
			if(one[1] !=null && one[1].toUpperCase().startsWith("LIST")) {
				//조회 수 업데이트
				psmt= conn.prepareStatement("UPDATE bbs SET hitcount=hitcount+1 WHERE no=?");
				psmt.setString(1, one[0]);
				psmt.executeUpdate();
			}		
			String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id WHERE no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, one[0]);
			rs= psmt.executeQuery();
			while(rs.next()) {
				dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setHitCount(rs.getString(5));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setName(rs.getString(7));				
			}
		}
		catch(SQLException e) {e.printStackTrace();}		
		return dto;
	}/////////////////
	//수정용
	public int update(BBSDto dto) {
		int affected=0;
		String sql="UPDATE bbs SET title=?,content=? WHERE no=?";
		try {	
			psmt = conn.prepareStatement(sql);
			psmt.setString(3, dto.getNo());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			affected=psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return affected;
	}/////////////////
	//삭제용
	public int delete(String no) {
		int affected=0;
		String sql="DELETE FROM bbs WHERE no=?";
		try {	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			
			affected=psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return affected;
	}/////////////////
	//이전글/다음글 얻기
	public Map<String,BBSDto> prevNext(String currentNo){
		
		Map<String,BBSDto> map = new HashMap<>();
		try {
			//이전글 얻기]
			String sql="SELECT no,title FROM bbs WHERE no=(SELECT MIN(no) FROM bbs WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, currentNo);
			rs = psmt.executeQuery();
			if(rs.next()) {//이전글이 있는 경우
				map.put("PREV", new BBSDto(rs.getString(1), null, rs.getString(2), null, null, null, null));
			}
			//다음글 얻기]
			sql="SELECT no,title FROM bbs WHERE no=(SELECT MAX(no) FROM bbs WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, currentNo);
			rs = psmt.executeQuery();
			if(rs.next()) {//다음글이 있는 경우
				map.put("NEXT", new BBSDto(rs.getString(1), null, rs.getString(2), null, null, null, null));
			}
			
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return map;
	}////////////////prevNext
	
	
}//////////////////
