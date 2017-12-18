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

import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.db.dao.HeightDao;

@Controller
@RequestMapping(value = "/admin")
public class HeightController {
	private Logger logger = Logger.getLogger(HeightController.class);
	@Autowired
	HeightDao objHeightDao;

	@RequestMapping(value = "/HeightHome")
	public String heightHome(@ModelAttribute("heightForm") HeightBean objHeightBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("HeightHome Page");
		List<HeightBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objHeightDao.getAllHeights();
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
			logger.fatal("error in HeightController class heightHome method");
		}
		return "heightHome";
	}

	@RequestMapping(value = "/addHeight")
	public String addHeight(@Valid @ModelAttribute("heightForm") HeightBean objHeightBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
//		System.out.println("addHeight page...");
		int id = 0;
		try {
			if (result.hasErrors()) {
				return "heightHome";
			}
			objHeightBean.setStatus("1");
			HeightBean heightBean = objHeightDao.getByName(objHeightBean);
			int dummyId = 0;
			if (heightBean != null) {
				dummyId = heightBean.getId();
			}
			if (objHeightBean.getId() != 0) {
				id = objHeightBean.getId();
				if (id == dummyId || heightBean == null) {
					objHeightDao.save(objHeightBean);
					redir.addFlashAttribute("msg", "Height Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Height Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objHeightBean.getId() == 0 && heightBean == null) {
				objHeightDao.save(objHeightBean);
				redir.addFlashAttribute("msg", "Height Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objHeightBean.getId() == 0 && heightBean != null) {
				redir.addFlashAttribute("msg", "Already Height Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
			// redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in HeightController class addHeight method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:HeightHome";
	}

	@RequestMapping(value = "/deleteHeight")
	public @ResponseBody String deleteBodyType(HeightBean objHeightBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteBodyType page...");
		List<HeightBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objHeightBean.getId() != 0) {
				delete = objHeightDao.delete(objHeightBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}
			listOrderBeans = objHeightDao.getAllHeights();
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
			logger.fatal("error in HeightController class deleteHeight method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}