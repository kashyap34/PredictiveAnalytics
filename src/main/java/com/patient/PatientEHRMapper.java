package com.patient;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.bson.BSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.xml.bind.v2.schemagen.xmlschema.List;

public class PatientEHRMapper extends Mapper<Object, BSONObject, Text, Patient> {
	
	@Override
	public void map(final Object key, final BSONObject val, final Context context) 
			throws IOException, InterruptedException {
		
		if(val.containsField("_id")) {
			Text medicalRecordNumber = new Text(val.get("birthdate").toString());
			
			/*Condition condition = (Condition)val.get("conditions");
			//Condition builder
			Condition conditionBuilder = new Condition();
			conditionBuilder.setDescription(condition.getDescription());*/
			
			System.out.println("Input received is: " + val.toString());
			
			ObjectMapper mapper = new ObjectMapper();
			Patient patient = mapper.readValue(val.toString(), Patient.class);
			ArrayList<Condition> conditions = (ArrayList<Condition>)patient.getConditions();
			for(Condition condition : conditions) {
				System.out.println("###############################################################" + condition.toString());
			}
			context.write(medicalRecordNumber, patient);
		}
	}

}
