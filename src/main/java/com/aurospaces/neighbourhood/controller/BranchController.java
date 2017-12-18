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

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;

@Controller
@RequestMapping(value = "/admin")
public class BranchController {
	private Logger logger = Logger.getLogger(BranchController.class);
	@Autowired
	BranchDao objBranchDao;

	@RequestMapping(value = "/BranchHome")
	public String branchHome(@ModelAttribute("branchForm") BranchBean objBranchBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("BranchHome Page");
		List<BranchBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objBranchDao.getAllBranches();
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
			logger.fatal("error in BranchController class branchHome method");
			return "branchHome";
		}
		return "branchHome";
	}

	@RequestMapping(value = "/addBranch")
	public String addBranch(@Valid @ModelAttribute("branchForm") BranchBean objBranchBean, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,
			RedirectAttributes redir) {
//		System.out.println("addBodyType page...");
		int id = 0;
		// model.put("userForm", user);
		try {

			if (result.hasErrors()) {
				// model.addAttribute("newUser", userObj);
				return "branchHome";
			}
			objBranchBean.setSms_sender("1");
			objBranchBean.setStatus("1");
			BranchBean branchBean = objBranchDao.getByName(objBranchBean);
			int dummyId = 0;
			if (branchBean != null) {
				dummyId = branchBean.getId();
			}
			if (objBranchBean.getId() != 0) {
				id = objBranchBean.getId();
				if (id == dummyId || branchBean == null) {
					objBranchDao.save(objBranchBean);
					redir.addFlashAttribute("msg", "Branch Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Branch Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objBranchBean.getId() == 0 && branchBean == null) {
				objBranchDao.save(objBranchBean);
				redir.addFlashAttribute("msg", "Branch Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objBranchBean.getId() == 0 && branchBean != null) {
				redir.addFlashAttribute("msg", "Already Branch Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
			// redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("BranchController class addBranch method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:BranchHome";
	}

	@RequestMapping(value = "/deleteBranch")
	public @ResponseBody String deleteBranch(BranchBean objBranchBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteBodyType page...");
		List<BranchBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objBranchBean.getId() != 0) {
				delete = objBranchDao.delete(objBranchBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objBranchDao.getAllBranches();
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
			logger.fatal("BranchController class deleteBranch method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
}
