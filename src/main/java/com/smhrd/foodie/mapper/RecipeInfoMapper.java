package com.smhrd.foodie.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.smhrd.foodie.model.RecipeInfo;

@Mapper
public interface RecipeInfoMapper {

    @Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 5")
    List<RecipeInfo> findPopularRecipes();

    @Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 5")
    List<RecipeInfo> findNewRecipes();

    @Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 3")
    List<RecipeInfo> findAll();
}
