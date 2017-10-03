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

import com.aurospaces.neighbourhood.bean.LanguageBean;
import com.aurospaces.neighbourhood.db.dao.languageDao;


@Controller
@RequestMapping(value="/admin")
public class LanguageController {
	private Logger logger = Logger.getLogger(LanguageController.class);
	@Autowired
	languageDao objlanguageDao;

	@RequestMapping(value = "/LanguagesHome")
	public String LonguagesHome(@ModelAttribute("languagesForm") LanguageBean objLanguageBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		System.out.println("LonguagesHome Page");
		List<LanguageBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objlanguageDao.getAllLanguages();
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
			logger.fatal("error in LanguageController class longuagesHome method  ");
			return "languagesHome";
		}
		return "languagesHome";
	}
	@RequestMapping(value = "/addLanguages")
	public  String addBodyType(@Valid @ModelAttribute("languagesForm")LanguageBean objLanguageBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
		System.out.println("addLanguages page...");
		int id = 0;
//		model.put("userForm", user);
		try {
		
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "languagesHome";
			}
			objLanguageBean.setStatus("1");
			LanguageBean languageBean = objlanguageDao.getByName(objLanguageBean);
			int dummyId =0;
			if(languageBean != null){
				dummyId = languageBean.getId();
			}
			if(objLanguageBean.getId() != 0)
			{
				id = objLanguageBean.getId();
				if(id == dummyId || languageBean == null )
				{
					objlanguageDao.save(objLanguageBean);
					redir.addFlashAttribute("msg", "Updated");
				}
				else
				{
					redir.addFlashAttribute("msg", "AlreadyExist");
				}
			}
			if(objLanguageBean.getId() == 0 && languageBean == null)
			{
				objlanguageDao.save(objLanguageBean);
				redir.addFlashAttribute("msg", "inserted");
			}
			if(objLanguageBean.getId() == 0 && languageBean != null)
			{
				redir.addFlashAttribute("msg", "AlreadyExist");
			}
			//redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in LanguageController class addLonguages method  ");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:LanguagesHome";
	}
	@RequestMapping(value = "/deleteLanguage")
	public @ResponseBody String deleteLonguages( LanguageBean objLanguageBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println("deleteBodyType page...");
		List<LanguageBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objLanguageBean.getId() != 0){
 				delete = objlanguageDao.delete(objLanguageBean.getId());
 				if(delete){
 					jsonObj.put("message", "deleted");
 				}else{
 					jsonObj.put("message", "delete fail");
 				}
 			}
 				
 			listOrderBeans = objlanguageDao.getAllLanguages();
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
			logger.fatal("error in  LanguageController class deleteLonguages method  ");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
}

