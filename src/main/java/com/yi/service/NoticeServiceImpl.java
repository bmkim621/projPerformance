package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Criteria;
import com.yi.domain.MemberVO;
import com.yi.domain.NoticeVO;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public List<NoticeVO> noticeListAll() {
		// TODO Auto-generated method stub
		return noticeDao.noticeListAll();
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.listCriteria(cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return noticeDao.totalCount();
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.listSearch(cri);
	}

	@Override
	public int searchTotalCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return noticeDao.searchTotalCount(cri);
	}

	@Override
	public List<NoticeVO> listWithIsNotice() {
		// TODO Auto-generated method stub
		return noticeDao.listWithIsNotice();
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED)	//읽기만 가능.
	public NoticeVO read(int no) {
		// TODO Auto-generated method stub
		NoticeVO vo = noticeDao.read(no);
		vo.setFiles(noticeDao.getAttach(no));
		
		return noticeDao.read(no);
	}

	@Override
	public void increaseViewCnt(int no) {
		// TODO Auto-generated method stub
		noticeDao.increaseViewCnt(no);
	}

	
	@Override
	@Transactional //서로 다른 테이블 (notice 테이블과 notice_attach 테이블에 같은 커넥션을 사용하기 위해 사용)
	public void register(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDao.register(vo);
		
		//첨부파일
		List<String> files = vo.getFiles();	//String배열
		if(files == null || files.size() == 0) {	//파일을 올리지 않는 경우
			return;
		}
		//첨부파일이 존재하는 경우
		for(String fullname : files) {
			noticeDao.addAttach(fullname);
		}
	}

	@Override
	public List<MemberVO> getWriter(String id) {
		// TODO Auto-generated method stub
		return noticeDao.getWriter(id);
	}

	@Override
	public void modify(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDao.update(vo);
	}

	//삭제하고 싶은 파일이 담겨져 있다.
	@Override
	public void modifyFiles(NoticeVO vo, String[] delFiles, List<String> addImages) {
		// TODO Auto-generated method stub
		
		//삭제하고 싶은 파일이 있을 경우
		if(delFiles != null) {
			for(String file : delFiles) {
				noticeDao.deleteAttachByFullName(vo.getNoticeNo(), file);
			}
		}
		
		//수정할 때 새로운 파일 등록하고 싶을 때
		for(String file : addImages) {
			noticeDao.addAttachByNo(file, vo.getNoticeNo());
		}
		
		//수정한다
		noticeDao.update(vo);
	}

	@Override
	public void remove(int no) {
		// TODO Auto-generated method stub
		//getAttach 이용해서 notice_no에 해당하는 파일명 받아오기
		List<String> list = noticeDao.getAttach(no);
		//attach 테이블에 있는 거 삭제한 다음에 게시물 삭제하기
		noticeDao.delAttach(no);
		noticeDao.delete(no);
	}

}
