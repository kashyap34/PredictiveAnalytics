package com.patient;

import javax.annotation.Generated;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"codes", "_type", "scalar", "units" })
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"description",
})
public class Values {
	
@JsonProperty("description")
private String description;

@JsonProperty("description")
public String getDescription() {
	return description;
}

@JsonProperty("description")
public void setDescription(String description) {
	this.description = description;
}


}
