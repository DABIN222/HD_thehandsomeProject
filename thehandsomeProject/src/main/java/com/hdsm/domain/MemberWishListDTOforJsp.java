package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberWishListDTOforJsp {
	private ProductVO pvo;
	private List<ThumbnailColorVO> colorList;
	private List<String> sizeList;
}
