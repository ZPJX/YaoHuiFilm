package com.yaohuifilm.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * Created by IntelliJ IDEA.
 * User: 涂耀辉  13-5-3 下午2:32
 */
public class AddFilmValidator extends Validator{
    @Override
    protected void validate(Controller c) {
        //To change body of implemented methods use File | Settings | File Templates.
        validateRequiredString("addFilmName","nameMsg","请输入演片名");
    }

    @Override
    protected void handleError(Controller c) {
        //To change body of implemented methods use File | Settings | File Templates.
        if(null!=c.getPara("selectId") && !"".equals(c.getPara("selectId"))){
            c.forwardAction("/admin/filmmanager/"+c.getPara("selectId"));
        }else{
            c.forwardAction("/admin/filmmanager");
        }
    }
}
