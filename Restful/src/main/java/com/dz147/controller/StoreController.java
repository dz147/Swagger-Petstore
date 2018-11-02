package com.dz147.controller;

import com.dz147.dao.OrdersMapper;
import com.dz147.entity.Orders;
import com.dz147.entity.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private OrdersMapper ordersMapper;

    //添加订单
    @RequestMapping(value = "/store/order", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String orderAdd(@RequestBody Orders orders){
        ordersMapper.insert(orders);
        return "redirect:/store";
    }

    //通过ID查找订单
    @RequestMapping(value = "/store/select/{id}", method = RequestMethod.GET, produces = "application/xml")
    @ResponseBody
    public String orderById(@PathVariable("id")int id,Model model){
        Orders orders = ordersMapper.selectByPrimaryKey(id);
        model.addAttribute("orders",orders);
        return "redirect:/store";
    }

    //通过ID查找订单
    @RequestMapping(value = "/store/delete/{id}", method = RequestMethod.DELETE, produces = "application/xml")
    @ResponseBody
    public String orderDeleteById(@PathVariable("id")int id,Model model){
        ordersMapper.deleteByPrimaryKey(id);
        return "redirect:/store";
    }



}
