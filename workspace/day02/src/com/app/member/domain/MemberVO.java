package com.app.member.domain;

public class MemberVO {
   private Long memberId;
   private String memberName;
   private String memberBirth;
   private String memberIdentification;
   private String memberPassword;
   
   public MemberVO() {;}

   public Long getMemberId() {
      return memberId;
   }

   public void setMemberId(Long memberId) {
      this.memberId = memberId;
   }

   public String getMemberName() {
      return memberName;
   }

   public void setMemberName(String memberName) {
      this.memberName = memberName;
   }

   public String getMemberBirth() {
      return memberBirth;
   }

   public void setMemberBirth(String memberBirth) {
      this.memberBirth = memberBirth;
   }

   public String getMemberIdentification() {
      return memberIdentification;
   }

   public void setMemberIdentification(String memberIdentification) {
      this.memberIdentification = memberIdentification;
   }

   public String getMemberPassword() {
      return memberPassword;
   }

   public void setMemberPassword(String memberPassword) {
      this.memberPassword = memberPassword;
   }

   @Override
   public String toString() {
      return "MemberVO [memberId=" + memberId + ", memberName=" + memberName + ", memberBirth=" + memberBirth
            + ", memberIdentification=" + memberIdentification + ", memberPassword=" + memberPassword + "]";
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
      return result;
   }

   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      MemberVO other = (MemberVO) obj;
      if (memberId == null) {
         if (other.memberId != null)
            return false;
      } else if (!memberId.equals(other.memberId))
         return false;
      return true;
   }
}