package kr.or.ddit.medical.clinc.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.employee.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 입원오더 VO
 * @author PC-10
 *
 */
@Data
@EqualsAndHashCode(of = "hspodCode")
public class HsptlzOrderVO {
	@NotBlank
	private String hspodCode;	//입원오더코드 (시퀀스)
	@NotNull
	@Min(1)
	private int hspodTotal;		//재원날짜
	@NotBlank
	private String presCode;	//처방오더코드
	private String recCode;		//접수코드
	private String diet;		//식이
	
	private PrescriptionVO pres; //처방오더 1:1
	private CommonCodeVO comm;
}
