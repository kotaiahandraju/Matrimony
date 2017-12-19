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

import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.db.dao.ReligionDao;

@Controller
@RequestMapping(value = "/admin")
public class ReligionController {
	private Logger logger = Logger.getLogger(ReligionController.class);
	@Autowired
	ReligionDao objReligionDao;

	@RequestMapping(value = "/ReligionHome")
	public String religionHome(@ModelAttribute("religionForm") ReligionBean objReligionBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("ReligionHome Page");
		List<ReligionBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objReligionDao.getAllReligions();
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
			logger.fatal("error in ReligionController class ReligionHome method");
		}
		return "religionHome";
	}

	@RequestMapping(value = "/addReligion")
	public String addReligion(@Valid @ModelAttribute("ReligionForm") ReligionBean objReligionBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
//		System.out.println("addReligion page...");
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "religionHome";
			}
			objReligionBean.setStatus("1");
			ReligionBean religionBean = objReligionDao.getByName(objReligionBean);
			int dummyId = 0;
			if (religionBean != null) {
				dummyId = religionBean.getId();
			}
			if (objReligionBean.getId() != 0) {
				id = objReligionBean.getId();
				if (id == dummyId || religionBean == null) {
					objReligionDao.save(objReligionBean);
					redir.addFlashAttribute("msg", "Religion Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Religion Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objReligionBean.getId() == 0 && religionBean == null) {
				objReligionDao.save(objReligionBean);
				redir.addFlashAttribute("msg", "Religion Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objReligionBean.getId() == 0 && religionBean != null) {
				redir.addFlashAttribute("msg", "Already Religion Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in ReligionController class addReligion method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:ReligionHome";
	}

	@RequestMapping(value = "/deleteReligion")
	public @ResponseBody String deleteReligion(ReligionBean objReligionBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteReligion page...");
		List<ReligionBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objReligionBean.getId() != 0) {
				delete = objReligionDao.delete(objReligionBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objReligionDao.getAllReligions();
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
			logger.fatal("error in ReligionController class deleteReligion method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}