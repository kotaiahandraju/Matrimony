package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.EmployeeCreationDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;

@Controller
@RequestMapping(value="/admin")
public class EmployeeCreationController {
	private Logger logger = Logger.getLogger(FilterController.class);
	  @Autowired UsersDao objUsersDao;
	  @Autowired EmployeeCreationDao employeeCreationDao;
	  @Autowired UserrequirementDao userrequirementDao;
	 @RequestMapping(value = "/employeeCreation")
		public String employeeCreation(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
				HttpServletRequest request,HttpServletResponse response, HttpSession session) {
			List<Map<String, String>> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson = null;
			try {
				listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "employee");
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
			}catch(Exception e) {
				e.printStackTrace();
				logger.error(e);
				logger.fatal("error in FilterController class employeeCreation method");
				return "employeeCreation";
			}
			return "employeeCreation";
		}
		
		@RequestMapping(value = "/saveEmployeeCreation")
		public String saveEmplopyeeCreation(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
				HttpServletRequest request,HttpServletResponse response, HttpSession session,RedirectAttributes redir) {
			UsersBean usersBean=null;
			int id=0;
			try {
				objUsersBean.setRoleId(3);
				objUsersBean.setStatus("1");
				//usersBean=employeeCreationDao.getByEmployee(objUsersBean.getUsername(),objUsersBean.getEmail());
				usersBean=employeeCreationDao.getByEmployeeByEmail(objUsersBean.getEmail());
				UsersBean usersBean2=employeeCreationDao.getByEmployeeByUserName(objUsersBean.getUsername());
				
				int existing_id = 0,existing_id2 = 0;
				if (usersBean != null) {
					existing_id = usersBean.getId();
				}
				if (usersBean2 != null) {
					existing_id2 = usersBean2.getId();
				}
				if (objUsersBean.getId() != 0) {
					id = objUsersBean.getId();
					if (((id == existing_id) && (id == existing_id2)) || (usersBean == null && usersBean2==null)) {
//						objUsersDao.save(objUsersBean);
						boolean success = objUsersDao.updateEmployee(objUsersBean);
						if(success) {
							
							redir.addFlashAttribute("msg", "success");
						}else {
							redir.addFlashAttribute("msg", "failed");
						}
					} else {
						
						if (usersBean != null) {
							redir.addFlashAttribute("duplicate_email", "duplicate_email");
						}
						if (usersBean2 != null) {
							redir.addFlashAttribute("duplicate_username", "duplicate_username");
						}
						
					}
					
				}
				
				if (objUsersBean.getId() == 0 && (usersBean == null && usersBean2 == null)) {
				try {
					objUsersDao.save(objUsersBean);
					objUsersBean.setUserId(objUsersBean.getId());
					objUsersBean.setId(0);
					userrequirementDao.save(objUsersBean);
					redir.addFlashAttribute("msg", "success");
				} catch (Exception e) {
					// TODO: handle exception
					redir.addFlashAttribute("msg", "failed");
				}
				}else {
					if (usersBean != null) {
						redir.addFlashAttribute("duplicate_email", "duplicate_email");
					}
					if (usersBean2 != null) {
						redir.addFlashAttribute("duplicate_username", "duplicate_username");
					}
				}
				
				
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CreateProfile class saveEmplopyeeCreation method  ");
			}
			
			return "redirect:employeeCreation";
		}
		
		@RequestMapping(value = "/deleteemployee")
		public @ResponseBody String deleteStudent(@RequestParam("id") int id,UsersBean objUsersBean) {
			boolean delete = false;
			String msg =null;
			List<Map<String, String>> listOrderBeans = null;
			JSONObject jsonObj= new JSONObject();
			try {
				delete = objUsersDao.delete(id);
				if(delete) {
					jsonObj.put("message", "yes");
				}else {
					jsonObj.put("message", "no");
				}
				listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "employee");
				jsonObj.put("allOrders1", listOrderBeans);
				
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			return String.valueOf(jsonObj);
		}
		
	

}
