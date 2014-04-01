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
@JsonIgnoreProperties({"admitTime", "admitType", "codes", "dischargeDispositon", "dischargeTime", "free_text", "mood_code", "negationInd", 
						"negationReason", "performer_id", "reason", "specifics", "status_code", "time", "transferFrom", "transferTo", "_type"})
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"description",
"end_time",
"oid",
"start_time"
})
public class Encounter {

@JsonProperty("description")
private String description;
@JsonProperty("end_time")
private Integer end_time;
@JsonProperty("oid")
private String oid;
@JsonProperty("start_time")
private Integer start_time;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("description")
public String getDescription() {
return description;
}

@JsonProperty("description")
public void setDescription(String description) {
this.description = description;
}

@JsonProperty("end_time")
public Integer getEnd_time() {
return end_time;
}

@JsonProperty("end_time")
public void setEnd_time(Integer end_time) {
this.end_time = end_time;
}

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