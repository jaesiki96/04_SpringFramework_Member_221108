package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    // 회원가입 페이지 출력
    @GetMapping("/save")
    public String saveForm() {
        return "memberSave";
    }

    // 회원가입 처리
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "memberLogin";
        } else {
            return "index";
        }
    }

    // 이메일 중복 체크 (memberSave.jsp)
    @PostMapping("/checkEmail")
    public @ResponseBody String emailDuplicateCheck(@RequestParam("inputEmail") String memberEmail) {
        String checkResult = memberService.emailDuplicateCheck(memberEmail);
        return checkResult;
    }

    // 로그인 페이지 출력
    @GetMapping("/login")
    public String loginForm() {
        return "memberLogin";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            model.addAttribute("modelEmail", memberDTO.getMemberEmail());
            return "boardPages/boardList";
        } else {
            return "memberLogin";
        }
    }

    // 관리자 페이지 출력
    @GetMapping("/admin")
    public String adminForm() {
        return "admin";
    }

    // 회원 목록 출력 (관리자 페이지)
    @GetMapping("/members")
    public String findAll(Model model) {
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList", memberList);
        return "memberList";
    }

    // 회원 삭제 (관리자 페이지)
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/members";
    }

    // 마이페이지 출력
    @GetMapping("/myPage")
    public String myPageForm(HttpSession session, Model model) {
        String memberEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.myPageForm(memberEmail);
        model.addAttribute("member", memberDTO);
        return "memberPage";
    }

    // 마이페이지 수정 처리
    @PostMapping("/myPage")
    public String myPage(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.myPage(memberDTO);
        if (result) {
            return "/boardPages/boardList";
        } else {
            return "/index";
        }
    }
}
