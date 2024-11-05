package com.stud.model;

import java.util.ArrayList;
import java.util.List;

public class TestStudJDBCDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StudJDBCDAO studDAO = new StudJDBCDAO();
		StudVO studvo;
		studvo = studDAO.findByPrimaryKey(1);
		 System.out.println(studvo);
		
//		StudVO studvo2 = new StudVO();
//		studvo2.setStudLoc("台南市");
//		studvo2.setStudName("錄音室5");
//		studvo2.setCapacity(8);
//		studvo2.setHourlyRate(2000.0);
//		studvo2.setEquipment("錄音設備");
////		studvo2.setStudID(6);
//		studDAO.insert(studvo2);
//		
//		studDAO.delete(4);
//		studDAO.update(studvo2);
		
//		 StudService studService = new StudService();
//		 studvo = studService.getOneStud(6);
//		 System.out.println(studvo);
		 
//		List<StudVO> studList = new ArrayList<StudVO>();
//		studList = studDAO.getAll();
//		for(StudVO stud : studList) {
//			System.out.println(stud);
//		}
	}

}
