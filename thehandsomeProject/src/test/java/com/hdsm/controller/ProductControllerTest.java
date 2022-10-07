package com.hdsm.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.PageDTO;
import com.hdsm.persistence.ProductMapperTest;
import com.hdsm.service.ProductService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductControllerTest {
	private ProductService service;
	
	/*
	 * @Test public void list() { Criteria cri = new Criteria(12, ); log.info("list"
	 * + cri); service.getList(cri); //PageDTD 구성하기 위해 전체데이터 수 필요해서 임의의값 123 지정 new
	 * PageDTO(cri, 123); }//end list
	 */
}
