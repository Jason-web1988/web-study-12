package web_study_12.controller.model;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web_study_12.controller.Command;
import web_study_12.dto.Board;
import web_study_12.service.BoardService;

public class BoardUpdateModel implements Command {
	private BoardService service = new BoardService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")){
			System.out.println("GET방식");
			return null;
		}else {
	    	System.out.println("POST");
	    	Gson gson = new Gson();
	    	Board board = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Board.class);
	        System.out.println(board);	        
	    	int res = service.modifyBoard(board);
	    	System.out.println("res > " + res);
	    	response.getWriter().print(res);
	    	return null;
		}
	}

}
