package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.ReplyVO;
import com.yi.persistence.ReplyDAO;
import com.yi.persistence.ReviewDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO dao;
	
	//댓글 수 증가
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public List<ReplyVO> list(int reviewNo) {
		// TODO Auto-generated method stub
		return dao.list(reviewNo);
	}

	@Override
	public void create(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.create(vo);
		//댓글 추가할 때 글 제목 옆에 댓글 수도 같이 올라가도록 한다. 댓글 1개 작성할 때 1증가하므로 amount = 1
		reviewDao.updateReplyCnt(vo.getReviewNo(), 1);

	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int replyNo) {
		// TODO Auto-generated method stub
		//reply_no를 이용하여 review_no 값을 가져온다.
		ReplyVO vo = dao.selectByReviewNo(replyNo);
		//reply_no를 이용하여 review_no 가지고 온 다음에 삭제가 이루어져야 함. 삭제 먼저 일어나면 삭제된 review_no를 가지고 올 수 없기 때문!
		dao.delete(replyNo);
		//댓글 삭제할 때 글 제목 옆에 댓글 수도 같이 감소시킨다. 댓글 1개 작성할 때 1 감소하므로 amount = -1
		reviewDao.updateReplyCnt(vo.getReviewNo(), -1);
	}

	@Override
	public List<ReplyVO> listPage(Criteria cri, int reviewNo) {
		// TODO Auto-generated method stub
		return dao.listPage(cri, reviewNo);
	}

	@Override
	public int totalCount(int reviewNo) {
		// TODO Auto-generated method stub
		return dao.totalCount(reviewNo);
	}

}
