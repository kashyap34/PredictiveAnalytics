package com.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class PatientStatistics implements Serializable{
	private static final long serialVersionUID = 1L;
	private List<String> tagList;
	private Map<Integer, Integer> yearVsEncounterMap;
	private int sinceYear;
	private List<FamilyCondition> familyHistory;
	private String title;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	/*public PatientOccupation getOccupation() {
		return occupation;
	}
	public void setOccupation(PatientOccupation occupation) {
		this.occupation = occupation;
	}*/
	public List<FamilyCondition> getFamilyHistory() {
		return familyHistory;
	}
	public void setFamilyHistory(List<FamilyCondition> familyHistory) {
		this.familyHistory = familyHistory;
	}
	public int getSinceYear() {
		return sinceYear;
	}
	public void setSinceYear(int sinceYear) {
		this.sinceYear = sinceYear;
	}
	public List<String> getTagList() {
		return tagList;
	}
	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}
	public Map<Integer, Integer> getYearVsEncounterMap() {
		return yearVsEncounterMap;
	}
	public void setYearVsEncounterMap(Map<Integer, Integer> yearVsEncounterMap) {
		this.yearVsEncounterMap = yearVsEncounterMap;
	}
	
	

}
