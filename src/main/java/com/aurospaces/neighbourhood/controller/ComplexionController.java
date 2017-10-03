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

import com.aurospaces.neighbourhood.bean.ComplexionBean;
import com.aurospaces.neighbourhood.db.dao.ComplexionDao;

@Controller
@RequestMapping(value="/admin")
public class ComplexionController {
	private Logger logger = Logger.getLogger(ComplexionController.class);
	@Autowired
	ComplexionDao objComplexionDao;

	@RequestMapping(value = "/ComplexionHome")
	public String ComplexionHome(@ModelAttribute("complexionForm") ComplexionBean objComplexionBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		System.out.println("ComplexionHome Page");
		List<ComplexionBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objComplexionDao.getAllComplexions();
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
			logger.fatal("error in ComplexionController class ComplexionHome method  ");
			return "bodyTypeHome";
		}
		return "complexionHome";
	}
	@RequestMapping(value = "/addComplexion")
	public  String addComplexion(@Valid @ModelAttribute("complexionForm")ComplexionBean objComplexionBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redir){
		System.out.println("addComplexion page...");
		int id = 0;
//		model.put("userForm", user);
		try {
		
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "complexionHome";
			}
			objComplexionBean.setStatus("1");
			ComplexionBean complexionBean = objComplexionDao.getByName(objComplexionBean);
			int dummyId =0;
			if(complexionBean != null){
				dummyId = complexionBean.getId();
			}
			if(objComplexionBean.getId() != 0)
			{
				id = objComplexionBean.getId();
				if(id == dummyId || complexionBean == null )
				{
					objComplexionDao.save(objComplexionBean);
					redir.addFlashAttribute("msg", "Updated");
				}
				else
				{
					redir.addFlashAttribute("msg", "AlreadyExist");
				}
			}
			if(objComplexionBean.getId() == 0 && complexionBean == null)
			{
				objComplexionDao.save(objComplexionBean);
				redir.addFlashAttribute("msg", "inserted");
			}
			if(objComplexionBean.getId() == 0 && complexionBean != null)
			{
				redir.addFlashAttribute("msg", "AlreadyExist");
			}
			//redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in ComplexionController class addComplexion method   ");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:ComplexionHome";
	}
	@RequestMapping(value = "/deleteComplexion")
	public @ResponseBody String deleteComplexion( ComplexionBean objComplexionBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println("deleteBodyType page...");
		List<ComplexionBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objComplexionBean.getId() != 0){
 				delete = objComplexionDao.delete(objComplexionBean.getId());
 				if(delete){
 					jsonObj.put("message", "deleted");
 				}else{
 					jsonObj.put("message", "delete fail");
 				}
 			}
 				
 			listOrderBeans = objComplexionDao.getAllComplexions();
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
			logger.fatal("error in ComplexionController class deleteComplexion method  ");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
}

/*
@RequestMapping(value = "/submitPercentage")
public String addclass(GSTPercentageBean objPercentageBean,ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
	List<Map<String, String>> listOrderBeans = null;
	ObjectMapper objectMapper = null;
	String sJson = "";
	int id = 0;
	try
	{
		if(StringUtils.isNotBlank(objPercentageBean.getPercentage1())){
			objPercentageBean.setPercentage(Double.parseDouble(objPercentageBean.getPercentage1()));
		}
		else{
			objPercentageBean.setPercentage(0.00);
		}
		GSTPercentageBean percentageBean = objGstPercentageDao.getByName(objPercentageBean);
		int dummyId =0;
		if(percentageBean != null){
			dummyId = percentageBean.getId();
		}
		if(objPercentageBean.getId() != 0)
		{
			id = objPercentageBean.getId();
			if(id == dummyId || percentageBean == null )
			{
				objGstPercentageDao.save(objPercentageBean);
				session.setAttribute("updated", "GSTPercentage Updated Successfully");
				System.out.println("GSTPercentage Updated");
			}
			else
			{
				session.setAttribute("error", "Record Already Exists");
				System.out.println("Duplicate GSTPercentage");
			}
		}
		if(objPercentageBean.getId() == 0 && percentageBean == null)
		{
			objGstPercentageDao.save(objPercentageBean);
			session.setAttribute("created", "GSTPercentage Added Successfully");
			System.out.println("GSTPercentage Added");
		}
		if(objPercentageBean.getId() == 0 && percentageBean != null)
		{
			session.setAttribute("error", "Record Already Exists");
			System.out.println("Duplicate GSTPercentage");
		}
//		objGstPercentageDao.save(objPercentageBean);
		
		listOrderBeans = objGstPercentageDao.getAllGSTPercentages();
		if(listOrderBeans != null && listOrderBeans.size() > 0) {
			  objectMapper = new ObjectMapper(); 
			  sJson =objectMapper.writeValueAsString(listOrderBeans);
			  request.setAttribute("allOrders1", sJson);
			 // System.out.println(sJson); 
		}else{
			 objectMapper = new ObjectMapper(); 
			  sJson =objectMapper.writeValueAsString(listOrderBeans);
			  request.setAttribute("allOrders1", "''");
		}
	}catch(Exception e){
e.printStackTrace();
System.out.println(e);
		logger.error(e);
	}

	return "redirect:GstPercentage";
}*/
