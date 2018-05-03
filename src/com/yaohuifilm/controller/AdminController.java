package com.yaohuifilm.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.render.JsonRender;
import com.yaohuifilm.common.PlUtils;
import com.yaohuifilm.model.*;
import com.yaohuifilm.validator.AddFilmValidator;
import com.yaohuifilm.validator.EditFilmValidator;
import com.yaohuifilm.validator.LoginValidator;
import com.jfinal.upload.*;

import javax.print.attribute.standard.DateTimeAtCompleted;
import java.io.File;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-4-28 下午12:43
 */
public class AdminController extends Controller{

    /*
        主页action
     */
    public void index(){
        if(null == getSessionAttr("USERNAME")){
            setAttr("nameMsg","您还为登录");
            forwardAction("/admin/login_view");
            return;
        }
        setAttr("username",getSessionAttr("USERNAME"));
        render("Admin.html");
    }

    /*
        登录显示action
     */
    public void login_view(){
        if(null != getSessionAttr("USERNAME")){
            System.out.println(getSessionAttr("USERNAME").toString());
            forwardAction("/admin");
            return;
        }
        if(!"NONE".equals(getCookie("USERNAME","NONE"))){
            setAttr("username",getCookie("USERNAME"));
            setAttr("password",getCookie("PASSWORD"));
            setAttr("remember","checked");
        }else{
            setAttr("username","");
            setAttr("password","");
            setAttr("remember","");
        }

        render("Login.html");
    }

    /*
        登录验证action
     */
    @Before(LoginValidator.class)
    public void login(){
        List<Admin> ba = Admin.dao.find("select * from tb_admin where username='" + getPara("username") + "'");
        if(ba.size()>0){
            if(ba.get(0).getStr("password").equals(getPara("password"))){
                setSessionAttr("USERNAME",getPara("username"));
                if("remember-me".equals(getPara("remember"))){
                    setCookie("USERNAME",getPara("username"),3600*24*360);
                    setCookie("PASSWORD",getPara("password"),3600*24*360);
                }else{
                    setCookie("USERNAME","",0);
                    setCookie("PASSWORD","",0);
                }
                forwardAction("/admin");
                return ;
            }
        }
        setAttr("nameMsg","用户名或密码错误");
        forwardAction("/admin/login_view");
    }

    /*
        登出action
     */
    public void logout(){
        getSession().invalidate();
        forwardAction("/admin/login_view");
    }

    /*
        打开电影管理页action
     */
    public void filmmanager(){
        String sql;
        if(null==getPara(0)||"0".equals(getPara(0))||"null".equals(getPara(0))){
            sql = "from tb_film order by id desc";
            setAttr("selectId","0");
        }else{
            sql = "from tb_film t1 where t1.id in (select t2.id_film from tb_film_genre t2 where t2.id_genre='"+getPara(0)+"') order by t1.id desc";
            setAttr("selectId",getPara(0));
        }
        setAttr("genreList", Genre.dao.find("select * from tb_genre"));

        Page<Film> p = Film.dao.paginate(1, 10, "select * ", sql);
        int curPage = null==getPara(1)? 1:getParaToInt(1);
        if(curPage<1){
            curPage = 1;
        }else if(curPage>p.getTotalPage()){
            if(0!=p.getTotalPage()) curPage = p.getTotalPage();
        }

        setAttr("filmPage", Film.dao.paginate(curPage, 10, "select * ", sql));
        render("FilmManager.html");
    }

    /*
        上传海报
     */
    public void uploadposter(){
        try{
            UploadFile uf = getFile("filedata", PathKit.getWebRootPath()+"\\poster");

            if(!PlUtils.CheckFileExt(uf.getFile(),"jpg,png,gif")){
                setAttr("success",false);
                setAttr("message","非法的文件格式");
                uf.getFile().delete();
            }else{
                String newFileName = String.valueOf(System.currentTimeMillis())+uf.getFile().getName().substring(uf.getFile().getName().lastIndexOf('.'),uf.getFile().getName().length());
                String newFilePath = PathKit.getWebRootPath()+"\\poster\\";
                uf.getFile().renameTo(new File(newFilePath+newFileName));
                setAttr("success", true);
                setAttr("message","上传成功");
                setAttr("filename",newFileName);
                setAttr("filepath","/poster/"+newFileName);
            }
        }catch (Exception e){
            e.printStackTrace();
            setAttr("success",false);
            setAttr("message","上传出错");
        }
        render(new JsonRender().forIE());
    }

