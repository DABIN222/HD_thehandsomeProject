package com.hdsm.security.domain;

import java.awt.List;
import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CustomUser  extends User{
	
	//Serialization
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	private int usersWishCount;// nav 바에서 갯수 보여주기위해 
	private int usersShoppingBagCount;// // nav 바에서 갯수 보여주기위해
	
	
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}//end CustomUser...
	
	
	public CustomUser(MemberVO vo) {
		
		super(vo.getMid()
	         ,vo.getMpassword()
			 ,vo.getAuthList()
			  .stream()
			  .map( auth -> new SimpleGrantedAuthority(auth.getAuthority()))
			  .collect(Collectors.toList())				
		);//end super
		
		this.member = vo;
	
		log.info(vo);
	}//end CustomUser
	
}//end class
