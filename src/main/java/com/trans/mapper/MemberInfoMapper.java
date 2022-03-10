package com.trans.mapper;

import org.apache.ibatis.annotations.Param;

import com.trans.vo.MemberInfoVO;

public interface MemberInfoMapper {

	public int insertMemberInfo(
			@Param("miName") String miName,
			@Param("miBirth") String miBirth,
			@Param("miEmail") String miEmail,
			@Param("miId") String miId,
			@Param("miPassword") String miPassword);
	
	public boolean existById(String miId);
	
	public MemberInfoVO memberByIdPassword(
			@Param("miId") String miId, 
			@Param("miPassword") String miPassword);
	
	
}
