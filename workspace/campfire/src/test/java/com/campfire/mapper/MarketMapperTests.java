package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MarketMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MarketBoardMapper mapper;
	
	/*@Test
	public void testList() {
		Criteria cri = new Criteria(1, 10);
		mapper.selectBoardList(cri).forEach(log::info);
	}*/
	
	@Test
	public void testInsert() {
		MarketBoardVO vo = new MarketBoardVO();
		vo.setBno(45L);
		vo.setTitle("마켓테스트 제목");
		vo.setContent("마켓테스트 내용");
		vo.setWriter("test1");
		mapper.insertBoard(vo);
	}
}