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

import com.aurospaces.neighbourhood.bean.RaasiBean;
import com.aurospaces.neighbourhood.db.dao.RaasiDao;

@Controller
@RequestMapping(value = "/admin")
public class RaasiController {
	private Logger logger = Logger.getLogger(RaasiController.class);
	@Autowired
	RaasiDao objRaasiDao;

	@RequestMapping(value = "/RaasiHome")
	public String rassiHome(@ModelAttribute("rassiForm") RaasiBean objRaasiBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("RaasiHome Page");
		List<RaasiBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objRaasiDao.getAllRaasis();
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
			logger.fatal("error in RaasiController class rassiHome method");
		}
		return "raasiHome";
	}

	@RequestMapping(value = "/addRassi")
	public String addRassi(@Valid @ModelAttribute("rassiForm") RaasiBean objRaasiBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
//		System.out.println("addRaasi page...");
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "raasiHome";
			}
			objRaasiBean.setStatus("1");
			RaasiBean raasiBean = objRaasiDao.getByName(objRaasiBean);
			int dummyId = 0;
			if (raasiBean != null) {
				dummyId = raasiBean.getId();
			}
			if (objRaasiBean.getId() != 0) {
				id = objRaasiBean.getId();
				if (id == dummyId || raasiBean == null) {
					objRaasiDao.save(objRaasiBean);
					redir.addFlashAttribute("msg", "Raasi Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Raasi Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objRaasiBean.getId() == 0 && raasiBean == null) {
				objRaasiDao.save(objRaasiBean);
				redir.addFlashAttribute("msg", "Raasi Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objRaasiBean.getId() == 0 && raasiBean != null) {
				redir.addFlashAttribute("msg", "Already Raasi Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in RaasiController class addRassi method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:RaasiHome";
	}

	@RequestMapping(value = "/deleteRaasi")
	public @ResponseBody String deleteRassi(RaasiBean objRaasiBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteRaasi page...");
		List<RaasiBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objRaasiBean.getId() != 0) {
				delete = objRaasiDao.delete(objRaasiBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objRaasiDao.getAllRaasis();
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
			logger.fatal("error in RaasiController class deleteRassi method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}