package com.aurospaces.neighbourhood.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.castor.util.Base64Decoder;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.UserImagesBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CastDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.PaymenthistoryDao;
import com.aurospaces.neighbourhood.db.dao.StateDao;
import com.aurospaces.neighbourhood.db.dao.UserImageUploadDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
@RequestMapping(value="/admin")
public class CreateProfileController {
	private Logger logger = Logger.getLogger(CreateProfileController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserrequirementDao objUserrequirementDao;
   @Autowired CityDao objCityDao;
   @Autowired StateDao stateDao;
   @Autowired CastDao objCastDao;
   @Autowired
	ServletContext objContext;
   @Autowired UserImageUploadDao objUserImageUploadDao;
	@RequestMapping(value = "/CreateProfile")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("CreateProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String ipAddress = null;
		
		try {
//			objUsersBean =objUsersDao.getById(2756);
//			objeModel.addAttribute("createProfile", objUsersBean);
//			 ipAddress =MiscUtils.getClientIpAddress(request);
		
			/*listOrderBeans = objCountriesDao.getAllCountries();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}*/
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
//			return "countriesHome";
		}
		return "createProfile";
	}
	@RequestMapping(value = "/CreateProfile/{id}/{page}")
	public String CreateProfile1(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session, @PathVariable("id") int id,@PathVariable("page") String pageName) {
//		System.out.println("CreateProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String ipAddress = null;
		
		try {
//			yyyy.MM.dd dd-MMMM-yyyy
			
			objUsersBean =objUsersDao.getById(id);
			
			
			
			objUsersBean.setPageName(pageName);
//			objUsersBean = objUserDetailsDao.getById(id);
			objeModel.addAttribute("createProfile", objUsersBean);
			 ipAddress =MiscUtils.getClientIpAddress(request);
		
			 request.setAttribute("pageName", pageName);
			 request.setAttribute("userBean", objUsersBean);
			 
			 	///////
				List<Map<String,Object>> castes_list =  objCastDao.getCastesBasedOnReligion(objUsersBean.getReligion());
				Map<Integer, String> castesMap = new LinkedHashMap<Integer, String>();
				for (Map<String,Object> caste : castes_list) {
					castesMap.put((Integer)caste.get("id"),(String)caste.get("name"));
				}
				request.setAttribute("castes_list", castesMap);
				/////
				List<Map<String,Object>> results = stateDao.getFilteredStates(objUsersBean.getCurrentCountry());
				Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
				for (Map<String,Object> state : results) {
					statesMap.put((Integer)state.get("id"),(String)state.get("name"));
				}
				request.setAttribute("states_map", statesMap);
				//////
				Map<Integer, String> citiesMap = new LinkedHashMap<Integer, String>();
				List<CityBean> ojCityBean = objCityDao.filterByState(objUsersBean.getCurrentState());
				for (CityBean city : ojCityBean) {
					citiesMap.put(city.getId(),city.getName());
				}
				request.setAttribute("cities_map", citiesMap);
				
				Map<Integer,String> filtered_states = new HashMap<Integer,String>();
				if(StringUtils.isNotBlank(objUsersBean.getrCountry())){
					List<Map<String,Object>> resultss = stateDao.getFilteredStates(objUsersBean.getrCountry());
					
					for(Map<String,Object> state:resultss){
						filtered_states.put((Integer)state.get("id"), (String)state.get("name"));
					}
					request.setAttribute("filtered_states", filtered_states);
				}
				Map<Integer,String> filtered_cities = new HashMap<Integer,String>();
				if(StringUtils.isNotBlank(objUsersBean.getrCountry())){
					List<Map<String,Object>> resultss = objCityDao.getFilteredCities(objUsersBean.getrState());
					
					for(Map<String,Object> state:resultss){
						filtered_cities.put((Integer)state.get("id"), (String)state.get("name"));
					}
					request.setAttribute("filtered_cities", filtered_cities);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			//return "countriesHome";
		}
		return "createProfile";
	}
	
	@RequestMapping(value = "/uploadPhotos/{id}/{firstName}/{lastName}")
	public String uploadPhotos(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session, @PathVariable("id") int id,@PathVariable("firstName") String firstName,@PathVariable("lastName") String lastName) {
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		return "createUploadPhotos";
	}
	
	
	
	@RequestMapping(value = "/addProfile")
	public String addProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		//System.out.println("addProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		BranchBean objBranch = null;
		String ipAddress = null;
		String msg= null;
		
		try {
			ipAddress =MiscUtils.getClientIpAddress(request);
			
			Date dob1 = HRMSUtil.dateFormate(objUsersBean.getDob());
			if(dob1 !=null){
				objUsersBean.setDob1(dob1);
			}
			
			if(StringUtils.isNotBlank(ipAddress)){
			objUsersBean.setLast_ip(ipAddress);
			}
			
			
			UsersBean objuserBean1 = (UsersBean) session.getAttribute("cacheUserBean");
			
			
			if(objUsersBean.getId() ==0){
				objUsersBean.setRoleId(4);
				int userId = objUsersDao.getNewUserId();
				/*if(StringUtils.isNotBlank(objUsersBean.getBranch())){
				objUsersBean.setPassword(MiscUtils.generateRandomString(6));
				int branchid = Integer.parseInt(objUsersBean.getBranch());
				objBranch = objBranchDao.getById(branchid);
				String prefix = objBranch.getPrefix();
				prefix = prefix.concat(objBranch.getFree());
				String ss=	StringUtils.leftPad(String.valueOf(userId), 6, "0");
				prefix = prefix.concat(ss);
				objUsersBean.setUsername(prefix);
				}*/
				objUsersBean.setStatus("1");
				objUsersBean.setUsername("AM"+MiscUtils.generateRandomNumber(6));
				if (objuserBean1 != null) {
					objUsersBean.setRegisterwith(String.valueOf(objuserBean1.getId()));
				}
				
				objUsersDao.save(objUsersBean);
				//
				try {
					EmailUtil emailUtil = new EmailUtil();
					if(StringUtils.isNotBlank(objUsersBean.getEmail())){
//						emailUtil.sendEmail(objUsersBean, objContext, "admin_send_password");
						
						String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						objUsersDao.saveEmailData(null, objUsersBean, baseurl, "admin_send_password");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				msg = "Inserted";
			}else{
				objUsersDao.save(objUsersBean);
				msg = "Updated";
			}
			
			objUsersBean.setUserId(objUsersBean.getId());
			objUserrequirementDao.save(objUsersBean);
//			objUserDetailsDao.save(objUsersBean);
			
			/*listOrderBeans = objCountriesDao.getAllCountries();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}*/
			redir.addFlashAttribute("msg", msg);
			if(StringUtils.isNotBlank(objUsersBean.getPageName())){
				return "redirect:"+objUsersBean.getPageName();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class addProfile method  ");
			return "CreateProfile";
		}
		return "redirect:AllProfilesHome";
	}
	/*@RequestMapping(value = "/imageUpload")
	public @ResponseBody String imageUpload(@RequestParam("imageName") MultipartFile file, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		String id =null;
		String msg= null;
		String name=null;
		String sTomcatRootPath = null;
		String sDirPath = null;
		String filepath = null;
		UserImagesBean objUerImagesBean = null;
		JSONObject objJson =new JSONObject();
		try {
			objUerImagesBean = new UserImagesBean();
			id=request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				objUerImagesBean.setUserId(id);
			}
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				name =file.getOriginalFilename();
				int n=name.lastIndexOf(".");
				name=name.substring(n + 1);
				name=name+".png";
				long millis = System.currentTimeMillis() % 1000;
				filepath= id+millis+".png";
				
				
				
				 String latestUploadPhoto = "";
			        String rootPath = request.getSession().getServletContext().getRealPath("/");
			        File dir = new File(rootPath + File.separator + "img");
			        if (!dir.exists()) {
			            dir.mkdirs();
			        }
			         
			        File serverFile = new File(dir.getAbsolutePath() + File.separator + filepath);
			      //  latestUploadPhoto = file.getOriginalFilename();
//			        file.transferTo(serverFile);
			    //write uploaded image to disk
			        try {
			            try (InputStream is = file.getInputStream(); BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
			                int i;
			                while ((i = is.read()) != -1) {
			                    stream.write(i);
			                }
			                stream.flush();
			                //send photo name to jsp
			            }
			        } catch (IOException e) {
			            System.out.println("error : " + e);
			        }
				  
				
			        filepath= "img/"+filepath;
			        objUerImagesBean.setImage(filepath);
			        objUerImagesBean.setStatus("1");
			        
			        ----------------------------------------
			        sTomcatRootPath = System.getProperty("catalina.base");
					sDirPath = sTomcatRootPath + File.separator + "webapps"+ File.separator + "img" ;
					System.out.println(sDirPath);
					File file1 = new File(sDirPath);
				    file.transferTo(file1);
				    try{
				    	objUserImageUploadDao.save(objUerImagesBean);
					    objJson.put("message", "success");
				    }catch(Exception e){
				    	e.printStackTrace();
				    	objJson.put("message", "failed");
				    }
				    
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class addProfile method  ");
		}
		return objJson.toString();
	}*/
	
	@RequestMapping(value = "/croppedImageUpload")
	public @ResponseBody String imageUpload(@RequestParam("fullImg") MultipartFile fullImage,ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		String id =null;
		String msg= null;
		String name=null;
		String sTomcatRootPath = null;
		String sDirPath = null;
		String filepath = null,fullImgfilepath = null;
		UserImagesBean objUerImagesBean = null;
		JSONObject objJson =new JSONObject();
		FileOutputStream osf;
		try {
			objUerImagesBean = new UserImagesBean();
			id=request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				objUerImagesBean.setUserId(id);
				
			}
			
			String imgData = request.getParameter("imageData");
			if (StringUtils.isNotBlank(imgData)) {
				Base64Decoder decoder = new Base64Decoder(); 
				byte[] imgBytes = decoder.decode(imgData.split(",")[1]);
				byte[] fullImageBytes = fullImage.getBytes();
				/*name=name.substring(n + 1);
				name=name+".png";*/
				//long millis = System.currentTimeMillis() % 1000;
				//filepath= id+millis+".png";
				long millis = System.currentTimeMillis() % 1000;
				filepath= id+millis+".png";
				fullImgfilepath= id+millis+".png";
				
				
				 String latestUploadPhoto = "";
			        //String rootPath = request.getSession().getServletContext().getRealPath("/");
				 	String rootPath = System.getProperty("catalina.base");
				 	
				 	File dir1 = new File(rootPath + File.separator + "img");
			        if (!dir1.exists()) {
			            dir1.mkdirs();
			        }
			        //File dir = new File(rootPath + File.separator + "img");
				 	File dir = new File(rootPath + File.separator + "webapps"+ File.separator + "aarna-user-images");
			        if (!dir.exists()) {
			            dir.mkdirs();
			        }
			         
			      //for saving full image
			        File fullImgdir = new File(rootPath + File.separator + "webapps"+ File.separator + "aarna-user-images"+ File.separator +"full-images");
			        if (!fullImgdir.exists()) {
			        	fullImgdir.mkdirs();
			        }
			        //File serverFile = new File(dir.getAbsolutePath() + File.separator + filepath);
			      //  latestUploadPhoto = file.getOriginalFilename();
//			        file.transferTo(serverFile);
			    //write uploaded image to disk
			        try {
			        	osf = new FileOutputStream(new File(dir1.getAbsolutePath() + File.separator + filepath));
			        	osf.write(imgBytes);
						 osf.flush();
			        } catch (IOException e) {
			            System.out.println("error : " + e);
			        }
			        
			        try {
			        	osf = new FileOutputStream(new File(dir.getAbsolutePath() + File.separator + filepath));
			        	osf.write(imgBytes);
						 osf.flush();
			        } catch (IOException e) {
			            System.out.println("error : " + e);
			        }
				  
			        try {
			            
			            osf = new FileOutputStream(new File(fullImgdir.getAbsolutePath() + File.separator + fullImgfilepath));
			    		
						 osf.write(fullImageBytes);
						 osf.flush();
			        } catch (IOException e) {
			            System.out.println("error : " + e);
			        }
			        //filepath= "img/"+filepath;
			        filepath= "aarna-user-images/"+filepath;
			        objJson.put("image_path", filepath);
			        objUerImagesBean.setImage(filepath);
			        objUerImagesBean.setStatus("1");
			        objUerImagesBean.setApprovedStatus("1");
			        
			     /*   ----------------------------------------*/
			        sTomcatRootPath = System.getProperty("catalina.base");
					sDirPath = sTomcatRootPath + File.separator + "webapps"+ File.separator + "img" ;
					System.out.println(sDirPath);
					//File file1 = new File(sDirPath);
				    //file.transferTo(file1);
				    try{
				    	objUserImageUploadDao.save(objUerImagesBean);
					    objJson.put("message", "success");
				    }catch(Exception e){
				    	e.printStackTrace();
				    	objJson.put("message", "failed");
				    }
				    
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class addProfile method  ");
		}
		return objJson.toString();
	}
	
	
	@ModelAttribute("cast")
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
	@ModelAttribute("education")
	public Map<Integer, String> populateeducation() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from education  where status='1' order by name asc";
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
	
	@ModelAttribute("maleOccupation")
	public Map<Integer, String> populateMaleOccupation() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from occupation  where status='1' and upper(name) not like upper('%house%wife%') order by name asc";
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
	@ModelAttribute("height")
	public Map<Integer, String> populateheight() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,inches from height  where status='1' ";
			List<HeightBean> list = objUsersDao.populate1(sSql);
			for (HeightBean bean : list) {
				statesMap.put(bean.getId(), bean.getInches());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	@ModelAttribute("complexion")
	public Map<Integer, String> populatecomplexion() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from complexion  where status='1' order by name asc";
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
	@ModelAttribute("raasi")
	public Map<Integer, String> populateraasi() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from raasi  where status='1' order by name asc";
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
	@ModelAttribute("star")
	public Map<Integer, String> populatestar() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from star  where status='1' order by name asc";
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
	@ModelAttribute("religion")
	public Map<Integer, String> populatereligion() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from religion  where status='1' order by name asc";
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
	@ModelAttribute("branch")
	public Map<Integer, String> populatebranch() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from branch  where status='1' order by name asc";
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
	@ModelAttribute("countries")
	public Map<Integer, String> populatecountries() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from countries  where status='1' order by name asc";
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
	@ModelAttribute("language")
	public Map<Integer, String> populatelanguage() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from language  where status='1' order by name asc";
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
	@ModelAttribute("bodyType")
	public Map<Integer, String> populatebodyType() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from body_type  where status='1' order by name asc";
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
	@ModelAttribute("states")
	public Map<Integer, String> populateState() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from state  where status='1' order by name asc";
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
	@ModelAttribute("citys")
	public Map<Integer, String> populateCity() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from city where status='1' order by name asc";
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
	
	@RequestMapping(value = "/castesBasedOnReligion")
	public @ResponseBody String castesBasedOnReligion(ReligionBean religionBean,
			HttpServletResponse response, HttpServletRequest request,
			HttpSession objSession) throws JsonGenerationException, JsonMappingException, IOException 
	{
	   JSONObject objJson =new JSONObject();
		List<Map<String, Object>> filterBean=null;
		String json="";
		String religionId =religionBean.getReligionId();
		
		ObjectMapper objmapper=new ObjectMapper();
		filterBean =  objCastDao.getCastesBasedOnReligion(religionId);
		if(filterBean.size()>0) {
			json=objmapper.writeValueAsString(filterBean);
			objJson.put("allOrders1", filterBean);
		}else {
			objJson.put("allOrders1", "");
			System.out.println();
		}
		
		
	  return String.valueOf(objJson);

	}
	
	@RequestMapping(value = "/getFilteredStates")
	public @ResponseBody String getFilteredStates(@ModelAttribute("createProfile") UsersBean userBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, Object>> results = null;
		try{
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheUserBean");
			if(userSessionBean == null){
					return "redirect:HomePage";
			}
			//int countryId =  userBean.getId(); //request.getParameter("countryId");
			String country_ids = request.getParameter("country_ids");
			if(StringUtils.isNotBlank(country_ids)){
				results = stateDao.getFilteredStates(country_ids);
			}
			if (results != null && results.size() > 0) {
				jsonObj.put("states_list", results);
				
			} else {
				jsonObj.put("states_list", "");
			}
			
		}catch(Exception e){
			logger.fatal("error in getFilteredStates method");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
	
	 @RequestMapping(value = "/getFilteredCities")
		public @ResponseBody String getFilteredCities(@ModelAttribute("createProfile") UsersBean userBean,ModelMap model, HttpServletRequest request, HttpSession session)
															throws JsonGenerationException, JsonMappingException, IOException {
			JSONObject jsonObj = new JSONObject();
			List<Map<String, Object>> results = null;
			try{
				UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheUserBean");
				if(userSessionBean == null){
					userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
					if(userSessionBean == null)
						return "redirect:HomePage";
				}
				String state_ids = request.getParameter("state_ids");
				if(StringUtils.isNotBlank(state_ids)){
					results = objCityDao.getFilteredCities(state_ids);
				}
				if (results != null && results.size() > 0) {
					jsonObj.put("city_list", results);
					
				} else {
					jsonObj.put("city_list", "");
				}
				
			}catch(Exception e){
				logger.fatal("error in getFilteredCities method");
				logger.error(e);
				e.printStackTrace();
			}
			return jsonObj.toString();
		}
	   
	
	@RequestMapping(value = "/getCitys")
	public  @ResponseBody String getCitys( ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		JSONObject objJson =new JSONObject();
		List<CityBean> ojCityBean = null;
		try {
			String id = null;
			id=request.getParameter("id");
			String state_ids = request.getParameter("state_ids");
			if(StringUtils.isNotBlank(state_ids)){
				ojCityBean = objCityDao.filterByState(state_ids);
			}
			
			if(ojCityBean !=null){
				objJson.put("citys", ojCityBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class CountriesHome method  ");
		}
		return String.valueOf(objJson);
	}
	
	@RequestMapping(value = "/mobileNumChecking")
	public @ResponseBody String mobileNumChecking(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		JSONObject objJson = new JSONObject();
		
		try {
			boolean exists = objUsersDao.mobileNumExistOrNot(objUsersBean);
			if(!exists){
				objJson.put("msg", "notexist");
			}else{
				objJson.put("msg", "exist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in mobileNumChecking method  ");
			objJson.put("msg", e);
		}
		return String.valueOf(objJson);
	}
	
}
