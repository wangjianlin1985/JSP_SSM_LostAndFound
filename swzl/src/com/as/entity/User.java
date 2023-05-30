package com.as.entity;

import java.io.Serializable;





public class User extends BaseEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	private String userName;
	private String realName;
	private String password;
	private Integer userType;
	private Integer roleId;
	private String userDescription;
	private String roleName;
	private Dept dept;
	private String deptName;
	private Integer deptId;
	private Dept grade; // 年级
	
	
	public Dept getGrade() {
		return grade;
	}
	public void setGrade(Dept grade) {
		this.grade = grade;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getUserDescription() {
		return userDescription;
	}
	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", realName=" + realName + ", password=" + password
				+ ", userType=" + userType + ", roleId=" + roleId
				+ ", userDescription=" + userDescription + ", roleName="
				+ roleName + ", dept=" + dept + ", deptName=" + deptName
				+ ", deptId=" + deptId + ", grade=" + grade + "]";
	}
	
	
	
}