    /*
        添加电影
     */
    @Before(AddFilmValidator.class)
    public void addfilm(){
        String successMsg = "添加成功";
        String errorMsg = null;
        try{
            //类别名分词
            String genres = getPara("addFilmGenre");
            String rus = "";
            if(null==genres || genres.trim().length()<=1){
                rus = "";
            }else{
                genres = genres.substring(1,genres.length());
                String []gs = genres.split("_");

                for(String g:gs){
                    rus += " "+g+" /";
                }
                if(rus.length()>1){
                    rus = rus.substring(0,rus.length()-1);
                }
            }
            //保存电影信息
            Film tmp = new Film();
            tmp.set("name",getPara("addFilmName"))
                    .set("director",getPara("addFilmDirector"))
                    .set("year",PlUtils.Short(getPara("addFilmDate"),4))
                    .set("pic", PlUtils.CheckPicUrl(getPara("addFilmPic")))
                    .set("stars",getPara("addFilmStars"))
                    .set("genre",rus)
                    .set("region",getPara("addFilmRegion"))
                    .set("language",getPara("addFilmLanguage"))
                    .set("length",getPara("addFilmLength"))
                    .set("date",PlUtils.CheckDate(getPara("addFilmDate")))
                    .set("summary", getPara("addFilmSummary"))
                    .set("url",getPara("addFilmUrl"))
                    .save();
            //类别id分词  并加入tb_film_genre
            int id = Integer.valueOf(tmp.get("id").toString());
            String genresId = getPara("addFilmGenreId");
            if(null==genresId || genresId.trim().length()<=1){

            }else{
                genresId = genresId.substring(1,genresId.length());
                String []gs = genresId.split("_");

                for(String g:gs){
                    new FilmGenre().set("id_film",id)
                            .set("id_genre",Integer.valueOf(g))
                            .save();
                }
            }

        }catch (Exception e){
            successMsg = null;
            errorMsg = e.toString();
            e.printStackTrace();
        }
        setAttr("successMsg",successMsg);
        setAttr("errorMsg",errorMsg);
        forwardAction("/admin/filmmanager/"+getPara("selectId"));
    }

    /*
        编辑电影
     */
    @Before(EditFilmValidator.class)
    public void editfilm(){
        String successMsg = "编辑成功";
        String errorMsg = null;
        try{
            //类别名分词
            String genres = getPara("editFilmGenre");
            String rus = "";
            if(null==genres || genres.trim().length()<=1){
                rus = "";
            }else{
                genres = genres.substring(1,genres.length());
                String []gs = genres.split("_");

                for(String g:gs){
                    rus += " "+g+" /";
                }
                if(rus.length()>1){
                    rus = rus.substring(0,rus.length()-1);
                }
            }
            //保存电影信息
            Film tmp = Film.dao.findById(getParaToInt("editFilmId"));
            if(null!=tmp){
                if(!PlUtils.CheckPicUrl(getPara("editFilmPic")).equals(tmp.get("pic"))
                        && !"/poster/default.png".equals(tmp.get("pic"))){
                     PlUtils.DeleteFile(tmp.get("pic").toString());
                }
                tmp.set("name",getPara("editFilmName"))
                        .set("director",getPara("editFilmDirector"))
                        .set("year",PlUtils.Short(getPara("editFilmDate"),4))
                        .set("pic",PlUtils.CheckPicUrl(getPara("editFilmPic")))
                        .set("stars",getPara("editFilmStars"))
                        .set("genre",rus)
                        .set("region",getPara("editFilmRegion"))
                        .set("language",getPara("editFilmLanguage"))
                        .set("length",getPara("editFilmLength"))
                        .set("date",PlUtils.CheckDate(getPara("editFilmDate")))
                        .set("summary",getPara("editFilmSummary"))
                        .set("url",getPara("editFilmUrl"))
                        .update();
                //类别id分词  并加入tb_film_genre
                int id = Integer.valueOf(tmp.get("id").toString());
                String genresId = getPara("editFilmGenreId");
                if(null==genresId || genresId.trim().length()<=1){

                }else{
                    //删旧的类别
                    List<FilmGenre> fgl = FilmGenre.dao.find("select * from tb_film_genre where id_film='"+id+"'");
                    for(FilmGenre fg : fgl){
                        fg.delete();
                    }
                    //添加新的
                    genresId = genresId.substring(1,genresId.length());
                    String []gs = genresId.split("_");

                    for(String g:gs){
                        new FilmGenre().set("id_film",id)
                                .set("id_genre",Integer.valueOf(g))
                                .save();
                    }
                }
            }else{
                successMsg = null;
                errorMsg = "错误的ID";
            }

        }catch (Exception e){
            successMsg = null;
            errorMsg = e.toString();
            e.printStackTrace();
        }
        setAttr("successMsg",successMsg);
        setAttr("errorMsg",errorMsg);
        forwardAction("/admin/filmmanager/"+getPara("selectId"));
    }

    /*
       删除电影action
    */
    public void deletefilm(){
        String successMsg = "删除成功";
        String errorMsg = null;
        try{
            Film f = Film.dao.findById(getParaToInt(0));
            if(f!=null){
                String pic = f.get("pic");
                if(!"/poster/default.png".equals(pic)){
                    PlUtils.DeleteFile(pic);
                }
                f.delete();
            }else{
                successMsg = null;
                errorMsg = "错误的电影ID";
            }
            
        }catch (Exception e){
            successMsg = null;
            errorMsg = e.toString();
            e.printStackTrace();
        }
        setAttr("successMsg",successMsg);
        setAttr("errorMsg",errorMsg);
        forwardAction("/admin/filmmanager/"+getPara(1));
    }

    /*
        预览电影
     */
    public void film_view(){
        String errorMsg = null;
        Film film = Film.dao.findById(getParaToInt(0));
        if(null != film){
            setAttr("film",film);
        }else{
            errorMsg = "错误的ID";
        }
        setAttr("errorMsg",errorMsg);
        render("FilmView.html");
    }
}
