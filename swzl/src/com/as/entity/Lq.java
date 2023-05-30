package com.as.entity;


public class Lq extends BaseEntity{

	private Integer id;
	private String name;
	private String phone;
	private String time;
	private Swzl swzl;
	private User user;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Swzl getSwzl() {
		return swzl;
	}
	public void setSwzl(Swzl swzl) {
		this.swzl = swzl;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
