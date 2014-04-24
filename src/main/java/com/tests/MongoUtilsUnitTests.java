package com.tests;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.utils.MongoUtils;

public class MongoUtilsUnitTests {
	
	private MongoUtils mongoUtils;

	@Before
	public void initialize(){
		mongoUtils = new MongoUtils();
	}
	
	@Test
	public void testParseJSON() {
		assertEquals("Json schema parsed successfully", "Success", mongoUtils.parseJSON("Diabetes_sample.json"));
	}
	
	@Test
	public void testAllPatientsRetrieval() {
		assertNotNull("All patients retrieved", mongoUtils.retreiveAllPatients());
	}
	
	@Test
	public void testRetrievingStatisticsForPatient() {
		assertNotNull("Patient statistics retrieved", mongoUtils.retrieveStatisticsForPatient("cce1bd3b83676d7a9b286b374b4c34f8"));
	}
	
	@Test
	public void testDocumentUpdation() {
		assertEquals("Patient's info updated successfully", "{\"success\": \"Patient's information updated successfully\"}", mongoUtils.updateDocument("name", "John Locke", "cce1bd3b83676d7a9b286b374b4c34f8"));
	}
	
	@Test
	public void testPatientInfoRetrieval() {
		assertNotNull("Patient info retrieved", mongoUtils.retrievePatientInfo("cce1bd3b83676d7a9b286b374b4c34f8"));
	}
}
