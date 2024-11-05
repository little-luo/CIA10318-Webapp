package com.stud.model;

import java.util.List;

public class StudService {
	private StudDAO_interface dao;
	
	public StudService() {
		dao = new StudJDBCDAO();
	}
	
	public StudVO addStud(Integer studID,String studLoc,String studName,Integer capacity,Double hourlyRate,String equipment){
		StudVO studVO = new StudVO();
		studVO.setStudID(studID);
		studVO.setStudLoc(studLoc);
		studVO.setStudName(studName);
		studVO.setCapacity(capacity);
		studVO.setHourlyRate(hourlyRate);
		studVO.setEquipment(equipment);
		
		dao.insert(studVO);
		
		return studVO;
	}
	
	public StudVO updateStud(Integer studID,String studLoc,String studName,Integer capacity,Double hourlyRate,String equipment) {
		StudVO studVO = new StudVO();
		studVO.setStudID(studID);
		studVO.setStudLoc(studLoc);
		studVO.setStudName(studName);
		studVO.setCapacity(capacity);
		studVO.setHourlyRate(hourlyRate);
		studVO.setEquipment(equipment);
		dao.update(studVO);
		
		return studVO;
	}
	
	public void deleteStud(Integer studID) {
		dao.delete(studID);
	}
	
	public StudVO getOneStud(Integer studID) {
		return dao.findByPrimaryKey(studID);
	}
	
	public List<StudVO> getAll(){
		return dao.getAll();
	}
}
