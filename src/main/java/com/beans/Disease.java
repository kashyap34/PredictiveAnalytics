package com.beans;

public class Disease {
	private String indicator, who_region, country, sex ;
	private int year, no_of_cases;
	
	public int getNo_of_cases() {
		return no_of_cases;
	}
	public void setNo_of_cases(int no_of_cases) {
		this.no_of_cases = no_of_cases;
	}
	public String getIndicator() {
		return indicator;
	}
	public void setIndicator(String indicator) {
		this.indicator = indicator;
	}
	public String getWho_region() {
		return who_region;
	}
	public void setWho_region(String who_region) {
		this.who_region = who_region;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
