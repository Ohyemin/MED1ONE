package kr.or.ddit.newfile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.newfile.vo.NewFileVO;

@Mapper
public interface NewFileDAO {
	
	public List<NewFileVO> selectNewFile(String fileTitle);
	public NewFileVO selectNewFileTitle(String newFileId);
	public List<NewFileVO> selectNewFileList();
	public List<NewFileVO> selectNewFileMain();
	public int insertNewFile(NewFileVO fileVO);

	public int deleteFile(String fileTitle);
	public int updateFile(NewFileVO newFile);
}
