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

import com.aurospaces.neighbourhood.bean.BodyTypeBean;
import com.aurospaces.neighbourhood.db.dao.BodyTypeDao;

@Controller
@RequestMapping(value="/admin")
public class BodyTypeController {
	private Logger logger = Logger.getLogger(BodyTypeController.class);
	@Autowired
	BodyTypeDao objBodyTypeDao;

	@RequestMapping(value = "/BodyTypeHome")
	public String bodyTypeHome(@ModelAttribute("bodyTypeForm") BodyTypeBean objBodyTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("BodyTypeHome Page");
		List<BodyTypeBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objBodyTypeDao.getAllBodyTypes();
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
			logger.fatal("error in BodyTypeController class bodyTypeHome method");
			return "bodyTypeHome";
		}
		return "bodyTypeHome";
	}
	@RequestMapping(value = "/addBodyType")
	public  String addBodyType(@Valid @ModelAttribute("bodyTypeForm")BodyTypeBean objBodyTypeBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
//		System.out.println("addBodyType page...");
		int id = 0;
//		model.put("userForm", user);
		try {
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "bodyTypeHome";
			}
			objBodyTypeBean.setStatus("1");
			BodyTypeBean bodyTypeBean = objBodyTypeDao.getByName(objBodyTypeBean);
			int dummyId =0;
			if(bodyTypeBean != null){
				dummyId = bodyTypeBean.getId();
			}
			if(objBodyTypeBean.getId() != 0)
			{
				id = objBodyTypeBean.getId();
				if(id == dummyId || bodyTypeBean == null )
				{
					objBodyTypeDao.save(objBodyTypeBean);
					redir.addFlashAttribute("msg", "Body Type Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				}
				else
				{
					redir.addFlashAttribute("msg", "Already Body Type Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if(objBodyTypeBean.getId() == 0 && bodyTypeBean == null)
			{
				objBodyTypeDao.save(objBodyTypeBean);
				redir.addFlashAttribute("msg", "Body Type Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if(objBodyTypeBean.getId() == 0 && bodyTypeBean != null)
			{
				redir.addFlashAttribute("msg", "Already Body Type Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
			//redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in BodyTypeController class addBodyType method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:BodyTypeHome";
	}
	@RequestMapping(value = "/deleteBodyType")
	public @ResponseBody String deleteBodyType( BodyTypeBean objBodyTypeBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
//		System.out.println("deleteBodyType page...");
		List<BodyTypeBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objBodyTypeBean.getId() != 0){
 				delete = objBodyTypeDao.delete(objBodyTypeBean.getId());
 				if(delete){
 					jsonObj.put("message", "yes");
 				}else{
 					jsonObj.put("message", "no");
 				}
 			}
 				
 			listOrderBeans = objBodyTypeDao.getAllBodyTypes();
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
			logger.fatal("error in BodyTypeController class deleteBodyType method");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}
