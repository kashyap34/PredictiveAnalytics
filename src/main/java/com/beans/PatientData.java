package com.beans;

import java.util.List;

public class PatientData {
	private String name, gender, ethnicity, race, medical_record_no;
	private int age;
	private List<String> disease;
	
	
	public String getMedical_record_no() {
		return medical_record_no;
	}
	public void setMedical_record_no(String medical_record_no) {
		this.medical_record_no = medical_record_no;
	}
	public List<String> getDisease() {
		return disease;
	}
	public void setDisease(List<String> disease) {
		this.disease = disease;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEthnicity() {
		return ethnicity;
	}
	public void setEthnicity(String ehtnicity) {
		this.ethnicity = ehtnicity;
	}
	public String getRace() {
		return race;
	}
	public void setRace(String race) {
		this.race = race;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	

}
