package com.patient;

import java.util.List;

import javax.annotation.Generated;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"codes", "free_text", "incisionTime", "mood_code", "negationInd", "negationReason", "ordinality", "performer_id",
						"reason", "site", "source", "specifics", "status_code", "time", "_type" })
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"description",
"start_time",
"end_time",
"oid",
"values"
})
public class Procedures {
	
@JsonProperty("description")
private String description;

@JsonProperty("start_time")
private Integer start_time;

@JsonProperty("end_time")
private Integer end_time;

@JsonProperty("oid")
private String oid;

@JsonProperty("values")
private List<Values> values;

@JsonProperty("description")
public String getDescription() {
	return description;
}

@JsonProperty("description")
public void setDescription(String description) {
	this.description = description;
}

@JsonProperty("start_time")
public Integer getStart_time() {
	return start_time;
}

@JsonProperty("start_time")
public void setStart_time(Integer start_time) {
	this.start_time = start_time;
}

@JsonProperty("end_time")
public Integer getEnd_date() {
	return end_time;
}

@JsonProperty("end_time")
public void setEnd_date(Integer end_date) {
	this.end_time = end_date;
}

@JsonProperty("oid")
public String getOid() {
	return oid;
}

@JsonProperty("oid")
public void setOid(String oid) {
	this.oid = oid;
}

@JsonProperty("values")
public List<Values> getValues() {
	return values;
}

@JsonProperty("values")
public void setValues(List<Values> values) {
	this.values = values;
}

}
