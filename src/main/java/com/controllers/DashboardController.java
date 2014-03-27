package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.MysqlDao;
import com.utils.RUtils;

@Controller
public class DashboardController {
	
	private MysqlDao dao = new MysqlDao();
	private static RUtils rUtils = new RUtils();
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String returnDashboardView(ModelMap model) {
		System.out.println("JRI Path is: " + System.getProperty("java.library.path"));
		Map<String, Double> avgCasesMap = dao.getAverageCasesForCountry("United States of America");
		ArrayList<Double> predictedCountryInstances = rUtils.predictInstance();
		model.addAttribute("countryPredictions", predictedCountryInstances.toArray());
		model.addAttribute("avgCasesMap", avgCasesMap);
		return "Dashboard";
	}
}
