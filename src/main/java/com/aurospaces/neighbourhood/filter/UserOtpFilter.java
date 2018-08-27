package com.aurospaces.neighbourhood.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.aurospaces.neighbourhood.bean.UsersBean;  
  
public class UserOtpFilter implements Filter{  
  
public void init(FilterConfig arg0) throws ServletException {}  
      
public void doFilter(ServletRequest req, ServletResponse resp,  
        FilterChain chain) throws IOException, ServletException {  
          
	HttpServletRequest request = (HttpServletRequest) req;
    HttpServletResponse response = (HttpServletResponse) resp;
    HttpSession session = request.getSession(false);

    UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
    String otp_status = (String)session.getAttribute("otpStatus");
    if(StringUtils.isBlank(otp_status) || "0".equals(otp_status)){
		response.sendRedirect(request.getContextPath() + "/sendOtp.htm");
	}else {
        chain.doFilter(req, resp); // Logged-in user found, so just continue request.
    }
          
}  
    public void destroy() {}  
  
} 
