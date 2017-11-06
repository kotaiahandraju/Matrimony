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

import com.aurospaces.neighbourhood.bean.StateBean;
import com.aurospaces.neighbourhood.db.dao.StateDao;;

@Controller
@RequestMapping(value="/admin")
public class StateController {
	private Logger logger = Logger.getLogger(StateController.class);
	@Autowired
	StateDao objStateDao;

	@RequestMapping(value = "/StateHome")
	public String stateHome(@ModelAttribute("stateForm") StateBean objStateBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		System.out.println("StateHome Page");
		List<StateBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objStateDao.getAllStates();
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
			logger.fatal("error in StateController class stateHome method");
		}
		return "StateHome";
	}

	@RequestMapping(value = "/addState")
	public  String addBodyType(@Valid @ModelAttribute("stateForm")StateBean objStateBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
		System.out.println("addState page...");
		int id = 0;
//		model.put("userForm", user);
		try {
		
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "StateHome";
			}
			objStateBean.setStatus("1");
			StateBean stateBean = objStateDao.getByName(objStateBean);
			int dummyId =0;
			if(stateBean != null){
				dummyId = stateBean.getId();
			}
			if(objStateBean.getId() != 0)
			{
				id = objStateBean.getId();
				if(id == dummyId || stateBean == null )
				{
					objStateDao.save(objStateBean);
					redir.addFlashAttribute("msg", "Updated");
				}
				else
				{
					redir.addFlashAttribute("msg", "AlreadyExist");
				}
			}
			if(objStateBean.getId() == 0 && stateBean == null)
			{
				objStateDao.save(objStateBean);
				redir.addFlashAttribute("msg", "inserted");
			}
			if(objStateBean.getId() == 0 && stateBean != null)
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
		return "redirect:StateHome";
	}
	@RequestMapping(value = "/deleteState")
	public @ResponseBody String deleteBodyType( StateBean objStateBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println("deleteState page...");
		List<StateBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objStateBean.getId() != 0){
 				delete = objStateDao.delete(objStateBean.getId());
 				if(delete){
 					jsonObj.put("message", "deleted");
 				}else{
 					jsonObj.put("message", "delete fail");
 				}
 			}
 				
 			listOrderBeans = objStateDao.getAllStates();
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

