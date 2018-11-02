package com.dz147.controller;

import com.dz147.dao.PetMapper;
import com.dz147.dao.UserMapper;
import com.dz147.entity.Pet;
import com.dz147.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.Path;
import java.util.List;

@Controller
@RequestMapping("/")
public class controller {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PetMapper petMapper;

    @RequestMapping(value = "/u")
    public String emp01(Model model){
        List<User> users = userMapper.selectAll();
        model.addAttribute("user",users);
        return "user";
    }

    //添加宠物 POST方式 JSON格式
    @RequestMapping(value = "/petAdd", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String petAdd(@RequestBody Pet pet, BindingResult result){
        if(result.hasErrors()){
            return "{\"msg\":\"405\",\"cause\":\"添加失败,无效的输入\"}";
        }
        int insert = petMapper.insert(pet);
        return "redirect:/pet";
    }


    //修改宠物宠物 PUT方式 JSON格式
    @RequestMapping(value = "/petUpdate", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public String petUpdate(@RequestBody Pet pet,BindingResult result){
        if(result.hasErrors()){
            return "{\"msg\":\"405\",\"cause\":\"修改失败,无效的输入\"}";
        }
        petMapper.updateByPrimaryKey(pet);
        return "redirect:/pet";
    }

    //通过状态查找宠物
    @RequestMapping(value = "/getByStatus/status",method = RequestMethod.GET)
    public String getByStatus(Model model, String status){
        List<Pet> pets = petMapper.selectByStatus(status);
        model.addAttribute(pets);
        return "redirect:/pet";
    }

    //通过ID查找宠物
    @RequestMapping(value = "/getPetById/{id}",method = RequestMethod.GET )
    public String getPetById(Model model,@PathVariable("id")int id){
        Pet pet = petMapper.selectByPrimaryKey(id);
        model.addAttribute(pet);
        return "redirect:/pet";
    }

    //form表单POST提交通过ID更新现有宠物
    @RequestMapping(value = "/UpPet/{id}",method = RequestMethod.POST )
    public String getUpdateById(Model model,@PathVariable("id")int id){
        Pet pet = petMapper.selectByPrimaryKey(id);
        model.addAttribute("pet",pet);
        return "redirect:/pet";
    }


    //删除一个宠物
    @RequestMapping(value = "/delPet/{id}",method = RequestMethod.DELETE )
    public String getDeleteById(Model model,@PathVariable("id")int id){
       petMapper.deleteByPrimaryKey(id);
        return "redirect:/pet";
    }

    //删除一个宠物
    @RequestMapping(value = "/UploadImage/{id}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public String getUploadImage(Model model,@PathVariable("id")int id,@RequestBody Pet pet){

        return "redirect:/pet";
    }

}
