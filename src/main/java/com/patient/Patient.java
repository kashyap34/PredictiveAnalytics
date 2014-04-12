package com.patient;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Generated;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
//import org.apache.hadoop.io.WritableComparable;


import com.beans.PatientOccupation;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.databind.ObjectMapper;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("org.jsonschema2pojo")
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonPropertyOrder({
"_id",
"birthdate",
"name",
"conditions",
"encounters",
"ethnicity",
"first",
"gender",
"last",
"measure_ids",
"measure_period_end",
"measure_period_start",
"medical_record_number",
"procedures",
"race",
"results",
"source_data_criteria",
"type",
"vital_signs",
"family_history",
"occupation"
})
public class Patient implements /*WritableComparable,*/ Serializable {
	
	private ObjectMapper mapper = new ObjectMapper();

@JsonProperty("_id")
private com.patient._id _id;
@JsonProperty("birthdate")
private Long birthdate;
@JsonProperty("name")
private String name;
@JsonProperty("conditions")
private List<Condition> conditions = new ArrayList<Condition>();
@JsonProperty("encounters")
private List<Encounter> encounters = new ArrayList<Encounter>();
@JsonProperty("ethnicity")
private Ethnicity ethnicity;
@JsonProperty("first")
private String first;
@JsonProperty("gender")
private String gender;
@JsonProperty("last")
private String last;
@JsonProperty("measure_ids")
private List<String> measure_ids = new ArrayList<String>();
@JsonProperty("measure_period_end")
private Long measure_period_end;
@JsonProperty("measure_period_start")
private Long measure_period_start;
@JsonProperty("medical_record_number")
private String medical_record_number;
@JsonProperty("procedures")
private List<Procedures> procedures;
@JsonProperty("race")
private Race race;
@JsonProperty("results")
private List<Object> results = new ArrayList<Object>();
@JsonProperty("source_data_criteria")
private List<Source_data_criterium> source_data_criteria = new ArrayList<Source_data_criterium>();
@JsonProperty("type")
private String type;
@JsonProperty("vital_signs")
private List<Vital_sign> vital_signs = new ArrayList<Vital_sign>();
@JsonProperty("family_history")
private List<String> family_history = new ArrayList<String>();
@JsonProperty("occupation")
private PatientOccupation occupation = new PatientOccupation();

private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("_id")
public com.patient._id get_id() {
return _id;
}

@JsonProperty("_id")
public void set_id(com.patient._id _id) {
this._id = _id;
}

@JsonProperty("birthdate")
public Long getBirthdate() {
return birthdate;
}

@JsonProperty("birthdate")
public void setBirthdate(Long birthdate) {
this.birthdate = birthdate;
}

@JsonProperty("name")
public String getName() {
	return name;
}

@JsonProperty("name")
public void setName(String name) {
	this.name = name;
}

@JsonProperty("conditions")
public List<Condition> getConditions() {
return conditions;
}

@JsonProperty("conditions")
public void setConditions(List<Condition> conditions) {
this.conditions = conditions;
}

@JsonProperty("encounters")
public List<Encounter> getEncounters() {
return encounters;
}

@JsonProperty("encounters")
public void setEncounters(List<Encounter> encounters) {
this.encounters = encounters;
}

@JsonProperty("ethnicity")
public Ethnicity getEthnicity() {
return ethnicity;
}

@JsonProperty("ethnicity")
public void setEthnicity(Ethnicity ethnicity) {
this.ethnicity = ethnicity;
}

@JsonProperty("first")
public String getFirst() {
return first;
}

@JsonProperty("first")
public void setFirst(String first) {
this.first = first;
}

@JsonProperty("gender")
public String getGender() {
return gender;
}

@JsonProperty("gender")
public void setGender(String gender) {
this.gender = gender;
}

@JsonProperty("last")
public String getLast() {
return last;
}

@JsonProperty("last")
public void setLast(String last) {
this.last = last;
}

@JsonProperty("measure_ids")
public List<String> getMeasure_ids() {
return measure_ids;
}

@JsonProperty("measure_ids")
public void setMeasure_ids(List<String> measure_ids) {
this.measure_ids = measure_ids;
}

@JsonProperty("measure_period_end")
public Long getMeasure_period_end() {
return measure_period_end;
}

@JsonProperty("measure_period_end")
public void setMeasure_period_end(Long measure_period_end) {
this.measure_period_end = measure_period_end;
}

@JsonProperty("measure_period_start")
public Long getMeasure_period_start() {
return measure_period_start;
}

@JsonProperty("measure_period_start")
public void setMeasure_period_start(Long measure_period_start) {
this.measure_period_start = measure_period_start;
}

@JsonProperty("medical_record_number")
public String getMedical_record_number() {
return medical_record_number;
}

@JsonProperty("medical_record_number")
public void setMedical_record_number(String medical_record_number) {
this.medical_record_number = medical_record_number;
}

@JsonProperty("procedures")
public List<Procedures> getProcedures() {
	return procedures;
}

@JsonProperty("procedures")
public void setProcedures(List<Procedures> procedures) {
	this.procedures = procedures;
}

@JsonProperty("race")
public Race getRace() {
return race;
}

@JsonProperty("race")
public void setRace(Race race) {
this.race = race;
}

@JsonProperty("results")
public List<Object> getResults() {
return results;
}

@JsonProperty("results")
public void setResults(List<Object> results) {
this.results = results;
}

@JsonProperty("source_data_criteria")
public List<Source_data_criterium> getSource_data_criteria() {
return source_data_criteria;
}

@JsonProperty("source_data_criteria")
public void setSource_data_criteria(List<Source_data_criterium> source_data_criteria) {
this.source_data_criteria = source_data_criteria;
}

@JsonProperty("type")
public String getType() {
return type;
}

@JsonProperty("type")
public void setType(String type) {
this.type = type;
}

@JsonProperty("vital_signs")
public List<Vital_sign> getVital_signs() {
return vital_signs;
}

@JsonProperty("vital_signs")
public void setVital_signs(List<Vital_sign> vital_signs) {
this.vital_signs = vital_signs;
}

@JsonProperty("family_history")
public List<String> getFamily_history() {
	return family_history;
}

@JsonProperty("family_history")
public void setFamily_history(List<String> family_history) {
	this.family_history = family_history;
}

@JsonProperty("occupation")
public PatientOccupation getOccupation() {
	return occupation;
}

@JsonProperty("occupation")
private void setOccupation(PatientOccupation occupation) {
	this.occupation = occupation;
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


public void readFields(DataInput in) throws IOException {
	// TODO Auto-generated method stub
	this._id = mapper.readValue(in.readUTF(), _id.class);
	this.birthdate = in.readLong();
	this.conditions = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, Condition.class));
	this.encounters = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, Encounter.class));
	this.ethnicity = mapper.readValue(in.readUTF(), Ethnicity.class);
	this.first = in.readUTF();
	this.gender = in.readUTF();
	this.last = in.readUTF();
	this.measure_ids = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, String.class));
	this.measure_period_end = in.readLong();
	this.measure_period_start = in.readLong();
	this.medical_record_number = in.readUTF();
	this.race = mapper.readValue(in.readUTF(), Race.class);
	this.results = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, Object.class));
	this.source_data_criteria = mapper.readValue(in.readUTF(), mapper.getTypeFactory().
								constructCollectionType(List.class, Source_data_criterium.class));
	this.type = in.readUTF();
	this.vital_signs = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, Vital_sign.class));
	this.family_history = mapper.readValue(in.readUTF(), mapper.getTypeFactory().constructCollectionType(List.class, String.class));
	this.occupation = mapper.readValue(in.readUTF(), PatientOccupation.class);
}

