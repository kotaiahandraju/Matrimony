package com.aurospaces.neighbourhood.util;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.aurospaces.neighbourhood.controller.JobsController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
@EnableScheduling
public class ScheduledJobs {

	@Autowired
	JobsController jobsController;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	
	@Autowired
	private Environment env;
	
	/*@Scheduled(cron = "0 0 24 * * 1") //weekly, every monday at 12 am
	 public void sendWeeklyMatches(){
		jobsController.weeklyMatchEmails(session, request);
	 }*/
	
	@Scheduled(cron = "10 0 0 * * *") //daily at 12 am
	 public void sendEmails(){
		jobsController.sendEmails(session, request);
	 }
	
	/*@Scheduled(cron = "0 0 24 * * *") //daily at 12 am
	 public void checkMembershipValidity(){
		jobsController.checkMembershipValidity();
	 }
	
	@Scheduled(cron = "0 0 24 * * *") //daily at 12 am
	 public void splitProfilesToEmployees(){
		jobsController.splitProfilesToEmployees();
	 }
	
	@Scheduled(cron = "0 0 24 1 * *") //every month 1st at 12 am
	 public void rotateEmployeesProfilesSlot(){
		jobsController.rotateEmployeesProfilesSlot();
	 }*/
}
