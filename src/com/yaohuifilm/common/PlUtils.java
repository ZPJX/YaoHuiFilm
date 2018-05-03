package com.yaohuifilm.common;

import com.jfinal.kit.PathKit;

import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-5-1 上午9:34
 */
public class PlUtils {
    public static final String Short(String src,int count){
        if(null==src ||"".equals(src.trim())){
            return "";
        }
        if(count<=0){
            return src.trim();
        }
        if(src.trim().length()>count){
            return src.trim().substring(0,count);
        }else{
            return src.trim();
        }
    }
    public static final String Short(String src,int count,String append){
        if(null==src ||"".equals(src.trim())){
            return "";
        }
        if(count<=0){
            return src.trim();
        }
        if(src.trim().length()>count){
            return src.trim().substring(0,count)+append;
        }else{
            return src.trim();
        }
    }
    
    public static final String ChangeGenre(String src){
        if(null==src || "".equals(src.trim())){
            return "";
        }
        src = src.substring(1,src.length());
        String []gs = src.split("_");
        String rus = "";
        for(String g:gs){
            rus += " "+g+" /";
        }
        if(rus.length()>1){
            rus = rus.substring(0,rus.length()-1);
        }
        return rus;
    }
    
    public static final String CheckPicUrl(String pic){
        if(null==pic || "".equals(pic.trim())){
            return "/poster/default.png";
        }else{
            return pic.trim();
        }
    }
    
    public static final String CheckDate(String date){
        if(null==date || "".equals(date.trim())){
            return "1000-01-01";
        }else{
            return date.trim();
        }
    }
    
    public static final boolean CheckFileExt(File fin,String exts){
        if(fin==null){
            return false;
        }
        if(exts==null){
            return true;
        }
        
        String ext = fin.getName().substring(fin.getName().lastIndexOf('.')+1,fin.getName().length());
        String []el = exts.split(",");
        for(String e:el){
            if(ext.equals(e)){
                return true;
            }
        }
        return false;
    }
    
    public static final boolean DeleteFile(String url){
        File df = new File(PathKit.getWebRootPath()+url);
        if(df.exists()){
            df.delete();//删除海报图片
            return true;
        }else{
            return false;
        }
    }
}
