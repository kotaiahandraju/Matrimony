package com.aurospaces.neighbourhood.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.StarBean;
import com.aurospaces.neighbourhood.db.dao.StarDao;

@Controller
@RequestMapping(value ="/admin")
public class StarController {
	private Logger logger = Logger.getLogger(StarController.class);
	@Autowired
	StarDao objStarDao;

	@RequestMapping(value = "/StarHome")
	public String starHome(@ModelAttribute("starForm") StarBean objStarBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		System.out.println("StarHome Page");
		List<StarBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objStarDao.getAllStars();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in StarController class starHome method  ");
			return "starHome";
		}
		return "starHome";
	}
	
	@RequestMapping(value = "/addStar")
	public String addStar(@Valid @ModelAttribute("starForm")StarBean objStarBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
		System.out.println("addStar page...");
		int id = 0;
//		model.put("userForm", user);
		try {
		
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "starHome";
			}
			objStarBean.setStatus("1");
			StarBean starBean = objStarDao.getByName(objStarBean);
			int dummyId =0;
			if(starBean != null){
				dummyId = starBean.getId();
			}
			if(objStarBean.getId() != 0)
			{
				id = objStarBean.getId();
				if(id == dummyId || starBean == null )
				{
					objStarDao.save(objStarBean);
					redir.addFlashAttribute("msg", "Successfully Star Updated");
				}
				else
				{
					redir.addFlashAttribute("msg", "Already Record Exists");
				}
			}
			if(objStarBean.getId() == 0 && starBean == null)
			{
				objStarDao.save(objStarBean);
				redir.addFlashAttribute("msg", "Successfully Star Added");
			}
			if(objStarBean.getId() == 0 && starBean != null)
			{
				redir.addFlashAttribute("msg", "Already Record Exists");
			}
			//redir.addFlashAttribute("msg", "Successfully Star Added");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in StarController class addStar method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:StarHome";
	}
	@RequestMapping(value = "/deleteStar")
	public @ResponseBody String deleteStar( StarBean objStarBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println("deleteStar page...");
		List<StarBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objStarBean.getId() != 0){
 				delete = objStarDao.delete(objStarBean.getId());
 				if(delete){
 					jsonObj.put("message", "Deleted");
 				}else{
 					jsonObj.put("message", "Delete Fail");
 				}
 			}
 				
 			listOrderBeans = objStarDao.getAllStars();
			 objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		}catch(Exception e){
			e.printStackTrace();
	System.out.println(e);
			logger.error(e);
			logger.fatal("error in StarController class deleteStar method");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
}
