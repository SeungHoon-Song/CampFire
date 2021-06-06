package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ReviewBoardMapper mapper;
	
//	@Test
//	public void viewTests() {
//		mapper.updateReadCnt(404l);
//		
//		mapper.selectBoard(404l);
//	}
	
//	@Test
//	public void testList() {
//		Criteria c = new Criteria(1, 10);
//		mapper.selectBoardList(c).forEach(log::info);
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria c = new Criteria(1, 10);
//		log.info(mapper.getTotal(c));
//	}
	
//	@Test
//	public void testUpdate() {
//		FreeBoardVO vo = mapper.read(22L);
//		vo.setTitle("멈춰!");
//		vo.setContent("가던길 멈춰!");
//		mapper.update(vo);
//	}
	
//	@Test
//	public void testInsert() {
//		ReviewBoardVO vo = new ReviewBoardVO();
////		vo.setBno(29L);
//		vo.setTitle("테스트2");
//		vo.setContent("테스내용2");
//		vo.setWriter("test1");
//		mapper.insertBoard(vo);
//	}
	

//	@Test
//	public void testDelete() {
//		log.info("CNT : "+mapper.delete(31L));
//	}
	
//	@Test
//	public void testReplyPlus() {
//		mapper.updateReplyCnt(30L, 1);
//	}
	
//	@Test
//	public void testInsertLike() {
//		log.info(mapper.insertLike(405L, "rhkd1769"));
//	}
	
//	@Test
//	public void testLikeCount() {
//		log.info(mapper.checkLike(405L, "rhkd1769"));
//	}
	
//	@Test
//	public void testDeleteLike() {
//		log.info(mapper.deleteLike(405L, "rhkd1769"));
//	}
	
//	@Test
//	public void testMinusLikeCnt() {
//		log.info(mapper.minusLikeCnt(405L));
//	}
	@Test
	public void testPlusLikeCnt() {
		log.info(mapper.plusLikeCnt(405L));
	}
	
}
