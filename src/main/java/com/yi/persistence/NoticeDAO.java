package com.yi.persistence;

import java.util.List;

import com.yi.domain.ManagerVO;
import com.yi.domain.NoticeVO;

public interface NoticeDAO {

	//리스트 보기
	public List<NoticeVO> noticeListAll();
	
	//직원 코드로 검색
	public ManagerVO selectManagerByCode(String managerCode);
}
