package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.RecipeIngreMapper;
import com.smhrd.foodie.model.Recipe;

@Controller
public class HomeController {
	
	@Autowired
	RecipeIngreMapper mapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
    // 인기 있는 레시피 목록을 데이터베이스에서 가져옵니다.
    List<Recipe> popularList = mapper.findPopularRecipes();
    // 모든 레시피 목록을 데이터베이스에서 가져옵니다.
    List<Recipe> recommendedList = mapper.findRecommendedRecipes();
    // 새로운 레시피 목록을 데이터베이스에서 가져옵니다.
    List<Recipe> newList = mapper.findNewRecipes();
    
    // 가져온 목록을 뷰에서 사용할 수 있도록 모델에 추가합니다.
    model.addAttribute("popularList", popularList);
    model.addAttribute("recommendedList", recommendedList);
    model.addAttribute("newList", newList);
    
		return "index";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	// 마이페이지에서 회원 정보 변경 페이지
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		return "update";
	}
	
	@RequestMapping(value = "/update-pw", method = RequestMethod.GET)
	public String updatePw() {
		return "update-pw";
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "delete";
	}

	@RequestMapping(value = "/ingre-grid", method = RequestMethod.GET)
	public String shopGrid() {
		return "ingre-grid";
	}

	@RequestMapping(value = "/ingre-detail", method = RequestMethod.GET)
	public String shopDetail() {
		return "ingre-detail";
	}

	@RequestMapping(value = "/recipe-grid", method = RequestMethod.GET)
	public String recipe() {
		return "recipe-grid";
	}

	@RequestMapping(value = "/recipe-detail", method = RequestMethod.GET)
	public String recipeDetail() {
		return "recipe-detail";
	}

	// 챗봇 페이지
	@GetMapping("/chatbot")
	public String chatbot(Model model) {
		model.addAttribute("initMessage", "안녕하세요! 세계 최고의 요리사 푸 입니다.");
	  return "chatbot";
	}
	
}
