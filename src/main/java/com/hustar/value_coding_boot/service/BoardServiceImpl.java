package com.hustar.value_coding_boot.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dao.BoardDAO;
import com.hustar.value_coding_boot.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	/*
	 * @Autowired private BoardMapper boardMapper;
	 * 
	 * @Override public boolean registerBoard(BoardDTO params) { int queryResult =
	 * 0;
	 * 
	 * if((Integer)params.getPo_num() == null) { queryResult =
	 * boardMapper.insertBoard(params); } else { queryResult =
	 * boardMapper.updateBoard(params); } return (queryResult == 1) ? true : false;
	 * }
	 * 
	 * @Override public BoardDTO getBoardDetail(int po_num) { return
	 * (BoardDTO)boardMapper.selectBoardDetail(po_num); }
	 * 
	 * @Override public boolean deleteBoard(int po_num) { int queryResult = 0;
	 * 
	 * BoardDTO board = (BoardDTO)boardMapper.selectBoardDetail(po_num);
	 * 
	 * if(board != null && "N".equals(board.getPo_deleteYn())) { queryResult =
	 * boardMapper.deleteBoard(po_num); }
	 * 
	 * return (queryResult == 1) ? true : false; }
	 * 
	 * @Override public List<Map<String, Object>> getBoardList() { List<Map<String,
	 * Object>> boardList = Collections.emptyList();
	 * 
	 * int boardTotalCount = boardMapper.selectBoardTotalCount();
	 * 
	 * if(boardTotalCount > 0) { boardList = boardMapper.selectBoardList(); }
	 * 
	 * return boardList; }
	 */
}
