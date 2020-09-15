package web_study_12.dao;

import java.sql.Connection;
import java.util.List;

import web_study_12.dto.Board;

public interface BoardDao {
	List<Board> selectBoardByAll();

	int insertBoard(Board board);
	
	void updateReadCount(String num);
	
	Board selectBoardByNum(String num);
	
	int updateBoard(Board board);
	
	Board checkPassword(String pass, String num);
	
	int deleteBoard(int num);

	
	
}
