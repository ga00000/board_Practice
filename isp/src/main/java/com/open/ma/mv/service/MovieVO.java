package com.open.ma.mv.service;

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
@Alias("movieVO")
public class MovieVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String mvSeq;
	private String mvTitle;
	private String mvCont;
	private String mvRgstDt;
	private String mvRgstId;
	private String mvRvseDt;
	private String mvRvseId;
	private String mvUseYn;
	private String mvAtchFileId;
	private String mvOpenDate;
	private String mvStar;
	private String mvReview;
	private String mvNotiYn;
	private String mvDirector;
	private String mvActor;
	private String mvScript;
	private String mvSeriesYn;
	private String mvPhoto;
	private String mvScreenYn;
	private String mvLike;
	
	
	public String getMvSeq() {
		return mvSeq;
	}
	public void setMvSeq(String mvSeq) {
		this.mvSeq = mvSeq;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}
	public String getMvCont() {
		return mvCont;
	}
	public void setMvCont(String mvCont) {
		this.mvCont = mvCont;
	}
	public String getMvRgstDt() {
		return mvRgstDt;
	}
	public void setMvRgstDt(String mvRgstDt) {
		this.mvRgstDt = mvRgstDt;
	}
	public String getMvRgstId() {
		return mvRgstId;
	}
	public void setMvRgstId(String mvRgstId) {
		this.mvRgstId = mvRgstId;
	}
	public String getMvRvseDt() {
		return mvRvseDt;
	}
	public void setMvRvseDt(String mvRvseDt) {
		this.mvRvseDt = mvRvseDt;
	}
	public String getMvRvseId() {
		return mvRvseId;
	}
	public void setMvRvseId(String mvRvseId) {
		this.mvRvseId = mvRvseId;
	}
	public String getMvUseYn() {
		return mvUseYn;
	}
	public void setMvUseYn(String mvUseYn) {
		this.mvUseYn = mvUseYn;
	}
	public String getMvAtchFileId() {
		return mvAtchFileId;
	}
	public void setMvAtchFileId(String mvAtchFileId) {
		this.mvAtchFileId = mvAtchFileId;
	}
	public String getMvOpenDate() {
		return mvOpenDate;
	}
	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}
	public String getMvStar() {
		return mvStar;
	}
	public void setMvStar(String mvStar) {
		this.mvStar = mvStar;
	}
	public String getMvReview() {
		return mvReview;
	}
	public void setMvReview(String mvReview) {
		this.mvReview = mvReview;
	}
	public String getMvNotiYn() {
		return mvNotiYn;
	}
	public void setMvNotiYn(String mvNotiYn) {
		this.mvNotiYn = mvNotiYn;
	}
	public String getMvDirector() {
		return mvDirector;
	}
	public void setMvDirector(String mvDirector) {
		this.mvDirector = mvDirector;
	}
	public String getMvActor() {
		return mvActor;
	}
	public void setMvActor(String mvActor) {
		this.mvActor = mvActor;
	}
	public String getMvScript() {
		return mvScript;
	}
	public void setMvScript(String mvScript) {
		this.mvScript = mvScript;
	}
	public String getMvSeriesYn() {
		return mvSeriesYn;
	}
	public void setMvSeriesYn(String mvSeriesYn) {
		this.mvSeriesYn = mvSeriesYn;
	}
	public String getMvPhoto() {
		return mvPhoto;
	}
	public void setMvPhoto(String mvPhoto) {
		this.mvPhoto = mvPhoto;
	}
	public String getMvScreenYn() {
		return mvScreenYn;
	}
	public void setMvScreenYn(String mvScreenYn) {
		this.mvScreenYn = mvScreenYn;
	}
	public String getMvLike() {
		return mvLike;
	}
	public void setMvLike(String mvLike) {
		this.mvLike = mvLike;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
}