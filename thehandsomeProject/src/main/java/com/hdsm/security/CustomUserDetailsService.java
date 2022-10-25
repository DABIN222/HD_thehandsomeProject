package com.hdsm.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.ProductMapper;
import com.hdsm.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	
	@Autowired
	private MemberMapper membermapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName :" +username);
		MemberVO vo = membermapper.read(username);
		log.warn("Query by memebr maper :" +vo);
		
		if(vo != null) {
//			int wscount = membermapper.getWishListCount(username);
//			int sbcount = membermapper.getShoppingBagCount(username);
//			
			CustomUser customuser = new CustomUser(vo);
//			customuser.setUsersWishCount(wscount);
//			customuser.setUsersShoppingBagCount(sbcount);
			
			return customuser;
		}
		
		return null;
	}//end loadUserByUsern...



}//end class
