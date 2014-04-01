package com.patient;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.bson.BSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.DBObject;
import com.mongodb.hadoop.io.BSONWritable;
import com.mongodb.util.JSON;

public class PatientEHRReducer extends Reducer<Text, Patient, Text, BSONWritable> {

	@Override
	public void reduce(final Text recordNo, final Iterable<Patient> pValues, final Context context) 
		throws IOException, InterruptedException {
		
		ObjectMapper mapper = new ObjectMapper();
		
		for(final Patient patient : pValues) {
			ArrayList<Condition> conditions = (ArrayList<Condition>)patient.getConditions();
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + patient.getBirthdate());
			for(Condition condition : conditions) {
				System.out.println("***************************************************" + condition.getDescription());
			}
			BSONObject outDoc = (DBObject)JSON.parse(mapper.writeValueAsString(patient));
			BSONWritable pKeyOut = new BSONWritable(outDoc);
			context.write(recordNo, pKeyOut);
		}
	}
}
