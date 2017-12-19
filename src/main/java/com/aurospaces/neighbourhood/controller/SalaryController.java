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

import com.aurospaces.neighbourhood.bean.SalaryBean;
import com.aurospaces.neighbourhood.db.dao.SalaryDao;

@Controller
@RequestMapping(value = "/admin")
public class SalaryController {
	private Logger logger = Logger.getLogger(SalaryController.class);
	@Autowired
	SalaryDao objSalaryDao;

	@RequestMapping(value = "/SalaryHome")
	public String salaryHome(@ModelAttribute("salaryForm") SalaryBean objSalaryBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("SalaryHome Page");
		List<SalaryBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objSalaryDao.getAllSalaries();
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
			logger.fatal("error in SalaryController class salaryHome method");
		}
		return "SalaryHome";
	}

	@RequestMapping(value = "/addSalary")
	public String addSalary(@Valid @ModelAttribute("salaryForm") SalaryBean objSalaryBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
//		System.out.println("addSalarypage...");
		int id = 0;
		try {
			if (result.hasErrors()) {
				return "SalaryHome";
			}
			objSalaryBean.setStatus("1");
			SalaryBean salaryBean = objSalaryDao.getByName(objSalaryBean);
			int dummyId = 0;
			if (objSalaryBean != null) {
				dummyId = objSalaryBean.getId();
			}
			if (objSalaryBean.getId() != 0) {
				id = objSalaryBean.getId();
				if (id == dummyId || objSalaryBean == null) {
					objSalaryDao.save(objSalaryBean);
					redir.addFlashAttribute("msg", "Salary Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Salary Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objSalaryBean.getId() == 0 && salaryBean == null) {
				objSalaryDao.save(objSalaryBean);
				redir.addFlashAttribute("msg", "Salary Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objSalaryBean.getId() == 0 && objSalaryBean != null) {
				redir.addFlashAttribute("msg", "Already Salary Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in SalaryController class addSalary method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:SalaryHome";
	}

	@RequestMapping(value = "/deleteSalary")
	public @ResponseBody String deleteSalary(SalaryBean objSalaryBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteSalary page...");
		List<SalaryBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objSalaryBean.getId() != 0) {
				delete = objSalaryDao.delete(objSalaryBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}
			listOrderBeans = objSalaryDao.getAllSalaries();
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in SalaryController class deleteSalary method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}