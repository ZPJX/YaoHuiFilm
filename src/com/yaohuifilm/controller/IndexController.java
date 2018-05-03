package com.yaohuifilm.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.yaohuifilm.model.*;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-4-24 下午3:30
 */
public class IndexController extends Controller {
    
    private static Logger log = Logger.getLogger(IndexController.class);
    public void index() {
        log.debug("Hello Debug");
        log.info("Hello Info");
        log.warn("Hello Warn");
        String genre = getPara(0);
        if(null==genre || "".equals(genre)){
            genre = "0";
        }
        setAttr("genre",genre);
        setAttr("genreList", Genre.dao.find("select * from tb_genre"));
        if("0".equals(genre)){
            setAttr("filmList", Film.dao.find("select * from tb_film"));
        }else{
            setAttr("filmList", Film.dao.find("select * from tb_film f where f.id in (select id_film from tb_film_genre where id_genre='"+genre+"')"));
        }
        render("/Index.html");
    }

    public void about(){
        render("/About.html");
    }

    public void contact(){
        render("/Contact.html");
    }
}
