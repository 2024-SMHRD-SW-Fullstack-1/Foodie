package com.smhrd.foodie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smhrd.foodie.mapper.RecipeInfoMapper;
import com.smhrd.foodie.model.RecipeInfo;

@Controller
public class RecipeController {

    // Autowired 애노테이션을 사용하여 RecipeInfoMapper 의존성을 주입합니다.
    @Autowired
    RecipeInfoMapper mapper;

    // 루트 URL "/"에 대한 GET 요청을 처리하는 메소드입니다.
    @GetMapping("/")
    public String showRecipes(Model model) {
        // 인기 있는 레시피 목록을 데이터베이스에서 가져옵니다.
        List<RecipeInfo> popularList = mapper.findPopularRecipes();
        // 새로운 레시피 목록을 데이터베이스에서 가져옵니다.
        List<RecipeInfo> newList = mapper.findNewRecipes();
        // 모든 레시피 목록을 데이터베이스에서 가져옵니다.
        List<RecipeInfo> recommendedList = mapper.findRecommendedRecipes();
        
        // 가져온 목록을 뷰에서 사용할 수 있도록 모델에 추가합니다.
        model.addAttribute("popularList", popularList);
        model.addAttribute("newList", newList);
        model.addAttribute("recommendedList", recommendedList);
        
        // 인기 있는 레시피 목록을 콘솔에 출력합니다.
        System.out.println(popularList);
        
        // "index.jsp" 파일을 반환합니다.
        return "index";
    }
}
