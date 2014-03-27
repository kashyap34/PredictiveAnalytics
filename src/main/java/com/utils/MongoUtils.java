package com.utils;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import com.mongodb.util.JSON;;

public class MongoUtils {
	private final static Logger logger = LoggerFactory.getLogger(MongoUtils.class);
	private String fileName;
	
	public MongoUtils(String fileName) {
		this.fileName = fileName;
	}
	
	public String parseJSON() {
		try{
			String json = FileUtils.readFileToString(new File(fileName));
			
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("Patient");
			DBCollection collection = db.getCollection("Diabetes");
			
			DBObject dbObject = (DBObject)JSON.parse(json);
			collection.insert(dbObject);
			ObjectId objectID = (ObjectId)dbObject.get("_id");
			
			if(objectID != null) {
				return objectID.toString();
			} 
			else {
				return "";
			}
			
			
		} catch(Exception e) {
			logger.error("Error in parsing the JSON schema");
			e.printStackTrace();
			return "";
		}
	}
}
