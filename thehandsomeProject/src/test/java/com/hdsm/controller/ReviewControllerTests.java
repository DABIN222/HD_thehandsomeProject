/*
 	ReviewControllerTests.java
	작성자 : 정구현
	최초 생성일 : 2022-10-19
	작업내역:  2022-10-19
*/
package com.hdsm.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class ReviewControllerTests {

	@Autowired
	private ReviewMapper reviewmapper;	//ReviewMapper.java 인터페이스 의존성 주입
	
	
}
