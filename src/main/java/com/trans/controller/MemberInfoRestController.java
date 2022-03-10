package com.trans.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.trans.service.MemberInfoService;
import com.trans.vo.MemberInfoVO;

@RestController
public class MemberInfoRestController {
	
	@Autowired
	private MemberInfoService miService;
	
	@PostMapping("/member/member_join")
	public Map<String, Object> memberJoin(
			@RequestParam("miName") String miName,
			@RequestParam("miBirth") String miBirth,
			@RequestParam("miEmail") String miEmail,
			@RequestParam("miId") String miId,
			@RequestParam("miPassword") String miPassword
			) {
		Map<String,Object> result = new HashMap<>();
		result.put("result", "success");
		int row = miService.insertMemberInfo(miName, miBirth, miEmail, miId, miPassword);
				
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "로그인에 실패했습니다");
		}
		
		return result;
	}
	
	@PostMapping("/member/is_duplicatedId")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("miId") String miId
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		     boolean exist = miService.existById(miId);
		
			result.put("result", exist);
		
		
		return result;
	}
	
	@PostMapping("/member/member_sign_in")
	public Map<String, Object> memberSignIn(
			@RequestParam("miId") String miId, 
			@RequestParam("miPassword") String miPassword, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", "success");
		
		
	
		MemberInfoVO member = miService.memberByIdPassword(miId, miPassword);
	
		
		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("miId", member.getMiId());
			session.setAttribute("miName", member.getMiName());
			session.setAttribute("miNum", member.getMiNum());
		} else {
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 시도해주세요");
		}
		
		return result;
	}
	
}
