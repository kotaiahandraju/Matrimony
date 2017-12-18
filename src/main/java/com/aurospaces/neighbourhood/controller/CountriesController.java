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

import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;

@Controller
@RequestMapping(value = "/admin")
public class CountriesController {
	private Logger logger = Logger.getLogger(CountriesController.class);
	@Autowired
	CountriesDao objCountriesDao;

	@RequestMapping(value = "/CountriesHome")
	public String countriesHome(@ModelAttribute("countriesForm") ContriesBean objContriesBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("CountriesHome Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objCountriesDao.getAllCountries();
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
			logger.fatal("error in CountriesController class countriesHome method");
			return "countriesHome";
		}
		return "countriesHome";
	}

	@RequestMapping(value = "/addCountries")
	public String addCountries(@Valid @ModelAttribute("countriesForm") ContriesBean objContriesBean,
			BindingResult result, ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse responses, RedirectAttributes redir) {
		System.out.println("addCountries page...");
		int id = 0;
		try {

			if (result.hasErrors()) {
				return "countriesHome";
			}
			objContriesBean.setStatus("1");
			ContriesBean contriesBean = objCountriesDao.getByName(objContriesBean);
			int dummyId = 0;
			if (contriesBean != null) {
				dummyId = contriesBean.getId();
			}
			if (objContriesBean.getId() != 0) {
				id = objContriesBean.getId();
				if (id == dummyId || contriesBean == null) {
					objCountriesDao.save(objContriesBean);
					redir.addFlashAttribute("msg", "Country Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Country Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objContriesBean.getId() == 0 && contriesBean == null) {
				objCountriesDao.save(objContriesBean);
				redir.addFlashAttribute("msg", "Country Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objContriesBean.getId() == 0 && contriesBean != null) {
				redir.addFlashAttribute("msg", "Already Country Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
			// redir.addFlashAttribute("msg", "success fully created");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class addCountries method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:CountriesHome";
	}

	@RequestMapping(value = "/deleteCountries")
	public @ResponseBody String deleteBodyType(ContriesBean objContriesBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteBodyType page...");
		List<ContriesBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objContriesBean.getId() != 0) {
				delete = objCountriesDao.delete(objContriesBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}

			listOrderBeans = objCountriesDao.getAllCountries();
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
			logger.fatal("error in CountriesController class deleteBodyType method  ");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
}
