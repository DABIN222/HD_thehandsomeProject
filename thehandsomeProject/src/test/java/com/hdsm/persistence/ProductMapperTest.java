package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.util.ProductUtil;

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
		String[] asd = new String[3];
		asd[0] = "남성";
		vo.setClarge(asd[0]);
		vo.setCmedium(asd[1]);
		
		String str = "1_123_1.5_1_100000.300000_3";
		String[] filterArr = str.split("_");
		
		List<String> fbnames = ProductUtil.builder().build().getBnameFilter(filterArr[2]);
		String fcolor = ProductUtil.builder().build().getColorFilter(filterArr[3]);
		List<String> fsizes= ProductUtil.builder().build().getSizeFilter(filterArr[4]);
		List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(filterArr[5]);
		String forderBy = ProductUtil.builder().build().getOrderbyFilter(filterArr[6]);
		
		FilterDTO fd = new FilterDTO();
		fd.setBnames(fbnames);
		fd.setColor(fcolor);
		fd.setSizes(fsizes);
		fd.setPrice(fprice);
		fd.setOrderBy(forderBy);
		
		List<ProductVO> Productlist = mapper.getListWithPaging(vo, cri, fd);
		List<String> productIDs = new ArrayList<String>();
		
		//실제로 담을 List
		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
			ThumbnailVO tn = new ThumbnailVO();
			tn.setPid(product.getPid());
			tn.setBname(product.getBname());
			tn.setPname(product.getPname());
			tn.setPprice(product.getPprice());			
			//size를 String -> 배열 -> List로
			List<String> psizes = Arrays.asList(
					ProductUtil.builder().build().getSizeList(product.getP_size()));
			tn.setP_size(psizes);
			tn.setColorList(new ArrayList<ThumbnailColorVO>());
		});
		List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
		
		//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
		for ( ThumbnailColorVO cvo : colorlist){
			for ( ThumbnailVO pvo : Thumbnails){
				if( pvo.getPid().equals(cvo.getProduct_pid())) {
					pvo.getColorList().add(cvo);
				}
			}//end for
		}//end for
	
		for ( ThumbnailVO i : Thumbnails){
			log.info(i);
		}//end for
	}//end testP

	//@Test
	public void testProductCount() {
		ProductVO vo = new ProductVO();
		String[] asd = new String[3];
		asd[0] = "남성";
		vo.setClarge(asd[0]);
		vo.setCmedium(asd[1]);
		
		
		log.info(mapper.productCount(vo));
	}

}
