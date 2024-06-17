package com.smhrd.personalrecipe.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// ChatGPT API
	@Value("${openai.api.key}")
  private String openaiApiKey;
	
	// ChatGPT API Key 출력
	public void showApiKey() {
		System.out.println("api.key : " + openaiApiKey);
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		showApiKey();
		return "index";
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart() {
		return "shopping-cart";
	}
	
	@RequestMapping(value="/shopgrid", method=RequestMethod.GET)
	public String shopGrid() {
		return "shop-grid";
	}
	
	@RequestMapping(value="/shopdetail", method=RequestMethod.GET)
	public String shopDetail() {
		return "shop-details";
	}
	
	@RequestMapping(value="/recipe", method=RequestMethod.GET)
	public String recipe() {
		return "recipe";
	}
	
	@RequestMapping(value="/recipedetail", method=RequestMethod.GET)
	public String recipeDetail() {
		return "recipe-details";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String myPage() {
		return "mypage";
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public String checkout() {
		return "checkout";
	}
	
//	@Controller
//	public class ChatbotController {
//
//	    @GetMapping("/chatbot")
//	    public String chatbot(Model model) {
//	        model.addAttribute("initMessage", "�ȳ��ϼ���? � �����Ǹ� ��õ�ص帱���?");
//	        return "chatbot";
//	    }
//	}
	
	// ChatGPT API
	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
	    restTemplate.getInterceptors().add((request, body, execution) -> {
	        request.getHeaders().add("Authorization", "Bearer " + openaiApiKey);
	        return execution.execute(request, body);
	    });
		return restTemplate;
	}
	
}
