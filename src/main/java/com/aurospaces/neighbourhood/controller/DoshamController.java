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

import com.aurospaces.neighbourhood.bean.DoshamBean;
import com.aurospaces.neighbourhood.db.dao.DoshamDao;

@Controller
@RequestMapping(value="/admin")
public class DoshamController {
	private Logger logger = Logger.getLogger(DoshamController.class);
	@Autowired
	DoshamDao objDoshamDao;

	@RequestMapping(value = "/DoshamHome")
	public String DoshamHome(@ModelAttribute("doshamForm") DoshamBean objDoshamBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DoshamHome Page");
		List<DoshamBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objDoshamDao.getAllDoshams();
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
			logger.fatal("error in BodyTypeController class DoshamHome method  ");
			
		}
		return "DoshamHome";
	}

	@RequestMapping(value = "/addDosham")
	public  String addBodyType(@Valid @ModelAttribute("doshamForm")DoshamBean objDoshamBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
		System.out.println("addDosham page...");
		int id = 0;
//		model.put("userForm", user);
		try {
		
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "DoshamHome";
			}
			objDoshamBean.setStatus("1");
			DoshamBean doshamBean = objDoshamDao.getByName(objDoshamBean);
			int dummyId =0;
			if(objDoshamBean != null){
				dummyId = objDoshamBean.getId();
			}
			if(objDoshamBean.getId() != 0)
			{
				id = objDoshamBean.getId();
				if(id == dummyId || objDoshamBean == null )
				{
					objDoshamDao.save(objDoshamBean);
					redir.addFlashAttribute("msg", "Updated");
				}
				else
				{
					redir.addFlashAttribute("msg", "AlreadyExist");
				}
			}
			if(objDoshamBean.getId() == 0 && doshamBean == null)
			{
				objDoshamDao.save(objDoshamBean);
				redir.addFlashAttribute("msg", "inserted");
			}
			if(objDoshamBean.getId() == 0 && objDoshamBean != null)
			{
				redir.addFlashAttribute("msg", "AlreadyExist");
			}
			//redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in userLogin method in school DepartmentController class DepartmentHome method  ");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:DoshamHome";
	}
	@RequestMapping(value = "/deleteDosham")
	public @ResponseBody String deleteBodyType( DoshamBean objDoshamBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println("deleteDosham page...");
		List<DoshamBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objDoshamBean.getId() != 0){
 				delete = objDoshamDao.delete(objDoshamBean.getId());
 				if(delete){
 					jsonObj.put("message", "deleted");
 				}else{
 					jsonObj.put("message", "delete fail");
 				}
 			}
 				
 			listOrderBeans = objDoshamDao.getAllDoshams();
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
			logger.fatal("error in userLogin method in school DepartmentController class DepartmentHome method  ");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
}

