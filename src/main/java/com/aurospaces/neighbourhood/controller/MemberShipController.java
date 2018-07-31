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

import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.db.dao.MemberShipDao;

@Controller
@RequestMapping(value = "/admin")
public class MemberShipController {
	private Logger logger = Logger.getLogger(MemberShipController.class);
	@Autowired
	MemberShipDao objMemberShipDao;

	@RequestMapping(value = "/MembershipHome")
	public String membershipHome(@ModelAttribute("membershipForm") MemberShipBean objMemberShipBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("membershipHome Page");
		List<MemberShipBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objMemberShipDao.getAllPackage();
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
			logger.fatal("error in MemberShipController class membershipHome method");
		}
		return "membershipHome";
	}

	@RequestMapping(value = "/addMemberShip")
	public String addMemberShip(@Valid @ModelAttribute("membershipForm") MemberShipBean objMemberShipBean,
			BindingResult result, ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse responses, RedirectAttributes redir) {
		String durationNumber =request.getParameter("duration");
		String durationExt =request.getParameter("duration_type");
		String durationTotal=durationNumber.concat(durationExt);
		
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "membershipHome";
			}
			objMemberShipBean.setStatus("1");
			MemberShipBean memberShipBean = objMemberShipDao.getByName(objMemberShipBean);
			int dummyId = 0;
			if (memberShipBean != null) {
				dummyId = memberShipBean.getId();
			}
			if (objMemberShipBean.getId() != 0) {
				id = objMemberShipBean.getId();
				if (id == dummyId || memberShipBean == null) {
					objMemberShipDao.save(objMemberShipBean);
					redir.addFlashAttribute("msg", "MemberShip Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already MemberShip Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objMemberShipBean.getId() == 0 && memberShipBean == null) {
				objMemberShipDao.save(objMemberShipBean);
				redir.addFlashAttribute("msg", "MemberShip Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objMemberShipBean.getId() == 0 && memberShipBean != null) {
				redir.addFlashAttribute("msg", "Already MemberShip Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MemberShipController class addMemberShip method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:MembershipHome";
	}

	@RequestMapping(value = "/deleteMemberShip")
	public @ResponseBody String deleteMemberShip(MemberShipBean objMemberShipBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteMemberShip page...");
		List<MemberShipBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objMemberShipBean.getId() != 0) {
				delete = objMemberShipDao.delete(objMemberShipBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objMemberShipDao.getAllPackage();
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
			logger.fatal("error in MemberShipController class deleteMemberShip method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
}