package web_study_12.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import web_study_12.dao.impl.BoardDaoImpl;
import web_study_12.ds.JdbcUtil;
import web_study_12.ds.JndiDS;
import web_study_12.dto.Board;

public class BoardDaoImplTest {
	private static BoardDaoImpl dao;
	private static Connection con;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		con = JdbcUtil.getConnection();
		dao = BoardDaoImpl.getInstance();
		dao.setCon(con);
	}	

	@Test
	public void testSelectBoardByAll() {
		System.out.println("testSelectBoardByAll()");
		List<Board> list = dao.selectBoardByAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
		
	}

	@Test
	public void testInsertBoard() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateReadCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBoardByNum() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateBoard() {
		fail("Not yet implemented");
	}

	@Test
	public void testCheckPassword() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteBoard() {
		fail("Not yet implemented");
	}

}
