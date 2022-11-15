package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    // 회원가입 처리
    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    // 이메일 중복 체크
    public String emailDuplicateCheck(String memberEmail) {
        return sql.selectOne("Member.checkEmail", memberEmail);
    }

    // 로그인 처리
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    // 로그인 (이메일, 비밀번호)
    public MemberDTO login(String memberEmail, String memberPassword) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberEmail(memberEmail);
        memberDTO.setMemberPassword(memberPassword);
        return sql.selectOne("Member.login", memberDTO);
    }

    // 회원 목록 (관리자 페이지)
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    // 회원 삭제 (관리자 페이지)
    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public MemberDTO myPageForm(String memberEmail) {
        return sql.selectOne("Member.myPageForm", memberEmail);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.myPage", memberDTO);
    }
}
