package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import com.shsxt.crm.model.ResultInfo;
import com.shsxt.crm.model.UserModel;
import com.shsxt.crm.query.UserQuery;
import com.shsxt.crm.service.UserService;
import com.shsxt.crm.vo.User;
import com.shsxt.crm.utils.LoginUserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;


    @GetMapping("queryUserByUserId")
    @ResponseBody
    public User queryUserByUserId(Integer userId) {
        return userService.selectByPrimaryKey(userId);
    }

    @RequestMapping("login")
    @ResponseBody
    public ResultInfo login(String userName, String userPwd) {
        UserModel userModel = userService.login(userName, userPwd);
        return success("用户登录成功",userModel);
    }

    @RequestMapping("updatePassword")
    @ResponseBody
    public ResultInfo updatePassword(HttpServletRequest request, String oldPassword, String newPassword, String confirmPassword) {
        userService.updateUserPassword(LoginUserUtil.releaseUserIdFromCookie(request), oldPassword, newPassword, confirmPassword);
        return success("密码更新成功");
    }



    @RequestMapping("index")
    public String index(){
        return "user";
    }


    @RequestMapping("save")
    @ResponseBody
    public ResultInfo saveUser(User user){
        user.getRoleIds().forEach(roleId ->{
            System.out.println(roleId);
        });
        userService.saveUser(user);
        return success("用户记录添加成功!");
    }

    @RequestMapping("list")
    @ResponseBody
   public Map<String,Object> queryUsersByParams(UserQuery userQuery){
        return userService.queryByParamsForDataGrid(userQuery);
    }

    @RequestMapping("update")
    @ResponseBody
    public ResultInfo updateUser(User user){
        userService.updateUser(user);
        return success("用户记录更新成功!");
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResultInfo deleteUser(@RequestParam(name = "id") Integer userId){
        userService.deleteUser(userId);
        return success("用户记录删除成功!");
    }

}
