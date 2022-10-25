package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.util.ProductUtil;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
@Log4j
@WebAppConfiguration
public class MemberMapperTest4 {
	
	@Autowired
	private MemberMapper2 mapper2;
	@Autowired
	private MemberMapper mapper;
	

	@Test
	public void testRead() {
		MemberVO vo = mapper.read("asd");	
		log.info(vo);		
		//vo.getAuthList().forEach( authVO -> log.info(authVO));		
		for ( MemberAuthVO  authVO: vo.getAuthList()  ) {
			log.info(authVO);			
		}//end for
		
	}//end testRead()


}
