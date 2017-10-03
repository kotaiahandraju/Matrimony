package com.aurospaces.neighbourhood.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;

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
			body = body.replace("_name_",objUsersBean.getName());
			body = body.replace("_username_", objUsersBean.getUsername());
			body = body.replace("_password_", objUsersBean.getPassword());
			body = body.replace("_img_", "cid:image2");
	        
			subject = "Employee login details";
	        
	       
	 
	        // inline images
	        Map<String, String> inlineImages = new HashMap<String, String>();
//	        inlineImages.put("image1", objContext.getRealPath("images" +File.separator+"telugu.png"));
	        inlineImages.put("image2", objContext.getRealPath("images" +File.separator+"telugu.png"));
	 
	       
	            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo,
	                subject, body.toString(), inlineImages);
	            System.out.println("Email sent.");
	        } catch (Exception ex) {
	            System.out.println("Could not send email.");
	            ex.printStackTrace();
	        }
			return subject;
	}
}
			