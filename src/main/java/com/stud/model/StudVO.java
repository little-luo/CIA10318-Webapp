package com.stud.model;
import java.sql.Date;

public class StudVO implements java.io.Serializable{

	private Integer studID;    //錄音室編號
	private String studLoc;    //錄音室地點
	private String studName;   //錄音室名稱
	private Integer capacity;  //錄音室收容人數
	private Double hourlyRate; //每小時租金
	private String equipment;  //錄音室設備
	
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
