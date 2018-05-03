package com.yaohuifilm.model;

import com.jfinal.plugin.activerecord.Model;
import com.yaohuifilm.common.PlUtils;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-4-30 下午8:18
 */
public class Film extends Model<Film>{
    public static final Film dao = new Film();

    public String getSubString(String key,int length){
        return PlUtils.Short(get(key).toString(),length);
    }
    public String getSubString(String key,int length,String append){
        return PlUtils.Short(get(key).toString(),length,append);
    }

    public String getEditGenreId(){
        List<FilmGenre> fgl = FilmGenre.dao.find("select * from tb_film_genre where id_film='"+get("id")+"'");
        String rus="";
        for(FilmGenre fg:fgl){
            rus += "_"+fg.get("id_genre");
        }
        return rus;
    }
    
    public String getEditGenre(){
        List<FilmGenre> fgl = FilmGenre.dao.find("select * from tb_film_genre where id_film='"+get("id")+"'");
        String rus="";
        for(FilmGenre fg:fgl){
            rus += "_"+Genre.dao.findById(fg.getInt("id_genre")).get("name");
        }
        return rus;
    }
}
