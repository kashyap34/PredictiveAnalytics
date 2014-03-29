package com.beans;

import java.util.LinkedHashMap;
import java.util.Map;

public class CountryData {
	
	private String countryName;
	private Map<Integer, Integer> yearVsCasesMap = new LinkedHashMap<Integer, Integer>();

	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Map<Integer, Integer> getYearVsCasesMap() {
		return yearVsCasesMap;
	}
	public void setYearVsCasesMap(Map<Integer, Integer> yearVsCasesMap) {
		this.yearVsCasesMap = yearVsCasesMap;
	}

}
