package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    // 회원가입 처리
    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    // 이메일 중복 체크
    public String emailDuplicateCheck(String memberEmail) {
        String checkResult = memberRepository.emailDuplicateCheck(memberEmail);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }
    // 로그인 처리
    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginResult = memberRepository.login(memberDTO);
        if (loginResult != null) {
            return true;
        } else {
            return false;
        }
    }

    // 회원 목록 (관리자 페이지)
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    // 회원 삭제 (관리자 페이지)
    public void delete(Long id) {
        memberRepository.delete(id);
    }

    // 마이페이지 출력
    public MemberDTO myPageForm(String memberEmail) {
        return memberRepository.myPageForm(memberEmail);
    }

    public boolean myPage(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
}
