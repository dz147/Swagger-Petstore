package com.dz147.controller;

import com.dz147.dao.UserMapper;
import com.dz147.entity.Pet;
import com.dz147.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    //添加用户 POST方式 JSON格式
    @RequestMapping(value = "/user/add", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String userAdd(@RequestBody User user){
        userMapper.insert(user);
        return "redirect:/user";
    }

    //批量添加用户 POST方式 JSON格式
    @RequestMapping(value = "/user/addAll", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String userAllAdd(@RequestBody List<User> user){
        for(User u: user){
            userMapper.insert(u);
        }
        return "redirect:/user";
    }

    //登录需要得到账号或密码
    @RequestMapping(value = "/user/logUser", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String userLog(@RequestBody User user){
       //userMapper.logUser(user.getLastName(),user.getPassword());
        return "redirect:/user";
    }

    //修改用户
    @RequestMapping(value = "/user/userUpdate", method = RequestMethod.PUT, produces = "application/xml")
    @ResponseBody
    public String userUpdate(@RequestBody User user){
        userMapper.updateByPrimaryKey(user);
        return "redirect:/user";
    }

    //删除用户
    @RequestMapping(value = "/user/delete/{id}", method = RequestMethod.DELETE, produces = "application/xml")
    @ResponseBody
    public String userDelete(@RequestBody User user){
        userMapper.deleteByPrimaryKey(user.getId());
        return "redirect:/user";
    }
}
