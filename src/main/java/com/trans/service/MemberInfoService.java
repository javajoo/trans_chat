package com.trans.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trans.mapper.MemberInfoMapper;
import com.trans.vo.MemberInfoVO;

@Service
public class MemberInfoService {

	@Autowired
	private MemberInfoMapper miMapper;
	
	public int insertMemberInfo(String miName,String miBirth,String miEmail,String miId,String miPassword) {
		return miMapper.insertMemberInfo(miName, miBirth, miEmail, miId, miPassword);
	}
	
	public boolean existById(String miId) {
		return miMapper.existById(miId);
	}
	
	public MemberInfoVO memberByIdPassword(String miId, String miPassword) {
		return miMapper.memberByIdPassword(miId, miPassword);
	}
	
}
