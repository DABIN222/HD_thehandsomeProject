package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {

	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void testPaging() {// 페이징으로 목록 가져오는지 확인
		Criteria cri = new Criteria();
		
		ProductVO vo = new ProductVO();
		vo.setClarge("여성");
		vo.setCmedium("아우터");
		List<ThumbnailVO> Productlist = mapper.getListWithPaging(vo, cri);
		
		List<String> productIDs = new ArrayList<String>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ThumbnailVO"객체의 pid를 따로 productIDs에 저장 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
			product.setColorList(new ArrayList<ThumbnailColorVO>());
		});
		List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
		
		//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
		for ( ThumbnailColorVO cvo : colorlist){
			for ( ThumbnailVO pvo : Productlist){
				if( pvo.getPid().equals(cvo.getProduct_pid())) {
					pvo.getColorList().add(cvo);
				}
			}//end for
		}//end for
	
		
		for ( ThumbnailVO i : Productlist){
			log.info(i);
		}//end for
		
		
		
//		list.forEach(board -> log.info(board));
//		for ( ThumbnailVO i : list){
//			log.info(i);
//		}//end for

		
	}//end testP


}
