package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;

@Controller
@RequestMapping("/admin/")
public class TreeController {

	@Inject
	private EmployeeService service;
	
	@GetMapping("treeList.do")
	public String treeList(Model model) {
		List<DepartmentVO> deptList = service.retrieveDept();
		model.addAttribute( "deptList" ,deptList);
		
		return "medi/tree";
	}
	

	
	@RequestMapping("/treeDept.do")
	@ResponseBody
	
	
	
	public String EmpTreeList(@RequestParam("code") String deptCode) {
	    List<EmployeeVO> empList = service.retrieveDeptTreeList(deptCode);

	    try {
	        // ObjectMapper를 사용하여 List<EmployeeVO>를 JSON 형식으로 변환
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonData = objectMapper.writeValueAsString(empList);
	        return jsonData;
	    } catch (Exception e) {
	        // JSON 변환 중 에러가 발생한 경우 에러 처리
	        e.printStackTrace();
	        return null;
	    }
	}
}