public void write(DataOutput out) throws IOException {
	// TODO Auto-generated method stub
	out.writeUTF(mapper.writeValueAsString(this._id));
	out.writeLong(this.birthdate);
	out.writeUTF(mapper.writeValueAsString(this.conditions));
	out.writeUTF(mapper.writeValueAsString(this.encounters));
	out.writeUTF(mapper.writeValueAsString(this.ethnicity));
	out.writeUTF(this.first);
	out.writeUTF(this.gender);
	out.writeUTF(this.last);;
	out.writeUTF(mapper.writeValueAsString(this.measure_ids));
	out.writeLong(this.measure_period_end);
	out.writeLong(this.measure_period_start);
	out.writeUTF(this.medical_record_number);
	out.writeUTF(mapper.writeValueAsString(this.race));
	out.writeUTF(mapper.writeValueAsString(this.results));
	out.writeUTF(mapper.writeValueAsString(this.source_data_criteria));
	out.writeUTF(this.type);
	out.writeUTF(mapper.writeValueAsString(this.vital_signs));
	out.writeUTF(mapper.writeValueAsString(this.family_history));
	out.writeUTF(mapper.writeValueAsString(this.occupation));
}

public int compareTo(Object o) {
	if (!(o instanceof Patient)) {
        return -1;
    }
    Patient mp = (Patient) o;
    int first = getMedical_record_number().compareTo(mp.getMedical_record_number());
    if (first != 0) {
        return first;
    }
    return 0;
}

}