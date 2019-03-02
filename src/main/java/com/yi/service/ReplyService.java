package com.yi.service;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.ReplyVO;

public interface ReplyService {
	//게시물에 해당하는 댓글 리스트를 모두 보여야 함.
	public List<ReplyVO> list(int reviewNo);	
	
	public void create(ReplyVO vo);
	
	public void update(ReplyVO vo);
	
	public void delete(int replyNo);	//해당 댓글을 삭제한다.
	
	public List<ReplyVO> listPage(Criteria cri, int reviewNo);
	
	public int totalCount(int reviewNo);
}
