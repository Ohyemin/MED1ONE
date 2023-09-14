package kr.or.ddit.employee.admin.service;

import java.util.List;

import kr.or.ddit.File.vo.AtchFileDtlVO;
import kr.or.ddit.employee.vo.AuthorizationReqVO;
import kr.or.ddit.employee.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.PaginationInfo;

public interface AdminService {
	public List<AuthorizationReqVO> retrieveAuthComList(String aprvYn); // 반려 목록 조회(status : D)
	public List<AuthorizationReqVO> retrieveAuthAprvList(String aprvYn); // 승인 대기 목록 조회(status : N)
	
	public boolean modifyAuthReq(AuthorizationReqVO authReq); //승인신청 승인
	public boolean modifyEmpAprv(EmployeeVO empAprv); //직원 승인여부 상태 변경
	public boolean modifiyRetrun(AuthorizationReqVO authReq); //승인신청 반려
	public boolean removeReq(String reqCode);
	
	
	/**
	 * 사용자 승인 신청 insert
	 * @param auth
	 * @return
	 */
	public boolean createAuth(AuthorizationReqVO auth);
	/**
	 * 부서리스트 출력
	 * @return
	 */
	public List<DepartmentVO> retrieveDepartmentList();
	
	public boolean checkDuplicateEmpNo(String empNo);
	
	/**
	 * 첨부파일 조회
	 * @param reqCode
	 * @return
	 */
	public AtchFileDtlVO retrieveatchSearch(String reqCode);
}
