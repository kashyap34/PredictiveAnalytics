package com.patient;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.util.ToolRunner;

import com.mongodb.hadoop.MongoConfig;
import com.mongodb.hadoop.MongoInputFormat;
import com.mongodb.hadoop.MongoOutputFormat;
import com.mongodb.hadoop.io.BSONWritable;
import com.mongodb.hadoop.util.MongoTool;

public class PatientEHR extends MongoTool {
	
	public PatientEHR() {
		Configuration conf = new Configuration();
		MongoConfig config = new MongoConfig(conf);
		setConf(conf);
		
		config.setInputFormat(MongoInputFormat.class);
		config.setInputURI("mongodb://localhost:27017/Patient.Diabetes");
		config.setMapper(PatientEHRMapper.class);
		config.setReducer(PatientEHRReducer.class);
		config.setMapperOutputKey(Text.class);
		config.setMapperOutputValue(Patient.class);
		config.setOutputKey(Text.class);
		config.setOutputValue(BSONWritable.class);
		config.setOutputURI("mongodb://localhost:27017/Patient.Diabetes_Snapshot");
		config.setOutputFormat(MongoOutputFormat.class);
		
	}
	
	public static void main(String[] args) throws Exception {
		System.exit(ToolRunner.run(new PatientEHR(), args));
	}

}
