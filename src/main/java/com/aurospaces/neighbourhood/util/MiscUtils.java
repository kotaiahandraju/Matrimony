package com.aurospaces.neighbourhood.util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;


import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
public class MiscUtils
{
	public static long getTimeNow() {
		return System.currentTimeMillis();
	}

	public static Date getDate(int days) {
		long eachDay = 24 * 60 * 60 * 1000;
		if (days == 2) {
			return new Date(eachDay * 2 + getTimeNow());
		} else if (days == 1) {
			return new Date(eachDay * 1 + getTimeNow());
		} else
			return new Date();
	}

	public static Date getDate(String dayDesc) {
		if (dayDesc.equals("Today")) {
			return getDate(0);
		} else if (dayDesc.equals("Tomorrow")) {
			return getDate(1);
		}
		return getDate(2);
	}

	public static Date getDate2(String dayDesc) {
		if (dayDesc.equals("dayafter")) {
			return getDate(2);
		} else if (dayDesc.equals("tmrw")) {
			return getDate(1);
		}
		return getDate(0);
	}


	public static String bigRandomString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	public static int bigRandomStringLen = bigRandomString.length() - 1;
	public static Random rd = new Random();



	public static String generateRandomString(int len)
	{
		StringBuilder bld = new StringBuilder();
		for(int i = 0 ; i < len ; i++)
		{
			int locSet = Math.round((bigRandomStringLen * rd.nextFloat()));	
			bld.append(bigRandomString.charAt(locSet));
		}
		return bld.toString();
	}


	public static int generateRandomNumber(int len)
	{
		Random rnd = new Random();
		int n = 0;
		if(len==6){
			n = 100000 + rnd.nextInt(900000);
		}
		return n;
	}

	public static String getBaseUrl(HttpServletRequest request)
	{
	  return request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath(); 
	}

	public static String genOtp()
	{
		String tempStr = System.currentTimeMillis() + "";
		String otp = tempStr.substring(7);
		return otp;
	}
	public static String getClientIpAddress(HttpServletRequest request) {
	    String xForwardedForHeader = request.getHeader("X-Forwarded-For");
	    if (xForwardedForHeader == null) {
	        return request.getRemoteAddr();
	    } else {
	        // As of https://en.wikipedia.org/wiki/X-Forwarded-For
	        // The general format of the field is: X-Forwarded-For: client, proxy1, proxy2 ...
	        // we only want the client
	        return new StringTokenizer(xForwardedForHeader, ",").nextToken().trim();
	    }
	}
	
	   public static void addTextWatermark(String text, String type, java.io.File source, java.io.File destination) throws IOException {
	        BufferedImage image = ImageIO.read(source);

	        // determine image type and handle correct transparency
	        int imageType = "png".equalsIgnoreCase(type) ? BufferedImage.TYPE_INT_ARGB : BufferedImage.TYPE_INT_RGB;
	        BufferedImage watermarked = new BufferedImage(image.getWidth(), image.getHeight(), imageType);

	        // initializes necessary graphic properties
	        Graphics2D w = (Graphics2D) watermarked.getGraphics();
	        w.drawImage(image, 0, 0, null);
	        AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.4f);
	        w.setComposite(alphaChannel);
	        w.setColor(Color.BLACK);
	        w.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 26));
	        FontMetrics fontMetrics = w.getFontMetrics();
	        
	        
	        
	        AffineTransform orig = w.getTransform();
	        AffineTransform at = new AffineTransform();
	        at.setToRotation(Math.toRadians(90), 80, 100);
	        w.setTransform(at);
	        Rectangle2D rect = fontMetrics.getStringBounds(text, w);
	        ///
	        // calculate center of the image
	        int posX = (image.getHeight() - (int) rect.getWidth()) / 2;
	        int posY = image.getWidth()-50;
	        // add text overlay to the image
	       // w.drawString(text, centerX, centerY);
	        w.drawString(text, 0, 100);
	        //w.setTransform(orig);
	        ImageIO.write(watermarked, type, destination);
	        w.dispose();
	    }
}
