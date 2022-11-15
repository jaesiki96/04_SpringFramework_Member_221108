package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    // 글 작성 & 파일 첨부
    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    // 파일
    public void saveFileName(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }

    // 글 목록 출력
    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    // 페이징 목록
    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }
    // 페이징 갯수 처리
    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }

    // 조회수 증가
    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    // 상세 조회
    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    // 수정 처리
    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    // 게시글 삭제
    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    // 검색 처리
    // (Mapper 에서 컬럼 이름을 여러개 선택 할 경우 #이 아닌 $를 사용!)
    public List<BoardDTO> search(Map<String, String> searchParams) {
        return sql.selectList("Board.search", searchParams);
    }

}
