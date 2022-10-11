package com.hdsm.util;

public class ExtractCategoryName {
	public static String[] getCategoryName(String ctg) {
		String[] categoryNames = new String[3];
		
		String lctg = ctg.substring(0, 2);
		/*
		 * String mctg = ctg.substring(3, 4); String sctg = ctg.substring(4);
		 */
		
<<<<<<< HEAD
		//남성
		else if(ctg.equals("me")){categoryNames[0]="남성";}
		//남성 > 아우터
		else if( ctg.equals("me01")) {categoryNames[0]="남성"; categoryNames[1]="아우터";}
		else if( ctg.equals("me011")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="재킷";}
		else if( ctg.equals("me012")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="점퍼";}
		else if( ctg.equals("me013")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="가디건/베스트";}
		else if( ctg.equals("me014")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="트렌치코트";}
		else if( ctg.equals("me015")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="코트";}
		else if( ctg.equals("me016")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="다운/패딩";}
		//남성 > 탑		
		else if( ctg.equals("me02")) {categoryNames[0]="남성"; categoryNames[1]="탑";}
		else if( ctg.equals("me021")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="티셔츠";}
		else if( ctg.equals("me022")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="셔츠";}
		else if( ctg.equals("me023")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="니트";}
		else if( ctg.equals("me024")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="스웨터";}
		//남성 > 팬츠
		else if( ctg.equals("me03")) {categoryNames[0]="남성"; categoryNames[1]="팬츠";}
		else if( ctg.equals("me031")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="루즈/테이퍼드";}
		else if( ctg.equals("me032")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="슬림/스트레이트";}
		else if( ctg.equals("me033")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="조거/트랙";}
		else if( ctg.equals("me034")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="데님";}
		else if( ctg.equals("me035")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="쇼츠";}
		//남성 > 수트
		else if( ctg.equals("me04")) {categoryNames[0]="남성"; categoryNames[1]="수트";}
		else if( ctg.equals("me041")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="드레스셔츠";}
		else if( ctg.equals("me042")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="수트재킷";}
		else if( ctg.equals("me043")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="수트팬츠";}
	      // 잡화 > 여성슈즈
		else if (ctg.equals("as01")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; } 
		else if (ctg.equals("as011")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "부츠"; }
		else if (ctg.equals("as012")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "로퍼/블로퍼"; }
		else if (ctg.equals("as013")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "스니커즈"; }
		else if (ctg.equals("as014")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "플랫"; }
		else if (ctg.equals("as015")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "힐/슬링백"; }
		else if (ctg.equals("as016")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "샌들/슬라이드"; }
		else if (ctg.equals("as017")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "기타 슈즈"; }
		  
		  // 잡화 > 남성슈즈
		else if (ctg.equals("as02")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; }
		else if (ctg.equals("as021")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "부츠"; }
		else if (ctg.equals("as022")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "포멀슈즈"; }
		else if (ctg.equals("as023")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "스니커즈"; }
		else if (ctg.equals("as024")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "샌들/슬라이드"; }
		  else if (ctg.equals("as025")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "기타 슈즈"; }
		  
		  // 잡화 > 여성백
		  else if (ctg.equals("as03")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; }
		  else if (ctg.equals("as031")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "토트백"; }
		  else if (ctg.equals("as032")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "숄더/크로스바디백"; }
		  else if (ctg.equals("as033")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "기타 백"; }
		
		  // 잡화 > 남성백
		  else if (ctg.equals("as04")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; }
		  else if (ctg.equals("as041")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "토트백"; }
		  else if (ctg.equals("as042")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "숄더/크로스바디백"; }
		  else if (ctg.equals("as043")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "클러치 백"; }
		  else if (ctg.equals("as044")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "기타 백"; }
		  
		  // 잡화 > 머플러/스카프
		  else if (ctg.equals("as05")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; }
		  else if (ctg.equals("as051")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; categoryNames[2] = "머플러"; }
		  else if (ctg.equals("as052")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; categoryNames[2] = "스카프"; }
		  
		  // 잡화 > 주얼리
		  else if (ctg.equals("as06")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; }
		  else if (ctg.equals("as061")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "이어링/커프"; }
		  else if (ctg.equals("as062")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "목걸이"; }
		  else if (ctg.equals("as063")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "팔찌"; }
		  else if (ctg.equals("as064")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "반지"; }
		  else if (ctg.equals("as065")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "기타 주얼리"; }
		  
		  // 잡화 > 기타 ACC
		  else if (ctg.equals("as07")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; }
		  else if (ctg.equals("as071")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "모자"; }
		  else if (ctg.equals("as072")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "양말"; }
		  else if (ctg.equals("as073")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "장갑"; }
		  else if (ctg.equals("as074")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "벨트"; }
		  else if (ctg.equals("as075")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "지갑"; }
		  else if (ctg.equals("as076")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "헤어ACC"; }
		  else if (ctg.equals("as077")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "테크ACC"; }
		  else if (ctg.equals("as078")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "기타소품"; }

		
=======
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
>>>>>>> parent of cb6c30f (Commit_PJS PageNum, Category Setting)
		return categoryNames;
	}
}
