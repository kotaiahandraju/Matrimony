package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.PaymentDao;
import com.aurospaces.neighbourhood.db.dao.PaymenthistoryDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	private Logger logger = Logger.getLogger(FilterController.class);
	
   @Autowired UsersDao objUsersDao;
   @Autowired PaymentDao paymentDao;
   @Autowired PaymenthistoryDao paymenthistoryDao;
//   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
   @RequestMapping(value = "/changePassword")
	public String changePassword(@ModelAttribute("changePaddword") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("changePassword Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		UsersBean objUserBean = null;
		try {
			UsersBean sessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			request.setAttribute("first_name", sessionBean.getFirstName());
			request.setAttribute("last_name", sessionBean.getLastName());
			//objUsersBean.setFirstName(sessionBean.getFirstName());
			//objUsersBean.setLastName(sessionBean.getLastName());
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			//logger.fatal("error in CountriesController class CountriesHome method  ");
			return "redirect:HomePage";
		}
		return "changePasswordPage";
	}
   
   @RequestMapping(value = "/changePasswordAction")
	public @ResponseBody String changePasswordAction(@ModelAttribute("changePaddword") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("changePasswordAction Page");
		JSONObject jsonObj = new JSONObject();
		boolean updated = false;
		try {
			//objUsersBean.setPassword(MiscUtils.generateRandomString(6));
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			
			if(userSessionBean == null){
				return jsonObj.put("message", "failed").toString(); 
			}
				userSessionBean.setPassword(objUsersBean.getPassword());
				updated =	objUsersDao.updatePassword(userSessionBean);
				if(updated){
					jsonObj.put("message", "success");
					try{
						EmailUtil emailUtil = new EmailUtil();
						emailUtil.sendResetPasswordEmail(userSessionBean, objContext, "change_password");
					}catch(Exception e) {
						e.printStackTrace();
					}
				}else{
					jsonObj.put("message", "failed");
				}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			//logger.fatal("error in CountriesController class CountriesHome method  ");
			return jsonObj.put("message", "failed").toString();
		}
		return jsonObj.toString();
	}
   @RequestMapping(value = "/dashboard")
	public String dashboard(@ModelAttribute("dashboardForm") UsersBean userBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
	   List<Map<String,Object>> packExpiredProfiles = null;
	   List<Map<String,Object>> listOfOrders = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.PREMIUM_PACKAGE);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("premiumExpiredProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("premiumExpiredProfiles", "''");
			}
			packExpiredProfiles = null;
			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.CLASSIC_PLUS_PACKAGE);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("classicPlusExpiredProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("classicPlusExpiredProfiles", "''");
			}
			packExpiredProfiles = null;
			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.PREMIUM_PLUS_PACKAGE);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("PremiumPlusExpiredProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("PremiumPlusExpiredProfiles", "''");
			}
			packExpiredProfiles = null;
			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.CLASSIC_PACKAGE);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("classicExpiredProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("classicExpiredProfiles", "''");
			}
			packExpiredProfiles = null;
			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.AARNA_PREMIUM_PACKAGE);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("ArnaPremiumExpiredProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("ArnaPremiumExpiredProfiles", "''");
			}
			packExpiredProfiles = null;
			packExpiredProfiles = objUsersDao.getPackageExpiredProfiles(MatrimonyConstants.LAUNCHING_OFFER_999_PACK);
			if (packExpiredProfiles != null && packExpiredProfiles.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(packExpiredProfiles);
				request.setAttribute("ArnaSpecialofferProfiles", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("ArnaSpecialofferProfiles", "''");
			}
			//packages count getFreeUsersCount
			listOfOrders  = objUsersDao.getPackageCount();
			if (listOfOrders != null && listOfOrders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOfOrders);
				request.setAttribute("listOfOrders", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("listOfOrders", "''");
			}
			// free users count
			listOfOrders  = objUsersDao.getFreeUsersCount();
			if (listOfOrders != null && listOfOrders.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOfOrders);
				request.setAttribute("freeusersCount", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("freeusersCount", "''");
			}
			
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", 2);
			
			// display counts
			Map<String,Integer> counts = objUsersDao.getDisplayCounts();
			session.setAttribute("display_counts", counts);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in admin dashboard method");
			return "bodyTypeHome";
		}
		return "adminDashboard";
	}

   @RequestMapping(value = "/refreshhCounts")
	public  @ResponseBody String refreshhCounts( ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		JSONObject objJson =new JSONObject();
		List<CityBean> ojCityBean = null;
		try {
			UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
			Map<String,Integer> counts = objUsersDao.getDisplayCounts();
			objJson.put("display_counts", counts);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class CountriesHome method  ");
		}
		return objJson.toString();
	}
   
  /* @RequestMapping(value = "/paymentDetails/{id}/{page}")
	public String paymentDetails(@ModelAttribute("payment") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session, @PathVariable("id") int id,@PathVariable("page") String pageName) {
		System.out.println("paymentDetails Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String ipAddress = null;
		
		try {
//			yyyy.MM.dd dd-MMMM-yyyy
			
			objUsersBean =objUsersDao.getById(id);
			
			
			
			objUsersBean.setPageName(pageName);
//			objUsersBean = objUserDetailsDao.getById(id);
			objeModel.addAttribute("payment", objUsersBean);
			 ipAddress =MiscUtils.getClientIpAddress(request);
		
			 request.setAttribute("pageName", pageName);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			//return "countriesHome";
		}
		return "paymentDetails";
	}*/
   

   /*@RequestMapping(value = "/savePayment")
	public String savePayment(@ModelAttribute("payment") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes redir) {
		System.out.println("savePayment Page");
		List<ContriesBean> listOrderBeans = null;
		String msg= null;
		try{
			
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(userSessionBean==null)
				return null;
			//session.setAttribute("", arg1);
			int userId = userSessionBean.getId();
			Paymenthistory packageObj = objUsersDao.getPackageById(Integer.parseInt(objUsersBean.getPaymentObject().getPackageId()));
			JavaIntegrationKit integrationKit = new JavaIntegrationKit();
	        Map<String, String> values = integrationKit.hashCalMethod(request, response);
			
	        Paymenthistory objPaymenthistoryBean =new Paymenthistory();
	         objPaymenthistoryBean.setTxid(values.get("txnid").trim());
	         objPaymenthistoryBean.setMemberId(String.valueOf(userId));
	         objPaymenthistoryBean.setPaymentStatus("In Progress");
	         objPaymenthistoryBean.setPrice(packageObj.getPrice());
	         
	         paymenthistoryDao.save(objPaymenthistoryBean);
	         
	         PrintWriter writer = response.getWriter();
	         String htmlResponse = "<html> <body> \n"
	                 + "      \n"
	                 + "  \n"
	                 + "  <h1>PayUForm </h1>\n"
	                 + "  \n" + "<div>"
	                 + "        <form id=\"payuform\" action=\"" + values.get("action") + "\"  name=\"payuform\" method=POST >\n"
	                 + "      <input type=\"hidden\" name=\"key\" value='m7fkbzwB'>"
	                 + "      <input type=\"hidden\" name=\"hash\" value=" + values.get("hash").trim() + ">"
	                 + "      <input type=\"hidden\" name=\"txnid\" value=" + values.get("txnid").trim() + ">"
	                 + "      <table>\n"
	                 + "        <tr>\n"
	                 + "          <td><b>Mandatory Parameters</b></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "         <td>Amount: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"amount\" value=" + values.get("amount").trim() + " /></td>\n"
	                 + "          <td>First Name: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"firstname\" id=\"firstname\" value=" + values.get("firstname").trim() + " /></td>\n"
	                 + "        <tr>\n"
	                 + "          <td>Email: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"email\" id=\"email\" value=" + values.get("email").trim() + " /></td>\n"
	                 + "          <td>Phone: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"phone\" value=" + values.get("phone") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Product Info: </td>\n"
	                 + "<td><input type=\"hidden\" name=\"productinfo\" value=" + values.get("productinfo").trim() + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Success URI: </td>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"surl\"  size=\"64\" value=" + values.get("surl") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Failure URI: </td>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"furl\" value=" + values.get("furl") + " size=\"64\" ></td>\n"
	                 + "        </tr>\n"
	                 + "\n"
	                 + "        <tr>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"service_provider\" value=\"payu_paisa\" /></td>\n"
	                 + "        </tr>\n"
	                 + "             <tr>\n"
	                 + "          <td><b>Optional Parameters</b></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Last Name: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"lastname\" id=\"lastname\" value=" + values.get("lastname") + " ></td>\n"
	                 + "          <td>Cancel URI: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"curl\" value=" + values.get("curl") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Address1: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"address1\" value=" + values.get("address1") + " ></td>\n"
	                 + "          <td>Address2: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"address2\" value=" + values.get("address2") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>City: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"city\" value=" + values.get("city") + "></td>\n"
	                 + "          <td>State: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"state\" value=" + values.get("state") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Country: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"country\" value=" + values.get("country") + " ></td>\n"
	                 + "          <td>Zipcode: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"zipcode\" value=" + values.get("zipcode") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "          <td>UDF1: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf1\" value=" + values.get("udf1") + "></td>\n"
	                 + "          <td>UDF2: </td>\n"
	                 + "          <td><input  type=\"hidden\" name=\"udf2\" value=" + values.get("udf2") + "></td>\n"
	                 + " <td><input type=\"hidden\" name=\"hashString\" value=" + values.get("hashString") + "></td>\n"
	                 + "          <td>UDF3: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf3\" value=" + values.get("udf3") + " ></td>\n"
	                 + "          <td>UDF4: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf4\" value=" + values.get("udf4") + " ></td>\n"
	                 + "          <td>UDF5: </td>\n"
	                + "          <td><input type=\"hidden\" name=\"udf5\" value=" + values.get("udf5") + " ></td>\n"
	                  + "          <td>PG: </td>\n"
	                + "          <td><input type=\"hidden\" name=\"pg\" value=" + values.get("pg") + " ></td>\n"
	                 + "        <td colspan=\"4\"><input type=\"submit\" value=\"Submit\"  /></td>\n"
	                 + "      \n"
	                 + "    \n"
	                 + "      </table>\n"
	                 + "    </form>\n"
	                 + " <script> "
	                 + " document.getElementById(\"payuform\").submit(); "
	                 + " </script> "
	                 + "       </div>   "
	                 + "  \n"
	                 + "  </body>\n"
	                 + "</html>";
	 // return response
	         writer.println(htmlResponse);
			
			boolean success = paymentDao.save(objUsersBean.getPayment());
			if(success){
				msg = "Payment Done successfully.";
			}else{
				msg = "Payment is not saved. Please try again.";
			}
			redir.addFlashAttribute("msg", msg);
			if(StringUtils.isNotBlank(objUsersBean.getPageName())){
				return "redirect:"+objUsersBean.getPageName();
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in savePayment method  ");
			return "CreateProfile";
		}
		return "redirect:paymentDetails";
   }
   
   @RequestMapping(value = "/success")
	public  String success(Members objMembers, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		JSONObject objJson = new JSONObject();
		try{
			Enumeration paramNames = request.getParameterNames();
	        Map<String, String> params = new HashMap<String, String>();
	        Map<String, String> urlParams = new HashMap<String, String>();
	       while (paramNames.hasMoreElements()) {
	            String paramName = (String) paramNames.nextElement();
	            String paramValue = request.getParameter(paramName);
	            params.put(paramName, paramValue);
	        }
	       redirect.addFlashAttribute("params", params);
//	       request.setAttribute("params", params);
	       
					 
				
				//session.setAttribute("txnid", txnid);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
		}
		return "redirect:successPrint";
	}
	@RequestMapping(value = "/failed")
	public  String failed(Members objMembersBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		try{
			Enumeration paramNames = request.getParameterNames();
	        Map<String, String> params = new HashMap<String, String>();
	        Map<String, String> urlParams = new HashMap<String, String>();
	       while (paramNames.hasMoreElements()) {
	            String paramName = (String) paramNames.nextElement();
	            String paramValue = request.getParameter(paramName);
	            params.put(paramName, paramValue);
	        }
	       request.setAttribute("params", params);
	       Paymenthistory objPamenthistory = new Paymenthistory();
			String unmappedstatus = request.getParameter("unmappedstatus");
			String tx=params.get("txnid");
			String txnid = request.getParameter("txnid");
			String status = request.getParameter("status");
			objPamenthistory.setRemarks(unmappedstatus);
			objPamenthistory.setPaymentStatus(status);
			objPamenthistory.setTxid(txnid);
			paymenthistoryDao.pamentStatusUpdate(objPamenthistory);
			session.setAttribute("txnid", txnid);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
		}
		return "failedPament";
	}
	@RequestMapping(value = "/successPrint")
	public  String successPrint(Members objMembersBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		 List<Map<String, Object>> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		try{
			request.getAttribute("params");
			request.getAttribute("requestBean");
			listOrderBeans = objMembersDao.getPrinting();
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
				request.setAttribute("allOrders1", "' '");
				jsonObj.put("allOrders1", "' '");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
		}
		return "successPament";
	}
   
   @ModelAttribute("packages")
	public Map<Integer, String> populatestar() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from package  where status='1' order by name asc";
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
   */
}
