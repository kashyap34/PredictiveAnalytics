package com.beans;

import java.io.Serializable;

public class FamilyCondition implements Serializable{
	
	private String disease;
	private int startAge, endAge;
	
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getStartAge() {
		return startAge;
	}
	public void setStartAge(int startAge) {
		this.startAge = startAge;
	}
	public int getEndAge() {
		return endAge;
	}
	public void setEndAge(int endAge) {
		this.endAge = endAge;
	}
	
	
}
