package com.yaohuifilm.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;

import com.yaohuifilm.controller.*;
import com.yaohuifilm.model.*;

/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-4-24 下午3:20
 */
public class PlConfig extends JFinalConfig {

    /**
     * 配置常量
     */
    public void configConstant(Constants me) {
        // 加载少量必要配置，随后可用getProperty(...)获取值
        loadPropertyFile("./classes/pl_config.txt");

        me.setDevMode(getPropertyToBoolean("devMode", false));
    }

    /**
     * 配置路由 Controller层
     */
    public void configRoute(Routes me) {
        me.add("/", IndexController.class);
        me.add("/film",FilmController.class,"/");
        me.add("/admin",AdminController.class,"/admin");
    }

    /**
     * 配置插件 映射Model层
     */
    public void configPlugin(Plugins me) {
        // 配置C3p0数据库连接池插件
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
        me.add(c3p0Plugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);
        // 映射表到模型
        arp.addMapping("tb_admin", Admin.class);
        arp.addMapping("tb_film", Film.class);
        arp.addMapping("tb_genre", Genre.class);
        arp.addMapping("tb_film_genre",FilmGenre.class);
    }

    /**
     *
     * 配置全局拦截器
     */
    public void configInterceptor(Interceptors me) {

    }

    /**
     * 配置处理器
     */
    public void configHandler(Handlers me) {
    }
}
