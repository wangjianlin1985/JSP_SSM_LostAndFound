package com.as.entity;

//部门班级
public class Dept extends BaseEntity{

	private int id;  // id               
	private int pid;  // 上级id
	private String name;  // 名称
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Override
	public String toString() {
		return "Dept [id=" + id + ", pid=" + pid + ", name=" + name + "]";
	}
	
	
}
