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

import com.aurospaces.neighbourhood.bean.occupationBean;
import com.aurospaces.neighbourhood.db.dao.OccupationDao;

@Controller
@RequestMapping(value = "/admin")
public class OccupationController {
	private Logger logger = Logger.getLogger(OccupationController.class);
	@Autowired
	OccupationDao objOccupationDao;

	@RequestMapping(value = "/OccupationHome")
	public String occupationHome(@ModelAttribute("occupationForm") occupationBean objoccupationBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("OccupationHome Page");
		List<occupationBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objOccupationDao.getAllOccupations();
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
			logger.fatal("error in OccupationController class occupationHome method");
		}
		return "occupationHome";
	}

	@RequestMapping(value = "/addOccupation")
	public String addOccupation(@Valid @ModelAttribute("occupationForm") occupationBean objoccupationBean,
			BindingResult result, ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse responses, RedirectAttributes redir) {
//		System.out.println("addBodyType page...");
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "occupationHome";
			}
			objoccupationBean.setStatus("1");
			occupationBean occupationBean = objOccupationDao.getByName(objoccupationBean);
			int dummyId = 0;
			if (occupationBean != null) {
				dummyId = occupationBean.getId();
			}
			if (objoccupationBean.getId() != 0) {
				id = objoccupationBean.getId();
				if (id == dummyId || occupationBean == null) {
					objOccupationDao.save(objoccupationBean);
					redir.addFlashAttribute("msg", "Occupation Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Occupation Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objoccupationBean.getId() == 0 && occupationBean == null) {
				objOccupationDao.save(objoccupationBean);
				redir.addFlashAttribute("msg", "Occupation Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objoccupationBean.getId() == 0 && occupationBean != null) {
				redir.addFlashAttribute("msg", "Already Occupation Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in OccupationController class addOccupation method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:OccupationHome";
	}

	@RequestMapping(value = "/deleteOccupation")
	public @ResponseBody String deleteOccupation(occupationBean objoccupationBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteOccupation page...");
		List<occupationBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objoccupationBean.getId() != 0) {
				delete = objOccupationDao.delete(objoccupationBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objOccupationDao.getAllOccupations();
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
			logger.fatal("error in OccupationController class deleteOccupation method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}
