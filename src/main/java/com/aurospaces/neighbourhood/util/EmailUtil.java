package com.aurospaces.neighbourhood.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.aurospaces.neighbourhood.bean.ReportsBean;
import com.aurospaces.neighbourhood.bean.UsersBean;


public class EmailUtil {
	public String sendEmail(UsersBean objUsersBean,
			ServletContext objContext, String sMailTo) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = objUsersBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			//String propertiespath = "C:\\PRO\\Database.properties";
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        
			body = prop.getProperty("admin_send_password");
			body = body.replace("_name_",objUsersBean.getFirstName());
			//body = body.replace("_username_", objUsersBean.getUsername());
			body = body.replace("_username_", objUsersBean.getEmail());
			body = body.replace("_password_", objUsersBean.getPassword());
			body = body.replace("_img_", "cid:image2");
	        
			subject = "Aarna Matrimony login details";
	        
	       
	 
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
	
	public String sendResetPasswordEmail(UsersBean objUsersBean,
			ServletContext objContext, String mailType) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = objUsersBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			//String propertiespath = "C:\\PRO\\Database.properties";
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        if("admin_reset_password".equalsIgnoreCase(mailType)){
	        	subject = prop.getProperty("admin_reset_password_subject");
	            
				body = prop.getProperty("admin_reset_password_body");
				body = body.replace("_name_",objUsersBean.getFirstName()+" "+objUsersBean.getLastName());
				//body = body.replace("_username_", objUsersBean.getUsername());
				body = body.replace("_password_", objUsersBean.getPassword());
	        }else if("change_password".equalsIgnoreCase(mailType)){
	        	subject = prop.getProperty("change_password_subject");
	            
				body = prop.getProperty("change_password_body");
				body = body.replace("_name_",objUsersBean.getFirstName()+" "+objUsersBean.getLastName());
				//body = body.replace("_username_", objUsersBean.getUsername());
				body = body.replace("_email_", objUsersBean.getEmail());
				body = body.replace("_dateandtime_", objUsersBean.getUpdatedTime().toString());
	        }else if("forgot_password".equalsIgnoreCase(mailType)){
	        	subject = prop.getProperty("forgot_password_subject");
	            
				body = prop.getProperty("forgot_password_body");
				body = body.replace("_name_",objUsersBean.getFirstName()+" "+objUsersBean.getLastName());
				body = body.replace("_email_", objUsersBean.getEmail());
				body = body.replace("_newpassword_", objUsersBean.getPassword());
	        }
			
			body = body.replace("_img_", "cid:image2");
	        
			// inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
	
	public static String sendProfilesListEmail(UsersBean receiverBean,List<Map<String,String>> profilesList,
			String mailType, ServletContext objContext, HttpServletRequest request) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = receiverBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			//String propertiespath = "C:\\PRO\\Database.properties";
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        if("profiles_list_email".equalsIgnoreCase(mailType)){
	        	subject = prop.getProperty("profiles_list_subject");
	            StringBuffer profiles_list = new StringBuffer("");
	            for(Map<String,String> profile:profilesList){
	            	String profile_format = prop.getProperty("profile_format");
		            profile_format = profile_format.replace("_name_",profile.get("firstName")+" "+profile.get("lastName"));
		            profile_format = profile_format.replace("_username_",profile.get("username"));
		            profile_format = profile_format.replace("_age_",StringUtils.isNotBlank(profile.get("age"))?profile.get("age"):" ");
		            profile_format = profile_format.replace("_height_",StringUtils.isNotBlank(profile.get("inches"))?profile.get("inches"):" ");
		            profile_format = profile_format.replace("_mothertongue_",StringUtils.isNotBlank(profile.get("motherTongueName"))?profile.get("motherTongueName"):" ");
		            profile_format = profile_format.replace("_religion_",StringUtils.isNotBlank(profile.get("religionName"))?profile.get("religionName"):" ");
		            profile_format = profile_format.replace("_country_",StringUtils.isNotBlank(profile.get("countryName"))?profile.get("countryName"):" ");
		            profile_format = profile_format.replace("_income_",StringUtils.isNotBlank(profile.get("annualIncome"))?profile.get("annualIncome"):" ");
		            profile_format = profile_format.replace("_education_",StringUtils.isNotBlank(profile.get("educationName"))?profile.get("educationName"):" ");
		            profile_format = profile_format.replace("_unnamedimage_","cid:defaultimage");
		            // url formation
		            String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
					String actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+profile.get("username")+"&suc="+receiverBean.getUnique_code()+"&puc="+profile.get("unique_code");
					///
					profile_format = profile_format.replace("_actionurl_",actionUrl);
					
		            profiles_list.append(profile_format);
	            }
	            
	            
				body = prop.getProperty("profiles_list_format");
				body = body.replace("_logo_","cid:logo");
				//body = body.replace("_username_", objUsersBean.getUsername());
				body = body.replace("_profileslist_", profiles_list);
	        }
			//body = body.replace("_img_", "cid:image2");
	        
			// inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("defaultimage", objContext.getRealPath("images" +File.separator+"default.png"));
	        inlineImages.put("logo", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
	
	public String sendUserRegisteredNotification(UsersBean objUsersBean,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			//String propertiespath = "C:\\PRO\\Database.properties";
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String mailTo = prop.getProperty("adminemail");
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        	subject = prop.getProperty("user_registered_email_subject");
	        	subject = subject.replace("_username_",objUsersBean.getUsername());
	        	
				body = prop.getProperty("user_registered_email_body");
				body = body.replace("_username_",objUsersBean.getUsername());
				body = body.replace("_dateandtime_", objUsersBean.getCreatedTimeAsString());
			
			body = body.replace("_img_", "cid:image2");
	        
			// inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	       
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
	
	public String sendWelcomeMail(UsersBean objUsersBean,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = objUsersBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			input = new FileInputStream(propertiespath);
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        
			subject = prop.getProperty("welcome_mail_subject");
			
			body = prop.getProperty("welcome_mail_body");
			/*body = body.replace("_name_",objUsersBean.getFirstName());
			//body = body.replace("_username_", objUsersBean.getUsername());
			body = body.replace("_username_", objUsersBean.getEmail());
			body = body.replace("_password_", objUsersBean.getPassword());*/
			body = body.replace("_img_", "cid:image2");
			body = body.replace("_bodyimage_", "cid:image3");
	        
			
	        
	       
	 
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	        inlineImages.put("image3", objContext.getRealPath("images" +File.separator+"matri.jpg"));
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
	
	public static String sendInterestMail(UsersBean senderBean,UsersBean receiverBean,HttpServletRequest request,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = receiverBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			input = new FileInputStream(propertiespath);
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        
			subject = prop.getProperty("interest_mail_subject");
			subject = subject.replace("_username_", senderBean.getUsername());
			
			body = prop.getProperty("interest_mail_body");
			body = body.replace("_senderphoto_", "cid:senderimage");
			body = body.replace("_senderusername_", senderBean.getUsername());
			
			// url formation
            String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
			String actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+senderBean.getUsername()+"&suc="+receiverBean.getUnique_code()+"&puc="+senderBean.getUnique_code();
			///
			body = body.replace("_fullprofileaction_", actionUrl);
			body = body.replace("_content_", receiverBean.getMail_content());
			body = body.replace("_img_", "cid:image2");
	        String str = body.toString();
	        	
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        String sender_img = senderBean.getProfileImage();
	        if(StringUtils.isNotBlank(sender_img)){
	        	inlineImages.put("senderimage", objContext.getRealPath(sender_img));
	        }else{
	        	inlineImages.put("senderimage", objContext.getRealPath("img" +File.separator+"default.png"));
	        }
	        
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	            return null;
	        }
			return subject;
	}
	
	public static String sendPostPaymentMail(UsersBean userBean, Map<String,Object> paymentDetails, HttpServletRequest request,
			ServletContext objContext) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = userBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			input = new FileInputStream(propertiespath);
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        
			subject = prop.getProperty("post_payment_subject");
			subject = subject.replace("_name_", userBean.getFirstName()+" "+userBean.getLastName()+" ("+userBean.getUsername()+")");
			
			body = prop.getProperty("post_payment_body");
			body = body.replace("_dateandtime_", (String)paymentDetails.get("paymentDate"));
			//body = body.replace("_plan_", "");
			body = body.replace("_paidamount_", String.valueOf(paymentDetails.get("price")));
			body = body.replace("_img_", "cid:image2");
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	            return null;
	        }
			return subject;
	}
	
	public String emailVerify(UsersBean objUsersBean,ServletContext objContext,HttpServletRequest request) throws AddressException,
			MessagingException, IOException {
		String subject = null;
		Properties prop = new Properties();
		InputStream input = null;
		String body = null;
		try{
	 
	        String mailTo = objUsersBean.getEmail();
	        
//	        -------------------------------------------------------------------------------------------
			
			
	        String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
			input = new FileInputStream(propertiespath);
			prop.load(input);
			String host = prop.getProperty("host");
			String port = prop.getProperty("port");
			String mailFrom = prop.getProperty("usermail");
			String password = prop.getProperty("mailpassword");
	        
			subject = prop.getProperty("emaiVerifySubject");
			
			body = prop.getProperty("emailVerifyBody");
			/*body = body.replace("_name_",objUsersBean.getFirstName());
			//body = body.replace("_username_", objUsersBean.getUsername());
			body = body.replace("_username_", objUsersBean.getEmail());
			body = body.replace("_password_", objUsersBean.getPassword());*/
			body = body.replace("_img_", "cid:image2");
			
	       String baseUrl =  MiscUtils.getBaseUrl(request);
			String link = baseUrl+"/users/emailvarificationlink?email="+mailTo+"&code="+objUsersBean.getUnique_code();
			System.out.println(link);
	       body = body.replace("_link_", link);
	       body = body.replace("_customer_", objUsersBean.getFirstName()+" "+objUsersBean.getLastName());
	       
	       
	 
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	            return "Mail sent successfully";
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	            return "Mail sent filed";
	        }
	}
	public String bulkmail(UsersBean objUsersBean,ServletContext objContext,HttpServletRequest request,ReportsBean objReportsBean) throws AddressException,
	MessagingException, IOException {
String subject = null;
Properties prop = new Properties();
InputStream input = null;
String body = null;
try{

    String mailTo = objUsersBean.getEmail();
    
//    -------------------------------------------------------------------------------------------
	
	
    String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
	input = new FileInputStream(propertiespath);
	prop.load(input);
	String host = prop.getProperty("host");
	String port = prop.getProperty("port");
	String mailFrom = prop.getProperty("usermail");
	String password = prop.getProperty("mailpassword");
    
	subject = objReportsBean.getMailSubject();
	
	body = prop.getProperty("bulkmail");
	body = body.replace("_message_", objReportsBean.getMessage());
	body = body.replace("_img_", "cid:image2");
	
   body = body.replace("_customer_", objUsersBean.getFirstName()+" "+objUsersBean.getLastName());
   
   

    // inline images
    Map<String, String> inlineImages = new HashMap<String, String>();
//    inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
    inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"logo.jpg"));

   
        EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
            subject, body.toString(), inlineImages);
        System.out.println("Email sent.");
        return "Mail sent successfully";
    } catch (Exception ex) {
        System.out.println("Could not send email.");
        ex.printStackTrace();
        return "Mail sent filed";
    }
}
	
}
			