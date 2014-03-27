package com.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.utils.CrawlerUtils;
import com.utils.CsvUtils;
import com.utils.MongoUtils;

@Controller
@RequestMapping("admin")
public class DataController {
	
	private static Logger logger = LoggerFactory.getLogger(DataController.class);
	private ArrayList<String> fetchedLinksList, visitedLinksList, filteredLinksList;
	//keeps count of depth of links traveled
	private int i = 1;
	private String whoURL = "http://apps.who.int/gho/data/view.main", pageToLoad, crawlerLink;
	//Map for link name vs. link url
	private Map<String, String> dataMap;
	private String fileDownloadLocation = "/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/WHOData/";
	private String fileName = "";
	private CrawlerUtils crawlerUtils;
	
	{
		logger.info("Initializing the Maps to store data links");
		dataMap = new LinkedHashMap<String, String>();
		crawlerUtils = new CrawlerUtils();
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/data/who")
	public String fetchContentsFromURLWOQuery(String whoURL, ModelMap model) {
		try{
			if(whoURL == null || whoURL.isEmpty()) {
				whoURL = "http://apps.who.int/gho/data/view.main";
			}
			fetchedLinksList = crawlerUtils.searchLinksFromURL(whoURL);
			if(fetchedLinksList != null) {
				
				filteredLinksList = new ArrayList<String>();
				
				if ( i == 1 ) {
					//To make sure that the navigation links are stored the first time we fetch contents from URL
					//Second time onwards we compare the navigation links with fetched links and remove already visited link from available links
					logger.info("Generating the menu links");
					visitedLinksList = new ArrayList<String>(fetchedLinksList);
				}
				
				for (String link : fetchedLinksList) {
					if(!visitedLinksList.contains(link) && !filteredLinksList.contains(link)) {
						logger.info("MenuLinks doesnot contain " + link);
						filteredLinksList.add(link);
					}
				}
				
				System.out.println("Fetched Links: ");
				
				if( i == 1 ) {
					model.addAttribute("link", visitedLinksList);
				}
				else {
					for(String link: filteredLinksList) {
						//Since the current filtered link(s) is(are) visited, add them to visitedLinks.
						visitedLinksList.add(link);
						logger.info("Adding link to filtered list : " + link);
					}
					model.addAttribute("link", filteredLinksList);
				}
			} else {
				model.addAttribute("crawlerError", "Unable to crawl the WHO Data Repository. It may be down for maintenance");
			}
			
		} catch(Exception e) {
			logger.error("Something is wrong in the processing of this request");
		}
		return "DataUpload";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/data/who/{query}")
	public String fetchContentsFromURLWithQuery(@PathVariable String query, ModelMap model) {
		try{
			crawlerLink = crawlerUtils.searchLinksFromURL(whoURL, query);
			if(!crawlerLink.isEmpty()) {
				
				logger.info("Link corresponding to user's query for " + query + " found: " + crawlerLink);
				logger.info("Incrementing the visiting depth of the crawler to: " + ++i);
				//i++;
				logger.info("Clearing the links array");
				fetchedLinksList.clear();
				filteredLinksList.clear();
				
				fileName = fileName + query + "_";
				
				if(crawlerUtils.searchForData(crawlerLink)) {
					logger.info("Found data. Returning to the caller.....");
					model.addAttribute("linkMap", dataMap);
					
					if((pageToLoad = fetchContentsFromURLWOQuery(crawlerLink, model)) != null) {
						whoURL = crawlerLink;
						return pageToLoad;
					}
					else
						return "DataUpload";
				}
				else
					pageToLoad = fetchContentsFromURLWOQuery(crawlerLink, model);
			} else {
				model.addAttribute("crawlerError", "Unable to crawl the WHO Data Repository. It may be down for maintenance");
			}
		} catch(Exception e) {
			logger.error("Error in fetching the contents for the given query");
			e.printStackTrace();
		}
		whoURL = crawlerLink;
		return pageToLoad;
	}
	
	@RequestMapping(value="/data/who", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("file") MultipartFile file, ModelMap model){
		String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
			if (name.endsWith(".csv")) {
				try {
					fileName = fileDownloadLocation + name;
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(fileName)));
					stream.write(bytes);
					stream.close();
					CsvUtils csvUtils = new CsvUtils(fileName);
					if(csvUtils.parseCsv()) {
						return "{\"success\": \"You successfully uploaded " + name
								+ "\"}";
					}
					else {
						return "{\"error\": \"Error in parsing the file: " + name
								+ "\"}";
					}
				} catch (Exception e) {
					return "{\"error\": \"Error in uploading " + name + "\"}";
				}
			}
			else {
				return "{\"error\": \"File format not supported. Please upload CSV files only\"}";
			}
		} else {
			return "{\"error\": \"File" + name + " is empty\"}";
		}
    }
	
	@RequestMapping(value="/data/who/patient", method=RequestMethod.POST)
	public @ResponseBody String handlePatientUpload(@RequestParam("patientFile") MultipartFile file, ModelMap model) {
		String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
			if (name.endsWith(".json")) {
				try {
					fileName = fileDownloadLocation + name;
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(fileName)));
					stream.write(bytes);
					stream.close();
					MongoUtils mongoUtils = new MongoUtils(fileName);
					String response = mongoUtils.parseJSON();
					if(!response.isEmpty()) {
						return "{\"success\": \"You successfully uploaded " + name
								+ ". Patient ID is: " + response + "\"}";
					}
					else {
						return "{\"error\": \"Error in parsing the file: " + name
								+ "\"}";
					}
				} catch (Exception e) {
					return "{\"error\": \"Error in uploading " + name + "\"}";
				}
			}
			else {
				return "{\"error\": \"File format not supported. Please upload JSON files only\"}";
			}
		} else {
			return "{\"error\": \"File" + name + " is empty\"}";
		}
    }
}

