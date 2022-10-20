package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.util.ProductUtil;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest3 {
	
	@Autowired
	private MemberMapper2 mapper2;
	private MemberMapper mapper;
	
	//@Test
//	public void testGetSb() {
//		List<MemberSbagDTO> mslist = new ArrayList<MemberSbagDTO>();
//		MemberSbagDTO dto = new MemberSbagDTO();
//		String mid="asd"; 
//		String pid = "MN2CAQOT461W"; 
//		String psize= "76";
//		String pcolor="BROWN";
//		int pamount=1;
//		
//		dto.setMid(mid);
//		dto.setPid(pid);
//		dto.setPcolor(pcolor);
//		dto.setPsize(psize);
//		dto.setPamount(pamount);
//		
//		mslist.add(dto);
//		
//		mapper2.deleteShoppingBag(mslist);
//		
//	}
	@Test
	public void testCountSB() {
		String as = "asd";
		mapper.getShoppingBagCount(as);
		
	}
}
