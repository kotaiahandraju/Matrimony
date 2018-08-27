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
	private Environment env;
	
	@Scheduled(cron = "0 0/15 6-16 * * *") //weekly, every monday at 12 am
	 public void sendWeeklyMatches(){
		System.out.println("#########  sendWeeklyMatches ###########");
		jobsController.weeklyMatchEmails();
	 }
	
	@Scheduled(cron = "0 */5 * * * *") //daily at 12 am
	 public void sendEmails(){
		System.out.println("#########  sendEmails ###########");
		jobsController.sendEmails();
	 }
	
	@Scheduled(cron = "0 0/25 14-16 * * *") //daily at 12 am
	 public void checkMembershipValidity(){
		System.out.println("#########  checkMembershipValidity ###########");
		jobsController.checkMembershipValidity();
	 }
	
	/*@Scheduled(cron = "0 0 12 * * *") //daily at 12 am
	 public void splitProfilesToEmployees(){
		System.out.println("#########  splitProfilesToEmployees ###########");
		jobsController.splitProfilesToEmployees();
	 }
	
	@Scheduled(cron = "0 0 12 1 * ?") //every month 1st at 12 am
	 public void rotateEmployeesProfilesSlot(){
		System.out.println("#########  rotateEmployeesProfilesSlot ###########");
		jobsController.rotateEmployeesProfilesSlot();
	 }*/
}
