package com.patient;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Generated;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"causeOfDeath", "codes", "end_time", "free_text", "mood_code", "negationId", "negationReason", "ordinality", 
					"priority", "reason", "severity", "specifics", "status_code", "time", "time_of_death", "type", "_type"})
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"description",
"oid",
"start_time"
})
public class Condition {

/*@JsonProperty("causeOfDeath")
private Object causeOfDeath;*/
@JsonProperty("description")
private String description;
/*@JsonProperty("name")
private String name;*/
@JsonProperty("oid")
private String oid;
@JsonProperty("start_time")
private Integer start_time;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

/*@JsonProperty("causeOfDeath")
public Object getCauseOfDeath() {
return causeOfDeath;
}*/

/*@JsonProperty("causeOfDeath")
public void setCauseOfDeath(Object causeOfDeath) {
this.causeOfDeath = causeOfDeath;
}*/

@JsonProperty("description")
public String getDescription() {
return description;
}

@JsonProperty("description")
public void setDescription(String description) {
this.description = description;
}

/*@JsonProperty("name")
public String getName() {
return name;
}

@JsonProperty("name")
public void setName(String name) {
this.name = name;
}*/

@JsonProperty("oid")
public String getOid() {
return oid;
}

@JsonProperty("oid")
public void setOid(String oid) {
this.oid = oid;
}

@JsonProperty("start_time")
public Integer getStart_time() {
return start_time;
}

@JsonProperty("start_time")
public void setStart_time(Integer start_time) {
this.start_time = start_time;
}

@Override
public String toString() {
return ToStringBuilder.reflectionToString(this);
}

@Override
public int hashCode() {
return HashCodeBuilder.reflectionHashCode(this);
}

@Override
public boolean equals(Object other) {
return EqualsBuilder.reflectionEquals(this, other);
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}