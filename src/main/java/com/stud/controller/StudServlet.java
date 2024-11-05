package com.stud.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stud.model.StudService;
import com.stud.model.StudVO;

public class StudServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		System.out.println(action); //getOne_For_Display
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
//			錯誤處理
			String str = req.getParameter("studID");
			if(str.trim().equals("")) {
				errorMsgs.add("請輸入錄音室編號");
			}
//			轉發請求
			if(!errorMsgs.isEmpty()) {
				String url = "/back-end/emp/select_page.jsp";
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failedView = req.getRequestDispatcher(url);
				failedView.forward(req, res);
				return;
			}
			Integer studID = null;
			try {				
				studID = Integer.valueOf(req.getParameter("studID"));
			}catch(Exception e) {
				errorMsgs.add("錄音室編號格式錯誤");
			}
//			轉發請求
			if(!errorMsgs.isEmpty()) {
				String url = "/back-end/emp/select_page.jsp";
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failedView = req.getRequestDispatcher(url);
				failedView.forward(req, res);
				return;
			}
//			查詢資料
			StudVO studVO = null;
			if(errorMsgs.isEmpty()) {				
				StudService studService = new StudService();
				studVO = studService.getOneStud(studID);
				if(studVO == null) {
					errorMsgs.add("錄音室不存在");
				}
//				轉發請求
				if(!errorMsgs.isEmpty()) {
					String url = "/back-end/emp/select_page.jsp";
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failedView = req.getRequestDispatcher(url);
					failedView.forward(req, res);
					return;
				}
//				轉發請求
				req.setAttribute("studVO", studVO);
				String url = "/back-end/emp/listOneStud.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			String studID = req.getParameter("studID");
			StudVO studVO;
			StudService studService = new StudService();
			studVO = studService.getOneStud(Integer.valueOf(studID));
			req.setAttribute("studVO", studVO);
			String url = "/back-end/emp/update_stud_input.jsp";
			RequestDispatcher update_stud_input = req.getRequestDispatcher(url);
			update_stud_input.forward(req, res);
		}
		
		if("update".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			Integer studID = Integer.valueOf(req.getParameter("studID"));
			String studLoc = req.getParameter("studLoc");
			if(studLoc.trim().isEmpty()) {
				errorMsgs.add("請輸入錄音室地點");
			}
			String studName = req.getParameter("studName");
			if(studName.trim().isEmpty()) {
				errorMsgs.add("請輸入錄音室名稱");
			}
			Integer capacity = null;
			try {				
				capacity = Integer.valueOf(req.getParameter("capacity"));
			}catch(Exception e) {
				capacity = 1;
				errorMsgs.add("錄音室收容人數格式錯誤");
			}
			Double hourlyRate = null;
			try {				
				hourlyRate = Double.valueOf(req.getParameter("hourlyRate"));
				if(hourlyRate <= 0) {
					hourlyRate = 0.0;
					errorMsgs.add("錄音室租金應大於0");
				}
			}catch(Exception e) {
				hourlyRate = 0.0;
				errorMsgs.add("錄音室租金格式錯誤");
			}
			String equipment = req.getParameter("equipment");
			StudVO studVO = null;
			if(errorMsgs.isEmpty()) {				
				StudService studService = new StudService();
				studVO = studService.updateStud(studID, studLoc, studName, capacity, hourlyRate, equipment);
				String url = "/back-end/emp/listAllStud.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}else {
				studVO = new StudVO();
				studVO.setStudID(studID);
				String url = "/back-end/emp/update_stud_input.jsp";
				req.setAttribute("errorMsgs", errorMsgs);
				req.setAttribute("studVO", studVO);
				RequestDispatcher failedView = req.getRequestDispatcher(url);
				failedView.forward(req, res);
			}

		}
		if("delete".equals(action)) {
			Integer studID = Integer.valueOf(req.getParameter("studID"));
			StudService studService = new StudService();
			studService.deleteStud(studID);
			String url = "/back-end/emp/listAllStud.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if("insert".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			String studLoc = req.getParameter("studLoc");
			if(studLoc.trim().isEmpty()) {
				studLoc = "???市";
				errorMsgs.add("請輸入錄音室地點");
			}
			String studName = req.getParameter("studName");
			if(studName.trim().isEmpty()) {
				studName = "錄音室???";
				errorMsgs.add("請輸入錄音室名稱");
			}
			Integer capacity = null;
			try {				
				capacity = Integer.valueOf(req.getParameter("capacity"));
			}catch(Exception e) {
				capacity = 1;
				errorMsgs.add("錄音室收容人數格式錯誤");
			}
			
			Double hourlyRate = null;
			try {				
				hourlyRate = Double.valueOf(req.getParameter("hourlyRate"));
				if(hourlyRate <= 0) {
					hourlyRate = 0.0;
					errorMsgs.add("錄音室租金應大於0");
				}
			}catch(Exception e) {
				hourlyRate = 0.0;
				errorMsgs.add("錄音室租金格式錯誤");
			}
			String equipment = req.getParameter("equipment");
			StudVO studVO = new StudVO();
			studVO.setStudLoc(studLoc);
			studVO.setStudName(studName);
			studVO.setHourlyRate(hourlyRate);
			studVO.setEquipment(equipment);
			studVO.setCapacity(capacity);
			if(errorMsgs.isEmpty()) {				
//				轉發請求
				StudService studService = new StudService();
				studService.addStud(null, studLoc, studName, capacity, hourlyRate, equipment);
				String url = "/back-end/emp/listAllStud.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}else {
//				專發請求
				String url = "/back-end/emp/addStud.jsp";
				req.setAttribute("studVO", studVO);
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failedView = req.getRequestDispatcher(url);
				failedView.forward(req, res);
			}
		}
	}
}
