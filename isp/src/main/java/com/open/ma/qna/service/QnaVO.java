package com.open.ma.qna.service;
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
@Alias("qnaVO")
public class QnaVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String qaSeq;             
	private String qaRgstId;      
	private String qaRgstDt;            
	private String qaRvseDt;
	private String qaTitle;  
	private String qaCont;   
	private String qaAtchFileId;      
	private String qaUseYn;
	private String qaCategory;
	private String qaMaRgstId;      
	private String qaMaRgstDt;            
	private String qaMaRvseDt;
	private String qaContAns;
	private String qaAnswerYn;
	
	
	
	
	
	
	
	
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}











	public String getQaSeq() {
		return qaSeq;
	}











	public void setQaSeq(String qaSeq) {
		this.qaSeq = qaSeq;
	}











	public String getQaRgstId() {
		return qaRgstId;
	}











	public void setQaRgstId(String qaRgstId) {
		this.qaRgstId = qaRgstId;
	}











	public String getQaRgstDt() {
		return qaRgstDt;
	}











	public void setQaRgstDt(String qaRgstDt) {
		this.qaRgstDt = qaRgstDt;
	}











	public String getQaRvseDt() {
		return qaRvseDt;
	}











	public void setQaRvseDt(String qaRvseDt) {
		this.qaRvseDt = qaRvseDt;
	}











	public String getQaTitle() {
		return qaTitle;
	}











	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}











	public String getQaCont() {
		return qaCont;
	}











	public void setQaCont(String qaCont) {
		this.qaCont = qaCont;
	}











	public String getQaAtchFileId() {
		return qaAtchFileId;
	}











	public void setQaAtchFileId(String qaAtchFileId) {
		this.qaAtchFileId = qaAtchFileId;
	}











	public String getQaUseYn() {
		return qaUseYn;
	}











	public void setQaUseYn(String qaUseYn) {
		this.qaUseYn = qaUseYn;
	}











	public String getQaCategory() {
		return qaCategory;
	}











	public void setQaCategory(String qaCategory) {
		this.qaCategory = qaCategory;
	}











	public String getQaMaRgstId() {
		return qaMaRgstId;
	}











	public void setQaMaRgstId(String qaMaRgstId) {
		this.qaMaRgstId = qaMaRgstId;
	}











	public String getQaMaRgstDt() {
		return qaMaRgstDt;
	}











	public void setQaMaRgstDt(String qaMaRgstDt) {
		this.qaMaRgstDt = qaMaRgstDt;
	}











	public String getQaMaRvseDt() {
		return qaMaRvseDt;
	}











	public void setQaMaRvseDt(String qaMaRvseDt) {
		this.qaMaRvseDt = qaMaRvseDt;
	}











	public String getQaContAns() {
		return qaContAns;
	}











	public void setQaContAns(String qaContAns) {
		this.qaContAns = qaContAns;
	}











	public String getQaAnswerYn() {
		return qaAnswerYn;
	}











	public void setQaAnswerYn(String qaAnswerYn) {
		this.qaAnswerYn = qaAnswerYn;
	}

	
	
	
}