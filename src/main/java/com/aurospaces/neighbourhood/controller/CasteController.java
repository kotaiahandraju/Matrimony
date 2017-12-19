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

import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.db.dao.CastDao;

@Controller
@RequestMapping(value = "/admin")
public class CasteController {
	private Logger logger = Logger.getLogger(CasteController.class);
	@Autowired
	CastDao objCastDao;

	@RequestMapping(value = "/CasteHome")
	public String CasteHome(@ModelAttribute("casteForm") CastBean objCastBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		// System.out.println("CasteHome Page");
		List<CastBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objCastDao.getAllCasts();
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
			logger.fatal("error in CasteController class CasteHome method");
		}
		return "casteHome";
	}

	@RequestMapping(value = "/addCaste")
	public String addCaste(@Valid @ModelAttribute("casteForm") CastBean objCastBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
		// System.out.println("addBodyType page...");
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "casteHome";
			}
			objCastBean.setStatus("1");
			CastBean castBean = objCastDao.getByName(objCastBean);
			int dummyId = 0;
			if (castBean != null) {
				dummyId = castBean.getId();
			}
			if (objCastBean.getId() != 0) {
				id = objCastBean.getId();
				if (id == dummyId || castBean == null) {
					objCastDao.save(objCastBean);
					redir.addFlashAttribute("msg", "Caste Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Caste Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objCastBean.getId() == 0 && castBean == null) {
				objCastDao.save(objCastBean);
				redir.addFlashAttribute("msg", "Caste Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objCastBean.getId() == 0 && castBean != null) {
				redir.addFlashAttribute("msg", "Already Caste Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CasteController class addCaste method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:CasteHome";
	}

	@RequestMapping(value = "/deleteCaste")
	public @ResponseBody String deleteCaste(CastBean objCastBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
		// System.out.println("deleteCast page...");
		List<CastBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objCastBean.getId() != 0) {
				delete = objCastDao.delete(objCastBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}
			listOrderBeans = objCastDao.getAllCasts();
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
			logger.fatal("error in CasteController class deleteCaste method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}