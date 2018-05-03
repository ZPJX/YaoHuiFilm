package com.yaohuifilm.controller;

import com.jfinal.core.Controller;
import com.yaohuifilm.model.*;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-5-10 下午6:09
 */
public class FilmController extends Controller{
    public void index(){
        String id = getPara(0);
        if(null==id || "".equals(id)){
            renderError(404);
        }else{
            Film film = Film.dao.findById(Integer.parseInt(id));
            if(null==film){
                renderError(404);
            }else{
                setAttr("film",film);
                render("FilmView.html");
            }
        }
    }
    
    public void like(){
        String id = getPara(0);
        if(null==id || "".equals(id)){
            renderText("ERR");
        }else{
            Film film = Film.dao.findById(Integer.parseInt(id));
            if(null==film){
                renderText("ERR");
            }else{
                film.set("like",film.getInt("like")+1);
                film.update();
                renderText(film.getInt("like").toString());
            }
        }
    }
    public void watching(){
        String id = getPara(0);
        if(null==id || "".equals(id)){
            renderText("ERR");
        }else{
            Film film = Film.dao.findById(Integer.parseInt(id));
            if(null==film){
                renderText("ERR");
            }else{
                film.set("watching",film.getInt("like")+1);
                film.update();
                renderText(film.getInt("watching").toString());
            }
        }
    }
    public void watched(){
        String id = getPara(0);
        if(null==id || "".equals(id)){
            renderText("ERR");
        }else{
            Film film = Film.dao.findById(Integer.parseInt(id));
            if(null==film){
                renderText("ERR");
            }else{
                film.set("watched",film.getInt("watched")+1);
                film.update();
                renderText(film.getInt("watched").toString());
            }
        }
    }
}
