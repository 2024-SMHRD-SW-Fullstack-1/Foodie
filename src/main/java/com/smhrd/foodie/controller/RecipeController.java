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

    @Autowired
    RecipeInfoMapper mapper;

    @GetMapping("/")
    public String showRecipes(Model model) {
    	List<RecipeInfo> popularList = mapper.findPopularRecipes();
    	List<RecipeInfo> newList = mapper.findNewRecipes();
    	List<RecipeInfo> allList = mapper.findAll();
    	
    	model.addAttribute("popularList", popularList);
    	model.addAttribute("newList", newList);
    	model.addAttribute("allList", allList);
    	
    	System.out.println(popularList);
    	
        return "index"; // "index.jsp" 파일을 반환
    }

}
