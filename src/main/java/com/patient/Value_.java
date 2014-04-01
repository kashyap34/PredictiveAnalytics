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
@JsonIgnoreProperties(ignoreUnknown = true)
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"scalar",
"units",
"_type"
})
public class Value_ {

@JsonProperty("scalar")
private String scalar;
@JsonProperty("units")
private String units;
@JsonProperty("_type")
private String _type;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("scalar")
public String getScalar() {
return scalar;
}

@JsonProperty("scalar")
public void setScalar(String scalar) {
this.scalar = scalar;
}

@JsonProperty("units")
public String getUnits() {
return units;
}

@JsonProperty("units")
public void setUnits(String units) {
this.units = units;
}

@JsonProperty("_type")
public String get_type() {
return _type;
}

@JsonProperty("_type")
public void set_type(String _type) {
this._type = _type;
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