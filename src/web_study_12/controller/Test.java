package web_study_12.controller;

import web_study_12.dto.Board;

public class Test {

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Board b = new Board();
		System.out.println(b);

		
		//reflexing 기법을 이용
		
		Class<?> cls = Class.forName("web_study_12.dto.Board");
		Board b2 = (Board) cls.newInstance();
		System.out.println(b2);
	}

}
