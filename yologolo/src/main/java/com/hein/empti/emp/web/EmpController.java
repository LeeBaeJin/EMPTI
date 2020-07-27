package com.hein.empti.emp.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.dept.DeptVO;
import com.hein.empti.dept.service.DeptService;
import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.FileRenamePolicy;
import com.hein.empti.emp.service.EmpService;

@Controller //Bean등록, Dispatcher Servlet이 인식할 수 있는 Controller로 변환 //@Component 상속
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	@Autowired
	DeptService deptService;
	
	//report
	@Autowired
	@Qualifier("dataSourceSpied") 
	DataSource datasource; 	
	
	//단건조회
	@RequestMapping("/getEmpList/{emp_id}")
	public String getEmp(@PathVariable String emp_id) {
		return "admin/emp/empList";
	}
	
	//사원상세정보
	@RequestMapping(value = "/empDetail", method=RequestMethod.POST) 
	@ResponseBody
	public EmpVO empDetail(EmpVO empVO, Model model) {
		return empService.getEmp(empVO);
	}
	
	//전체조회
	@RequestMapping("/getEmpList")
	public String getEmpList(EmpVO empVO, Model model) {
		model.addAttribute( "empList",empService.getEmpList(empVO));
		return "admin/emp/empList";
	}
	
	//등록폼
	@RequestMapping("setInsertFormEmp")
	public String setInsertFormEmp(EmpVO empVO, Model model, DeptVO deptVO) {
		model.addAttribute("dept", deptService.getDeptList(deptVO));
		return "admin/emp/insertEmp";
	}
	
	//등록처리
	@RequestMapping("/setInsertEmp")
	public String setInsertEmp(EmpVO empVO,Model model) throws IOException {
		MultipartFile file = empVO.getUploadFile();
		String filename = file.getOriginalFilename();
		if (file != null && file.getSize() > 0) {
			File upFile = FileRenamePolicy.rename(new File("D:/upload",filename));
			filename = upFile.getName();
			file.transferTo(upFile);
			}
		empVO.setProfile(filename);
		empService.setInsertEmp(empVO);
		return "redirect:getEmpList";
	}
	
	//수정폼
	@RequestMapping("/setUpdateFormEmp")
	public String setUpdateFormEmp(EmpVO empVO, Model model) {
		model.addAttribute("empUp", empService.getEmp(empVO));
		return "admin/emp/updateEmp";
	}
	
	
	//수정처리
	@RequestMapping("/setUpdateEmp")
	public String setUpdateEmp(EmpVO empVO, Model model) throws IOException {
		MultipartFile file = empVO.getUploadFile();
		String filename = file.getOriginalFilename();
		if (file != null && file.getSize() > 0) {
			File upFile = FileRenamePolicy.rename(new File("D:/upload",filename));
			filename = upFile.getName();
			file.transferTo(upFile);
			}
		empVO.setProfile(filename);
		empService.setUpdateEmp(empVO);
		return "redirect:getEmpList";
	}
	
	//삭제처리
	@RequestMapping("/setDeleteEmp")
	public String setDeleteEmp(EmpVO empvo, Model model) {
		empService.setDeleteEmp(empvo);
		return "redirect:getEmpList";
	}
	
	//다운로드
	@RequestMapping("/download")
	public ModelAndView download(@RequestParam String name) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("download");
		mv.addObject("downloadFile", new File("D:/upload", name));
		return mv;
	}
	
	//view resolver 방식
	@RequestMapping("employees_list.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/employees_list.jrxml");
	return mv;
	}
	
	//차트데이터
	@RequestMapping("getChartData")
	public @ResponseBody List<Map<String,Object>> getDeptEmpCnt(){
	return empService.getDeptEmpCnt(); 
		}
}