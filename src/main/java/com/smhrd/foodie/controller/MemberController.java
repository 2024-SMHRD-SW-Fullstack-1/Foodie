package com.smhrd.foodie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.Member;
	
@Controller
public class MemberController {
	
	@Autowired
	MemberMapper mapper;
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	// 회원가입 실행 메소드
	@RequestMapping(value = "/userJoin", method = RequestMethod.POST)
	public String userJoin(@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("pwck") String pwck, @RequestParam("email") String email,
			@RequestParam("tel") String tel, @RequestParam("addr") String addr) {
		
		
		System.out.println("응답받은 ID : " + id);
		System.out.println("응답받은 PW : " + pw);
		System.out.println("응답받은 PWCK : " + pwck);
		System.out.println("응답받은 email : " + email);
		System.out.println("응답받은 tel : " + tel);
		System.out.println("응답받은 addr : " + addr);
		
		
		
		Member member = new Member(id, pw, pwck, email, tel, addr);
		
		System.out.println("member 값 : " + member);
		
		// sql문 실행
		// 1. mapper에 있는 userJoin 메소드 실행
		// 흐름 : contoller -> 인터페이스 -> xml -> controller로 값 반환
		int row = mapper.userJoin(member);
		
		System.out.println(row);
		
		if(row > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "login";
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	// 로그인 확인 메소드
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String loginCheck() {
		
		
		
		return "index";
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "mypage";
	}
	
	// 찜목록 페이지
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist() {
		return "wishlist";
	}

	// 마이페이지에서 회원 정보 변경 페이지
	@RequestMapping(value = "/edituserinfo", method = RequestMethod.GET)
	public String edituserinfo() {
		return "edituserinfo";
	}

	// 알러지 페이지
	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy() {
		return "allergy";
	}
	
	// 회원탈퇴 페이지
	@RequestMapping(value = "/deleteuserinfo", method = RequestMethod.GET)
	public String deleteuserinfo() {
		return "deleteuserinfo";
	}
	
	// 비밀번호 변경 페이지
	@RequestMapping(value = "/editpw", method = RequestMethod.GET)
	public String editpw() {
		return "editpw";
	}



	

}
