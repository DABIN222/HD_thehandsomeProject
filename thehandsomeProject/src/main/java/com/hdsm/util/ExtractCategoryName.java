package com.hdsm.util;

public class ExtractCategoryName {
	public static String[] getCategoryName(String ctg) {
		String[] categoryNames = new String[3];
		
		String lctg = ctg.substring(0, 2);
		/*
		 * String mctg = ctg.substring(3, 4); String sctg = ctg.substring(4);
		 */
		
		// 대분류 한글로 치환
		switch(lctg) {
			case "we":
				categoryNames[0] = "여성";
				break;
			case "me":
				categoryNames[0] = "남성";
				break;
			case "as":
				categoryNames[0] = "잡화";
				break;
		}
		/*
		 * //중분류 한글로 치환 switch(mctg) { case "1": categoryNames[1] = "여자"; break; case
		 * "2": categoryNames[1] = "남자"; break; case "3": categoryNames[1] = "잡화";
		 * break; case "4": categoryNames[1] = "잡화"; break; case "5": categoryNames[1] =
		 * "잡화"; break; }
		 */
		return categoryNames;
	}
}
