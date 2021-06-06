package com.campfire.domain;

import java.util.List;

import com.campfire.domain.freeBoard.FreeBoardReplyVO;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private int total;
	private boolean prev, next;
	private Criteria cri;
	private List<ReviewReplyVO> reviewReplyList;
	private List<FreeBoardReplyVO> freeBoardReplyList;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (cri.getAmount() * 1.0))) * cri.getAmount();
		this.startPage = endPage - cri.getAmount() + 1;
		
		this.realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
	public PageDTO(Criteria cri, int total, List<ReviewReplyVO> reviewReplyList) {
		this(cri, total);
		this.reviewReplyList = reviewReplyList;
	}
	
	public PageDTO(Criteria cri, List<FreeBoardReplyVO> freeBoardReplyList ,int total) {
		this(cri, total);
		this.freeBoardReplyList = freeBoardReplyList;
	}
}
