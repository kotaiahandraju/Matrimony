package com.aurospaces.neighbourhood.bean;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberShipBean {
	private int id=0;
	protected Date createdTime ;

	protected Date updatedTime ;
	@NotEmpty
	private String name;
	private int duration;
	private String duration_type;
	@NotEmpty
	private String description;
	private String status;
	private long price=0;
	private String allowed_messages_limit;
	private String allowed_profiles_limit;
	private String highlight_profile;
	private String chat_allowed;
	private String horoscope_view;
	private String Astrology_match;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getAllowed_messages_limit() {
		return allowed_messages_limit;
	}
	public void setAllowed_messages_limit(String allowed_messages_limit) {
		this.allowed_messages_limit = allowed_messages_limit;
	}
	public String getAllowed_profiles_limit() {
		return allowed_profiles_limit;
	}
	public void setAllowed_profiles_limit(String allowed_profiles_limit) {
		this.allowed_profiles_limit = allowed_profiles_limit;
	}
	public String getHighlight_profile() {
		return highlight_profile;
	}
	public void setHighlight_profile(String highlight_profile) {
		this.highlight_profile = highlight_profile;
	}
	public String getChat_allowed() {
		return chat_allowed;
	}
	public void setChat_allowed(String chat_allowed) {
		this.chat_allowed = chat_allowed;
	}
	public String getHoroscope_view() {
		return horoscope_view;
	}
	public void setHoroscope_view(String horoscope_view) {
		this.horoscope_view = horoscope_view;
	}
	public String getAstrology_match() {
		return Astrology_match;
	}
	public void setAstrology_match(String astrology_match) {
		Astrology_match = astrology_match;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getDuration_type() {
		return duration_type;
	}
	public void setDuration_type(String duration_type) {
		this.duration_type = duration_type;
	}
	
	
	
	
	
	
	
}
