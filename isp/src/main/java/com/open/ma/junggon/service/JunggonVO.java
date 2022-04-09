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
@Alias("junggonVO")
public class JunggonVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String jgSeq;                
	private String jgTitle;
	private String jgRgstDt;
	private String jgRgstId;
	private String jgRvseDt;
	private String jgRvstId;
	private String jgUseYn;
	private String jgAtchFileId;
	private String jgCCont;
	private String jgCRgstId;
	private String jgCRgstDt;
	private String jgCAtchFileId;
	private String jgCSeq;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getJgSeq() {
		return jgSeq;
	}
	public void setJgSeq(String jgSeq) {
		this.jgSeq = jgSeq;
	}
	public String getJgTitle() {
		return jgTitle;
	}
	public void setJgTitle(String jgTitle) {
		this.jgTitle = jgTitle;
	}
	
	public String getJgRgstDt() {
		return jgRgstDt;
	}
	public void setJgRgstDt(String jgRgstDt) {
		this.jgRgstDt = jgRgstDt;
	}
	public String getJgRgstId() {
		return jgRgstId;
	}
	public void setJgRgstId(String jgRgstId) {
		this.jgRgstId = jgRgstId;
	}
	public String getJgRvseDt() {
		return jgRvseDt;
	}
	public void setJgRvseDt(String jgRvseDt) {
		this.jgRvseDt = jgRvseDt;
	}
	public String getJgRvstId() {
		return jgRvstId;
	}
	public void setJgRvstId(String jgRvstId) {
		this.jgRvstId = jgRvstId;
	}
	public String getJgUseYn() {
		return jgUseYn;
	}
	public void setJgUseYn(String jgUseYn) {
		this.jgUseYn = jgUseYn;
	}
	public String getJgAtchFileId() {
		return jgAtchFileId;
	}
	public void setJgAtchFileId(String jgAtchFileId) {
		this.jgAtchFileId = jgAtchFileId;
	}
	
	public String getJgCCont() {
		return jgCCont;
	}

	public void setJgCCont(String jgCCont) {
		this.jgCCont = jgCCont;
	}

	public String getJgCRgstId() {
		return jgCRgstId;
	}

	public void setJgCRgstId(String jgCRgstId) {
		this.jgCRgstId = jgCRgstId;
	}

	public String getJgCRgstDt() {
		return jgCRgstDt;
	}

	public void setJgCRgstDt(String jgCRgstDt) {
		this.jgCRgstDt = jgCRgstDt;
	}

	public String getJgCAtchFileId() {
		return jgCAtchFileId;
	}

	public void setJgCAtchFileId(String jgCAtchFileId) {
		this.jgCAtchFileId = jgCAtchFileId;
	}

	public String getJgCSeq() {
		return jgCSeq;
	}

	public void setJgCSeq(String jgCSeq) {
		this.jgCSeq = jgCSeq;
	}

	
	
	
}