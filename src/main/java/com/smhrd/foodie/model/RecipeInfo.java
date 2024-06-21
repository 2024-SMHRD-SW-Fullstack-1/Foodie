package com.smhrd.foodie.model;

import lombok.Data;

@Data
public class RecipeInfo {
	private String recipe_name;
	private String recipe_title_img;
	private int recipe_views_cnt;
	private String recipe_content;
}
