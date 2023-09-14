package kr.or.ddit.newfile.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "newFileId")
public class NewFileVO {

	private List<NewFileVO> fileList;
	
	private String fileTitle;//제목으로식별
	
	private String empNo; //자료담당직원사번
	private String fileCol1;
	private String fileCol2;
	private String fileCol3;
	private String fileCol4;
	private String fileCol5;
	private String fileCol6;
	private String fileCol7;
	private String fileCol8;
	private String fileCol9;
	private String fileCol10;
	private String fileCol11;
	@NotBlank
	private String newFileId;
	private String fileDate;
	private long rnum;
}
