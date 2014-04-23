package com.utils;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.controllers.DataController;

public class CrawlerUtils {
	
	private static Logger logger = LoggerFactory.getLogger(DataController.class);
	//private static java.util.logging.Logger logger = java.util.logging.Logger.getLogger(DataSearchController.class.getName());
	private ArrayList<String> linksList;
	//keeps count of depth of links traveled
	
	//private Map<String, Link> dataMap;
	
	
	public ArrayList<String> searchLinksFromURL(String url) {
		try {
			linksList = new ArrayList<String>();
			logger.info("Connecting to " + url + " for fetching the links");
			Document doc = Jsoup.connect(url).timeout(Constants.JSOUP_TIMEOUT).get();
			Elements links = doc.select("a[href]");

			linksList.clear();
			for (Element link : links) {
				if(link.text().isEmpty() || link.text() == null || link.text().equalsIgnoreCase("Home") || 
						link.text().equalsIgnoreCase("Data analysis") || link.text().equalsIgnoreCase("By Topic")
						|| link.text().equalsIgnoreCase("By country") || link.text().equalsIgnoreCase("By indicator") 
						|| link.text().equalsIgnoreCase("Visualizations") || link.text().equalsIgnoreCase("Metadata")
						|| link.text().equalsIgnoreCase("Resources") || link.text().equalsIgnoreCase("Toggle menu")
						|| link.text().equalsIgnoreCase("Feedback") || link.text().equalsIgnoreCase("Share")
						|| link.text().equalsIgnoreCase("? WHO 2013")) {
					//we need to skip these links. So do nothing
				}
				else {
					linksList.add(link.text());
				}
			}
			return linksList;

		} catch(SocketTimeoutException timeout) {
			logger.error("Timeout while waiting to crawl the URL");
			timeout.printStackTrace();
			linksList.clear();
			return null;
		} catch (Exception e) {
			logger.error("Error in fetching the links from specified URL");
			e.printStackTrace();
			linksList.clear();
			System.exit(0);
		}
		return null;
	}
	
	public String searchLinksFromURL(String url, String query) {
		try {
			logger.info("Connecting to " + url + " for fetching the links");
			Document doc = Jsoup.connect(url).timeout(Constants.JSOUP_TIMEOUT).get();
			Elements links = doc.select("a[href]");

			for (Element link : links) {
				if(link.text().equalsIgnoreCase(query)) {
					String linkToCrawl = link.attr("abs:href");
					logger.info("Found next level crawler link at: " + linkToCrawl);
					return linkToCrawl;
				}
	        }
		} catch(SocketTimeoutException timeout) {
			logger.error("Timeout while waiting to crawl the URL");
			timeout.printStackTrace();
			linksList.clear();
			return "";
		} catch (Exception e) {
			logger.error("Error in fetching the links from specified URL");
			e.printStackTrace();
			System.exit(0);
		}
		return "";
	}

	public Map<String, String> searchForData(String url) {
		try {
			//Map for link name vs. link url
			Map<String, String> dataMap = new LinkedHashMap<String, String>();
			boolean isDone = false;
			Document doc = Jsoup.connect(url).get();
			Elements iframes = doc.select("iframe");

			for(Element iframe : iframes) {
				String linkToFilteredIframe = iframe.getElementsByTag("iframe").attr("abs:src");

				if(!linkToFilteredIframe.contains("google")) {
					Document iframeDoc = Jsoup.connect(linkToFilteredIframe).get();
					Elements dataIframes = iframeDoc.select("iframe");

					for(Element dataIframe : dataIframes) {
						String linkToDataIframe = dataIframe.getElementsByTag("iframe").attr("abs:src");
						Document dataIframeDoc = Jsoup.connect(linkToDataIframe).get();
						Elements dataLinks = dataIframeDoc.select("a[href]");

						for(Element dataLink : dataLinks) {
							String dataLinkText = dataLink.text();
							String dataLinkURL = dataLink.attr("abs:href");
							System.out.println("Data Link found at: " + dataLink.attr("abs:href"));
							if(!dataLinkURL.isEmpty() && dataLinkURL.contains(".csv")) {
								logger.info("Adding a new csv entry to the data map");
								dataMap.put(dataLinkText, dataLinkURL);
								isDone = true;
							}
							else if(dataLinkURL.contains(".xls")) {
								logger.info("Adding a new xls entry to the data map");
								dataMap.put(dataLinkText, dataLinkURL);
								isDone = true;
							}
							else if(dataLinkURL.contains(".html")) {
								logger.info("Adding a new html entry to the data map");
								dataMap.put(dataLinkText, dataLinkURL);
								isDone = true;
							}
							else if(dataLinkURL.contains(".xml")) {
								logger.info("Adding a new xml entry to the data map");
								dataMap.put(dataLinkText, dataLinkURL);
								isDone = true;
							}
						}
					}
				}
//				System.out.println("Found data Link: " + dataLink);
			}
			if(isDone)
				return dataMap;
			else
				return null;

		}catch(SocketTimeoutException timeout) {
			logger.error("Timeout while waiting to crawl the URL");
			timeout.printStackTrace();
			linksList.clear();
			return null;
		}catch(IOException e){
			logger.error("Error in searching data in the URL");
			e.printStackTrace();
			//System.exit(0);
			return null;
		}
	}

}
