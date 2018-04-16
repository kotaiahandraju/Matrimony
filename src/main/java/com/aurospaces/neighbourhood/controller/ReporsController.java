package com.aurospaces.neighbourhood.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.aurospaces.neighbourhood.bean.BodyTypeBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.ReportsBean;
import com.aurospaces.neighbourhood.db.dao.BodyTypeDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.HRMSUtil;

@Controller
@RequestMapping(value="/admin")
public class ReporsController {
	private Logger logger = Logger.getLogger(ReporsController.class);
	@Autowired
	BodyTypeDao objBodyTypeDao;
	@Autowired UsersDao objUsersDao;

	@RequestMapping(value = "/reportsHome")
	public String bodyTypeHome(@ModelAttribute("reports") ReportsBean objReportsBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("BodyTypeHome Page");
		List<BodyTypeBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objBodyTypeDao.getAllBodyTypes();
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
			logger.fatal("error in BodyTypeController class bodyTypeHome method");
		}
		return "reports";
	}
	@ModelAttribute("occupation")
	public Map<Integer, String> populateoccupation() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from occupation  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	@ModelAttribute("caste")
	public Map<Integer, String> populatecast() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from cast  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
		
	}
	@ModelAttribute("packages")
	public Map<Integer, String> populatePackages() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "SELECT id,`name` FROM  `package`  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
		
	}
	
	
	
	@RequestMapping(value = "/reportsData")
	public @ResponseBody String reportsData( ReportsBean objReportsBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		try{
			Date d = HRMSUtil.dateFormate(objReportsBean.getFromdate());
			Date d1 = HRMSUtil.dateFormate(objReportsBean.getTodate());
			objReportsBean.setFromdate1(d);
			objReportsBean.setTodate1(d1);
			listOrderBeans = objUsersDao.reporsData(objReportsBean);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in BodyTypeController class deleteBodyType method");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
	
	@RequestMapping(value = "/paymentreport")
	public String paymentreport(@ModelAttribute("reports") ReportsBean objReportsBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("BodyTypeHome Page");
		List<BodyTypeBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
		}
		return "paymentreport";
	}
	@RequestMapping(value = "/paymentreportsData")
	public @ResponseBody String paymentreportsData( ReportsBean objReportsBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		List<Map<String, Object>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		try{
			Date d = HRMSUtil.dateFormate(objReportsBean.getFromdate());
			Date d1 = HRMSUtil.dateFormate(objReportsBean.getTodate());
			objReportsBean.setFromdate1(d);
			objReportsBean.setTodate1(d1);
			listOrderBeans = objUsersDao.paymentreporsData(objReportsBean);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in BodyTypeController class deleteBodyType method");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}
	
	
}



