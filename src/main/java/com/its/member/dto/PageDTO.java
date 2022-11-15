package com.its.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 홈페이지 안에서 페이지 번호 표시를 위한 DTO
@Getter
@Setter
@ToString
public class PageDTO {
    private int page; // 현재 페이지
    private int maxPage; // 필요한 페이지 갯수
    private int startPage; // 시작 페이지
    private int endPage; // 끝 페이지
}
