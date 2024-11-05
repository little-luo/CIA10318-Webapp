package com.stud.model;
import java.sql.Date;

public class StudVO implements java.io.Serializable{

	private Integer studID;
	private String studLoc;
	private String studName;
	private Integer capacity;
	private Double hourlyRate;
	private String equipment;
	
	public Integer getStudID() {
		return studID;
	}
	public void setStudID(Integer studID) {
		this.studID = studID;
	}
	public String getStudLoc() {
		return studLoc;
	}
	public void setStudLoc(String studLoc) {
		this.studLoc = studLoc;
	}
	public String getStudName() {
		return studName;
	}
	public void setStudName(String studName) {
		this.studName = studName;
	}
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
	public Double getHourlyRate() {
		return hourlyRate;
	}
	public void setHourlyRate(Double hourlyRate) {
		this.hourlyRate = hourlyRate;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	@Override
	public String toString() {
		return "[" + studID + ", " + studLoc + ", " + studName + ", " + capacity + ", " + hourlyRate + ", " + equipment + "]";
	}
	
	
}
