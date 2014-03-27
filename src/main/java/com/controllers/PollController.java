package com.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.MysqlDao;

@Controller
public class PollController {
	private String options[] = {"Diabetes", "Obesity", "Flu", "Heart_Problems", "Malaria", "Smoking_Habits"};
	private MysqlDao mysqlDao = new MysqlDao();
	private static final Logger logger = LoggerFactory.getLogger(PollController.class);
	
	@RequestMapping(value="/home/poll", method = RequestMethod.POST)
	public @ResponseBody String submitPoll(@RequestParam("value") String option) {
		int index = Integer.parseInt(option.replace("opt", ""));
		String fieldToUpdate = options[index];
		try {
			if(!fieldToUpdate.isEmpty()) {
				String response = mysqlDao.updateAndGetVoteCount(fieldToUpdate);
				
				if(!response.isEmpty())
					return response;
				else
					return "{\"error\":\"Error in poll. Come back later\"}";
			}
			
		} catch(Exception e) {
			logger.error("Error in updating the votes file");
			e.printStackTrace();
			return "{\"error\":\"Error in poll. Come back later\"}";
		}
		return "";
	}
	
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String returnContactView(ModelMap model) {
		return "Contact";
	}
	
}
