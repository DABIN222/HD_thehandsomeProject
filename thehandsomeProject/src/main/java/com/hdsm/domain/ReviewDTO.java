package com.hdsm.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class ReviewDTO {
	private int rno;
	private String mid;
	private String mname;
	private String pid;
	private String pname;
	private String pcolor;
	private String psize;
	private int gno;
	private String gname;
	private int rage;
	private int rheight;
	private int rfigure;
	private int roption1;
	private int roption2;
	private int roption3;
	private int roption4;
	private String rcontent;
	private int rrate;
	private Date rdate;
	private String rimage1;
	private String rimage2;
	private String rimage3;
	private String rimage4;
}
