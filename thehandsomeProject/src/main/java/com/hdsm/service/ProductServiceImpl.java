package com.hdsm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.persistence.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	// 스프링 4.3 이상부터 autowire 안해도 자동 처리 된대
	@Autowired
	private ProductMapper mapper;

	public List<ProductVO> getList(ProductVO product) {
		return mapper.getList(product);
	}

	@Override
	public List<ThumbnailVO> getProductThumbnailListWithPaging(ProductVO vo, Criteria cri) {
		//ProductVO 는 controller에서 인자로 받을꺼임 (일단은 RequestParam 나중에 경로로 하든 뭐든 바꾸보자)
		//cri는 Getmapping에서 param으로 넘겨받아 옴
		
		
		//첫번째 mapper사용은 카테고리별, 페이징 별 product정보를 담아옴 => ThumbnailVO(pid, bname, pname, pprice, colorList{이놈은 아래서 가져옴})
		List<ThumbnailVO> Productlist = mapper.getListWithPaging(vo, cri);
		List<String> productIDs = new ArrayList<String>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ThumbnailVO"객체의 pid를 따로 productIDs에 저장 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
			product.setColorList(new ArrayList<ThumbnailColorVO>());
		});
		//두번째 mapper사용은 이제 제품코드(pid)의 컬러들을 List형태로 가져와서 위에 colorList에 넣을꺼
		List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
		
		//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
		for ( ThumbnailColorVO cvo : colorlist){
			for ( ThumbnailVO pvo : Productlist){
				if( pvo.getPid().equals(cvo.getProduct_pid())) {
					pvo.getColorList().add(cvo);
				}
			}//end for
		}//end for
	
		log.info(Productlist);
		
		return Productlist;
	}

	@Override
	public int productCount(ProductVO vo) {
		return mapper.productCount(vo);
	}

	
}
