package com.open.ma.junggon.service;
import java.io.Serializable;
import java.util.List;
import org.apache.ibatis.type.Alias;
import com.open.cmmn.model.CmmnDefaultVO;
/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("secretVO")
public class SecretVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	

	
	private String seSeq;				 	   
	private String seRgstId;			
	private String seRgstDt;						
	private String seRvseDt;			
	private String seUseYn;
	private String seTitle;	
	private String seCont;		
	private String seAtchFileId;
	private String seSecretYn; 		
	private String seSecretPw;
	private String seCategory;
	
	
	
	
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}






	public String getSeSeq() {
		return seSeq;
	}






	public void setSeSeq(String seSeq) {
		this.seSeq = seSeq;
	}






	public String getSeRgstId() {
		return seRgstId;
	}






	public void setSeRgstId(String seRgstId) {
		this.seRgstId = seRgstId;
	}






	public String getSeRgstDt() {
		return seRgstDt;
	}






	public void setSeRgstDt(String seRgstDt) {
		this.seRgstDt = seRgstDt;
	}






	public String getSeRvseDt() {
		return seRvseDt;
	}






	public void setSeRvseDt(String seRvseDt) {
		this.seRvseDt = seRvseDt;
	}






	public String getSeUseYn() {
		return seUseYn;
	}






	public void setSeUseYn(String seUseYn) {
		this.seUseYn = seUseYn;
	}






	public String getSeSecretYn() {
		return seSecretYn;
	}






	public void setSeSecretYn(String seSecretYn) {
		this.seSecretYn = seSecretYn;
	}






	public String getSeTitle() {
		return seTitle;
	}






	public void setSeTitle(String seTitle) {
		this.seTitle = seTitle;
	}






	public String getSeCont() {
		return seCont;
	}






	public void setSeCont(String seCont) {
		this.seCont = seCont;
	}






	public String getSeAtchFileId() {
		return seAtchFileId;
	}






	public void setSeAtchFileId(String seAtchFileId) {
		this.seAtchFileId = seAtchFileId;
	}






	public String getSeSecretPw() {
		return seSecretPw;
	}






	public void setSeSecretPw(String seSecretPw) {
		this.seSecretPw = seSecretPw;
	}






	public String getSeCategory() {
		return seCategory;
	}






	public void setSeCategory(String seCategory) {
		this.seCategory = seCategory;
	}
	
	
	
	
	
	
	
}