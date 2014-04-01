package com.patient;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
@JsonIgnoreProperties(ignoreUnknown = true)
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"id",
"start_date",
"end_date",
"value",
"negation",
"negation_code_list_id",
"field_values",
"oid",
"definition",
"status"
})
public class Source_data_criterium {

@JsonProperty("id")
private String id;
@JsonProperty("start_date")
private Long start_date;
@JsonProperty("end_date")
private Long end_date;
@JsonProperty("value")
private List<Value> value = new ArrayList<Value>();
@JsonProperty("negation")
private String negation;
@JsonProperty("negation_code_list_id")
private Object negation_code_list_id;
@JsonProperty("field_values")
private Field_values field_values;
@JsonProperty("oid")
private String oid;
@JsonProperty("definition")
private String definition;
@JsonProperty("status")
private Object status;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("id")
public String getId() {
return id;
}

@JsonProperty("id")
public void setId(String id) {
this.id = id;
}

@JsonProperty("start_date")
public Long getStart_date() {
return start_date;
}

@JsonProperty("start_date")
public void setStart_date(Long start_date) {
this.start_date = start_date;
}

@JsonProperty("end_date")
public Long getEnd_date() {
return end_date;
}

@JsonProperty("end_date")
public void setEnd_date(Long end_date) {
this.end_date = end_date;
}

@JsonProperty("value")
public List<Value> getValue() {
return value;
}

@JsonProperty("value")
public void setValue(List<Value> value) {
this.value = value;
}

@JsonProperty("negation")
public String getNegation() {
return negation;
}

@JsonProperty("negation")
public void setNegation(String negation) {
this.negation = negation;
}

@JsonProperty("negation_code_list_id")
public Object getNegation_code_list_id() {
return negation_code_list_id;
}

@JsonProperty("negation_code_list_id")
public void setNegation_code_list_id(Object negation_code_list_id) {
this.negation_code_list_id = negation_code_list_id;
}

@JsonProperty("field_values")
public Field_values getField_values() {
return field_values;
}

@JsonProperty("field_values")
public void setField_values(Field_values field_values) {
this.field_values = field_values;
}

@JsonProperty("oid")
public String getOid() {
return oid;
}

@JsonProperty("oid")
public void setOid(String oid) {
this.oid = oid;
}

@JsonProperty("definition")
public String getDefinition() {
return definition;
}

@JsonProperty("definition")
public void setDefinition(String definition) {
this.definition = definition;
}

@JsonProperty("status")
public Object getStatus() {
return status;
}

@JsonProperty("status")
public void setStatus(Object status) {
this.status = status;
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