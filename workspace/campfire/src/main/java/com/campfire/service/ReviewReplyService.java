package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.ReviewReplyVO;

public interface ReviewReplyService {
	public boolean register(ReviewReplyVO reply);
	public ReviewReplyVO view(Long rno);
	public boolean modify(ReviewReplyVO reply);
	public boolean remove(Long rno);
	public PageDTO getList(Criteria cri, Long bno);
}
