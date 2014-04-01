package com.beans;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class PatientStatistics {
	private List<String> tagList = new ArrayList<String>();
	private Map<Integer, Integer> yearVsEncounterMap = new LinkedHashMap<Integer, Integer>();
	private int sinceYear;
	
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
