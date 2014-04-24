package com.tests;

import static org.junit.Assert.*;

import java.net.UnknownHostException;

import org.junit.Before;
import org.junit.Test;
import org.springframework.ui.ModelMap;

import com.beans.PatientStatistics;
import com.controllers.DashboardController;
import com.utils.MongoUtils;

public class DashboardControllerUnitTests {

	private DashboardController dashboardController;
	private ModelMap model;
	private PatientStatistics patientStats;
	
	@Before
	public void initialize() throws UnknownHostException {
		dashboardController = new DashboardController();
		model = new ModelMap();
		patientStats = new PatientStatistics();
	}
	
	@Test
	public void testDashboardView() {
		assertEquals("Dashboard view is returned", "Dashboard", dashboardController.returnDashboardView(model));
	}
	
	@Test
	public void testPatientDashboardView() {
		assertEquals("Patient dashboard view is returned", "PatientDashboard", dashboardController.returnPatientView(model));
	}
	
	@Test
	public void testCountryListForDisease() {
		assertNotNull("Country list not null", dashboardController.getCountryListForDisease("Malaria"));
	}
	
	@Test
	public void testCountryCasesForDisease() {
		assertNotNull("Country cases list not null", dashboardController.getCountryCasesForDisease("Malaria", "India"));
	}
	
	@Test
	public void testAllOccupationsList() {
		assertNotNull("Occupations list not null", dashboardController.retrieveAllOccupations());
	}
	
	@Test
	public void testAllDiseaseList() {
		assertNotNull("Disease list not null", dashboardController.retrieveAllDisease());
	}
	
	@Test
	public void testPatientDetails() {
		assertNotNull("Patient details not null", dashboardController.retreivePatientDetails("cce1bd3b83676d7a9b286b374b4c34f8"));
	}
	
	@Test
	public void testPatientFamilyHistory() {
		assertNotNull("Patient history not null", dashboardController.retrievePatientsFamilyHistory(patientStats, "caf50e70e548d61d097c68e9001ded60"));
	}
	
	@Test
	public void testDiabetesPrediction() {
		assertNotNull("Diabetes prediction not null", dashboardController.predictDiabetesForPatient("cce1bd3b83676d7a9b286b374b4c34f8", "off", "off", "off", "off"));
	}

}
