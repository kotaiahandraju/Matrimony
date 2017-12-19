package com.aurospaces.neighbourhood.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.db.dao.CityDao;

@Controller
@RequestMapping(value = "/admin")
public class CityController {
	private Logger logger = Logger.getLogger(CityController.class);
	@Autowired
	CityDao objCityDao;

	@RequestMapping(value = "/CityHome")
	public String cityHome(@ModelAttribute("cityForm") CityBean objCityBean, ModelMap model, HttpServletRequest request,
			HttpSession session) {
//		System.out.println("CityHome Page");
		List<CityBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objCityDao.getAllCities();
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
			logger.fatal("error in CityController class cityHome method");
		}
		return "CityHome";
	}

	@RequestMapping(value = "/addCity")
	public String addCity(@Valid @ModelAttribute("cityForm") CityBean objCityBean, BindingResult result, ModelMap model,
			HttpServletRequest request, HttpSession session, HttpServletResponse responses, RedirectAttributes redir) {
//		System.out.println("addCity page...");
		int id = 0;
		try {
			if (result.hasErrors()) {
				return "CityHome";
			}
			objCityBean.setStatus("1");
			CityBean cityBean = objCityDao.getByName(objCityBean);
			int dummyId = 0;
			if (cityBean != null) {
				dummyId = cityBean.getId();
			}
			if (objCityBean.getId() != 0) {
				id = objCityBean.getId();
				if (id == dummyId || cityBean == null) {
					objCityDao.save(objCityBean);
					redir.addFlashAttribute("msg", "City Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already City Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (objCityBean.getId() == 0 && cityBean == null) {
				objCityDao.save(objCityBean);
				redir.addFlashAttribute("msg", "City Added Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (objCityBean.getId() == 0 && cityBean != null) {
				redir.addFlashAttribute("msg", "Already City Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CityController class addCity method");
			redir.addFlashAttribute("msg", e);
		}
		return "redirect:CityHome";
	}

	@RequestMapping(value = "/deleteCity")
	public @ResponseBody String deleteCity(CityBean objCityBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
//		System.out.println("deleteCity page...");
		List<CityBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (objCityBean.getId() != 0) {
				delete = objCityDao.delete(objCityBean.getId());
				if (delete) {
					jsonObj.put("message", "yes");
				} else {
					jsonObj.put("message", "no");
				}
			}
			listOrderBeans = objCityDao.getAllCities();
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
			logger.fatal("error in CityController class deleteCity method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}

	@ModelAttribute("states")
	public Map<Integer, String> populateCities() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from state where status='1' order by name asc";
			List<CityBean> list = objCityDao.populate(sSql);
			for (CityBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
}
