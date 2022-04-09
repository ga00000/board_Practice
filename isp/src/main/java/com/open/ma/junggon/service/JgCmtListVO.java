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
@Alias("jgCmtListVO")
public class JgCmtListVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	
	private String jgSeq;				
	private String jgGroupSeq;    	   
	private String jgRgstId;			
	private String jgRgstDt;			
	private String jgRvseId;			
	private String jgRvseDt;			
	private String jgUseYn;		
	private String jgTitle;	
	private String jgCont;			
	private String jgAtchFileId;		
	private String jgReAtchFileId;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getJgSeq() {
		return jgSeq;
	}


	public void setJgSeq(String jgSeq) {
		this.jgSeq = jgSeq;
	}


	public String getJgGroupSeq() {
		return jgGroupSeq;
	}


	public void setJgGroupSeq(String jgGroupSeq) {
		this.jgGroupSeq = jgGroupSeq;
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


	public String getJgAtchFileId() {
		return jgAtchFileId;
	}


	public void setJgAtchFileId(String jgAtchFileId) {
		this.jgAtchFileId = jgAtchFileId;
	}


	public String getJgUseYn() {
		return jgUseYn;
	}


	public void setJgUseYn(String jgUseYn) {
		this.jgUseYn = jgUseYn;
	}


	public String getJgReAtchFileId() {
		return jgReAtchFileId;
	}


	public void setJgReAtchFileId(String jgReAtchFileId) {
		this.jgReAtchFileId = jgReAtchFileId;
	}
	
	

	
	
	
}