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
@Alias("jgCmtThreeVO")
public class JgCmtThreeVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String jgSeq;		
	private String jgReSeq;    	
	private String jgRgstId;	
	private String jgRgstDt;	
	private String jgRvseId;	
	private String jgRvseDt;	
	private String jgTitle;	        
	private String jgCont;		
	private String jgAtchFileId;
	private String jgUseYn;		
	
	private String jgReRgstId;		
	private String jgReRgstDt;		
	private String jgReRvseDt;		
	private String jgReUseYn;		
	private String jgReCont;   		
	private String jgReAtchFileId;	
	                                  

	
	
	
	public String getJgSeq() {
		return jgSeq;
	}
	public void setJgSeq(String jgSeq) {
		this.jgSeq = jgSeq;
	}

	public String getJgRgstId() {
		return jgRgstId;
	}
	public void setJgRgstId(String jgRgstId) {
		this.jgRgstId = jgRgstId;
	}
	public String getJgRgstDt() {
		return jgRgstDt;
	}
	public void setJgRgstDt(String jgRgstDt) {
		this.jgRgstDt = jgRgstDt;
	}
	public String getJgRvseId() {
		return jgRvseId;
	}
	public void setJgRvseId(String jgRvseId) {
		this.jgRvseId = jgRvseId;
	}
	public String getJgRvseDt() {
		return jgRvseDt;
	}
	public void setJgRvseDt(String jgRvseDt) {
		this.jgRvseDt = jgRvseDt;
	}
	public String getJgUseYn() {
		return jgUseYn;
	}
	public void setJgUseYn(String jgUseYn) {
		this.jgUseYn = jgUseYn;
	}
	public String getJgTitle() {
		return jgTitle;
	}
	public void setJgTitle(String jgTitle) {
		this.jgTitle = jgTitle;
	}
	public String getJgCont() {
		return jgCont;
	}
	public void setJgCont(String jgCont) {
		this.jgCont = jgCont;
	}
	public String getJgAtchFileId() {
		return jgAtchFileId;
	}
	public void setJgAtchFileId(String jgAtchFileId) {
		this.jgAtchFileId = jgAtchFileId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getJgReRgstId() {
		return jgReRgstId;
	}
	public void setJgReRgstId(String jgReRgstId) {
		this.jgReRgstId = jgReRgstId;
	}
	public String getJgReRgstDt() {
		return jgReRgstDt;
	}
	public void setJgReRgstDt(String jgReRgstDt) {
		this.jgReRgstDt = jgReRgstDt;
	}
	public String getJgReRvseDt() {
		return jgReRvseDt;
	}
	public void setJgReRvseDt(String jgReRvseDt) {
		this.jgReRvseDt = jgReRvseDt;
	}
	public String getJgReUseYn() {
		return jgReUseYn;
	}
	public void setJgReUseYn(String jgReUseYn) {
		this.jgReUseYn = jgReUseYn;
	}
	public String getJgReCont() {
		return jgReCont;
	}
	public void setJgReCont(String jgReCont) {
		this.jgReCont = jgReCont;
	}
	public String getJgReAtchFileId() {
		return jgReAtchFileId;
	}
	public void setJgReAtchFileId(String jgReAtchFileId) {
		this.jgReAtchFileId = jgReAtchFileId;
	}
	public String getJgReSeq() {
		return jgReSeq;
	}
	public void setJgReSeq(String jgReSeq) {
		this.jgReSeq = jgReSeq;
	}	

	
	
	
	
}