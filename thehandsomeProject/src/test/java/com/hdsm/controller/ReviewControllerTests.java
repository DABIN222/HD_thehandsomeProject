/*
 	ReviewControllerTests.java
	작성자 : 정구현
	최초 생성일 : 2022-10-19
	작업내역:  2022-10-19
*/
package com.hdsm.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

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
	private WebApplicationContext ctx;
		
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
	@Autowired
	private ReviewMapper reviewmapper;	//ReviewMapper.java 인터페이스 의존성 주입
	
	//@Test
	public void testReviewWrite() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.get("/review/reviewWrite")
//				.param("pageNum", "2")
//				.param("ctg", "we000")
//				.param("amount", "10")
//				.param("clarge", "남성")
//				.param("cmedium", "아우터")
//				.param("csmall", "코트")
				).andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}//end testList
	
	@Test
	@PreAuthorize("isAuthenticated()")
	public void testReviewList() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/reviewList")
				.param("pid", "SH2C9ASZ092M")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}//end testList
}
