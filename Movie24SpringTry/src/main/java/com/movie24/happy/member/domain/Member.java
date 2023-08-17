package com.movie24.happy.member.domain;

import java.sql.Timestamp;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNickname;
	private String memberAddress;
	private String memberPhone;
	private String memberEmail;
	private String memberEmailYN;
	private Timestamp memberDate;
	private Timestamp updateDate;
	private String memberYN;
	
	public Member() {}
	
	public Member(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}
	
	public Member(String memberName, String memberPhone, String memberEmail) {
		super();
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
	}
	
	public Member(String memberId, String memberPw, String memberName, String memberNickname, String memberAddress,
			String memberPhone, String memberEmail, String memberEmailYN) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberAddress = memberAddress;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberEmailYN = memberEmailYN;
	}
	
	
	public Member(String memberId, String memberPw, String memberName, String memberNickname, String memberAddress,
			String memberPhone, String memberEmail, String memberEmailYN, Timestamp updateDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberAddress = memberAddress;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberEmailYN = memberEmailYN;
		this.updateDate = updateDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberEmailYN() {
		return memberEmailYN;
	}

	public void setMemberEmailYN(String memberEmailYN) {
		this.memberEmailYN = memberEmailYN;
	}

	public Timestamp getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getMemberYN() {
		return memberYN;
	}

	public void setMemberYN(String memberYN) {
		this.memberYN = memberYN;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberNickname=" + memberNickname + ", memberAddress=" + memberAddress + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", memberEmailYN=" + memberEmailYN + ", memberDate="
				+ memberDate + ", updateDate=" + updateDate + ", memberYN=" + memberYN + "]";
	}

	
}
