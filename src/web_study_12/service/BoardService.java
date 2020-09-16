package web_study_12.service;

import java.sql.Connection;
import java.util.List;

import web_study_12.dao.impl.BoardDaoImpl;
import web_study_12.ds.JndiDS;
import web_study_12.dto.Board;

public class BoardService {
	private BoardDaoImpl dao = BoardDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public BoardService() {
		dao.setCon(con);
	}

	public List<Board> getBoards(){
		return dao.selectBoardByAll();
	}
	
	public int addBoard(Board board) {
		return dao.insertBoard(board);
	}
	
	public int modifyBoard(Board board) {
		return dao.updateBoard(board);
	}
	
	public Board getBoard(String num) {
		return dao.selectBoardByNum(num);
	}

	public int modifyReadCount(String num) {
		return dao.updateReadCount(num);
	}
	
	public Board confirmPassword(String pass, String num) {
		return dao.checkPassword(pass, num);
	}
	
	public int removeBoard(int num) {
		return dao.deleteBoard(num);
	}

}
