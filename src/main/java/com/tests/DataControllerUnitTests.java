package com.tests;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.controllers.DataController;

public class DataControllerUnitTests {
	private DataController dataController;
	private ModelMap model;
	private File csv, json;
	private MockMultipartFile csvFile, jsonFile;
	
	@Before
	public void initialize() throws IOException {
		dataController = new DataController();
		model = new ModelMap();
		csv = new File("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/DiseaseList.csv");
		json = new File("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/Diabetes_Sample.json");
		csvFile = new MockMultipartFile("file", csv.getName(), "text/plain", FileUtils.readFileToByteArray(csv));
		jsonFile = new MockMultipartFile("patientFile", json.getName(), "text/plain", FileUtils.readFileToByteArray(json));
	}
	
	@Test
	public void testAdminView() {
		assertEquals("Admin view is returned", "DataUpload", dataController.returnAdminView("kashyap@patel.com", model));
	}
	
	@Test
	public void testFetchContentsFromWHO() {
		assertNotNull("Fetched content is not null", dataController.fetchContentsFromURLWOQuery("http://apps.who.int/gho/data/view.main", false));
	}
	
	@Test
	public void testCsvFileUpload() {
		String name = csvFile.getName();
		
		assertNotNull("CSV file uploaded successfully", dataController.handleFileUpload(csvFile));
	}
	
	@Test
	public void testJsonFileUpload() {
		String name = jsonFile.getName();
		assertNotNull("JSON file uploaded successfully", dataController.handlePatientUpload(jsonFile));
	}
}
