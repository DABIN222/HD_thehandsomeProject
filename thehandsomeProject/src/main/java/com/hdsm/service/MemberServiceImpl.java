package com.hdsm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.MemberWishListDTOforJsp;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.MemberMapper2;
import com.hdsm.persistence.ProductMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private ProductMapper productmapper;
	
//	@Autowired
//	private MemberMapper2 mapper2;

	// 회원 가입
	@Override
	public void insertMember(MemberVO member) {
		mapper.insertMember(member);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String memberId) {
		int cnt = mapper.idCheck(memberId);
		System.out.println("cnt : "+cnt);
		return cnt;
	}
	
	// 연락처 중복 확인
	@Override
	public int telCheck(String memberTel) {
		int cnt = mapper.telCheck(memberTel);
		System.out.println("cnt : "+cnt);
		return cnt;
	}

	// 로그인 
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	@Override
	public MemberVO getMember(String memberId) {
		
	return mapper.getMember(memberId);
	}
	
	@Override
	public List<MemberSbagDTOForJsp> getMemberShoppingBag(String mid) {
		
		List<MemberSbagDTO> dto = mapper.getMembersShoppingBag(mid);
		List<MemberSbagDTOForJsp> list = new ArrayList<MemberSbagDTOForJsp>();
		
		for ( MemberSbagDTO i : dto){
			String pid = i.getPid();
			ProductVO pvo = mapper.getShoppingBagsProduct(pid);
			List<ThumbnailColorVO> cvo = mapper.getProductsColor(pid);
			List<String> slist = new ArrayList<String>();
			
			for(String size : pvo.getP_size().split(",")) {
				slist.add(size.trim());
			}
			Collections.sort(slist);
			
			MemberSbagDTOForJsp insertdto = new MemberSbagDTOForJsp();
			
			String thumbnailImg = "";
			String colorcode = "";
			for ( ThumbnailColorVO j : cvo){
				if(j.getCname().equals(i.getPcolor())) {
					thumbnailImg = j.getC_thumbnail1();
					colorcode = j.getCcolorcode();
					break;
				}
			}
			insertdto.setPid(pid);
			insertdto.setColorcode(colorcode);
			insertdto.setThumbnail(thumbnailImg);
			insertdto.setBname(pvo.getBname());
			insertdto.setPname(pvo.getPname());
			insertdto.setScolor(i.getPcolor());
			insertdto.setSsize(i.getPsize());
			insertdto.setAmount(i.getPamount());
			insertdto.setPprice(pvo.getPprice());
			insertdto.setColorlist(cvo);
			insertdto.setSizeList(slist);
			list.add(insertdto);
		}
		return list;
	}
	
	@Override
	public void insertShoppingBags(MemberSbagDTO msVO) {
		mapper.insertShoppingBags(msVO);
	}

	@Override
	public int updateShoppingBag(MemberSbagDTO msVO) {
		int cnt = mapper.updateShoppingBag(msVO);
		return cnt;
	}
	

	@Override
	public int deleteShoppingBag(List<MemberSbagDTO> msList) {
		int cnt = mapper.deleteShoppingBag(msList);
		return cnt;
	}

	/*
	public int deleteShoppingBag(List<MemberSbagDTO> msBagDtoList) {
		int cnt = mapper.deleteShoppingBag(msBagDtoList);
		return cnt;
	};
	*/
	

	@Override
	public int selectShoppingBag(MemberSbagDTO msVO) {
		int select = mapper.selectShoppingBag(msVO);
		return select;
	}

	@Override
	public int getShoppingBagCount(String mid) {
		return mapper.getShoppingBagCount(mid);
	}

	@Override
	public int getWishListCount(String mid) {
		return mapper.getWishListCount(mid);
	}

	@Override
	public int insertWishList(MemberWishListDTO wsDTO) {
		return mapper.insertWishList(wsDTO);
	}

	@Override
	public int isinWishList(MemberWishListDTO wsDTO) {
		return mapper.isinWishList(wsDTO);
	}

	@Override
	public List<MemberWishListDTOforJsp> getUsersWishList(MemberWishListDTO wsDTO) {
		String mid = wsDTO.getMember_mid();//검색할 유저 아이디 가져오기		
		List<MemberWishListDTO> usersList = mapper.getUsersWishList(wsDTO);//해당유저의 wishlist Table안의 row들 전부가져오기
		
		List<MemberWishListDTOforJsp> wslistList = new ArrayList<MemberWishListDTOforJsp>();//목록에 뿌려질 item들을 담을 List생성
		
		for(MemberWishListDTO dto : usersList) {//검색된 Row을 돌면서 해당 pid에 맞는 product, color, size List들을 각각 구해서 MemberWishListDTOforJsp에 담아서 wslistList에 담음
			String pid = dto.getPid();
			MemberWishListDTOforJsp wsDTOforJsp = new MemberWishListDTOforJsp();
			
			ProductVO pvo = productmapper.getProduct(pid);
			List<ThumbnailColorVO> cvo = mapper.getProductsColor(pid);
			List<String> slist = new ArrayList<String>();
			for(String size : pvo.getP_size().split(",")) {
				slist.add(size.trim());
			}
			wsDTOforJsp.setPvo(pvo);
			wsDTOforJsp.setColorList(cvo);
			wsDTOforJsp.setSizeList(slist);
			
			wslistList.add(wsDTOforJsp);
		}
		
		return wslistList;
	}

	@Override
	public int deleteWishListItem(List<MemberWishListDTO> wsList) {
		return mapper.deleteWishListItem(wsList);
	}

}
