package com.stud.model;

import java.util.*;

public interface StudDAO_interface {
          public void insert(StudVO studVO);
          public void update(StudVO studVO);
          public void delete(Integer studID);
          public StudVO findByPrimaryKey(Integer studID);
          public List<StudVO> getAll();
          //萬用複合查詢(傳入參數型態Map)(回傳 List)
//        public List<EmpVO> getAll(Map<String, String[]> map); 
}
