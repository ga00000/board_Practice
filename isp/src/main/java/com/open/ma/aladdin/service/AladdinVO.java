package com.open.ma.aladdin.service;

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
@Alias("aladdinVO")
public class AladdinVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String alSeq;
	private String alTitle;
	private String alCont;
	private String alWriter;
	private String alPublishing;
	private String alPublDt;
	private String alCategory;
	private String alStar;
	private String alLike;
	private String alReviewP;
	private String alReviewU;
	private String alRgstDt;
	private String alRgstId;
	private String alRvseDt;
	private String alRvseId;
	private String alUseYn;
	private String alAtchFileId;
	private String alCover;
	private String alEbookYn;
	private String alSoldoutYn;
	private String alBasket;
	private String alPayment;
	private int alPrice;
	
	
	public String getAlSeq() {
		return alSeq;
	}
	public void setAlSeq(String alSeq) {
		this.alSeq = alSeq;
	}
	public String getAlTitle() {
		return alTitle;
	}
	public void setAlTitle(String alTitle) {
		this.alTitle = alTitle;
	}
	public String getAlCont() {
		return alCont;
	}
	public void setAlCont(String alCont) {
		this.alCont = alCont;
	}
	public String getAlWriter() {
		return alWriter;
	}
	public void setAlWriter(String alWriter) {
		this.alWriter = alWriter;
	}
	public String getAlPublishing() {
		return alPublishing;
	}
	public void setAlPublishing(String alPublishing) {
		this.alPublishing = alPublishing;
	}
	public String getAlPublDt() {
		return alPublDt;
	}
	public void setAlPublDt(String alPublDt) {
		this.alPublDt = alPublDt;
	}
	public String getAlCategory() {
		return alCategory;
	}
	public void setAlCategory(String alCategory) {
		this.alCategory = alCategory;
	}
	public String getAlStar() {
		return alStar;
	}
	public void setAlStar(String alStar) {
		this.alStar = alStar;
	}
	public String getAlLike() {
		return alLike;
	}
	public void setAlLike(String alLike) {
		this.alLike = alLike;
	}
	public String getAlReviewP() {
		return alReviewP;
	}
	public void setAlReviewP(String alReviewP) {
		this.alReviewP = alReviewP;
	}
	public String getAlReviewU() {
		return alReviewU;
	}
	public void setAlReviewU(String alReviewU) {
		this.alReviewU = alReviewU;
	}
	public String getAlRgstDt() {
		return alRgstDt;
	}
	public void setAlRgstDt(String alRgstDt) {
		this.alRgstDt = alRgstDt;
	}
	public String getAlRgstId() {
		return alRgstId;
	}
	public void setAlRgstId(String alRgstId) {
		this.alRgstId = alRgstId;
	}
	public String getAlRvseDt() {
		return alRvseDt;
	}
	public void setAlRvseDt(String alRvseDt) {
		this.alRvseDt = alRvseDt;
	}
	public String getAlRvseId() {
		return alRvseId;
	}
	public void setAlRvseId(String alRvseId) {
		this.alRvseId = alRvseId;
	}
	public String getAlUseYn() {
		return alUseYn;
	}
	public void setAlUseYn(String alUseYn) {
		this.alUseYn = alUseYn;
	}
	public String getAlAtchFileId() {
		return alAtchFileId;
	}
	public void setAlAtchFileId(String alAtchFileId) {
		this.alAtchFileId = alAtchFileId;
	}
	public String getAlCover() {
		return alCover;
	}
	public void setAlCover(String alCover) {
		this.alCover = alCover;
	}
	public String getAlEbookYn() {
		return alEbookYn;
	}
	public void setAlEbookYn(String alEbookYn) {
		this.alEbookYn = alEbookYn;
	}
	public String getAlSoldoutYn() {
		return alSoldoutYn;
	}
	public void setAlSoldoutYn(String alSoldoutYn) {
		this.alSoldoutYn = alSoldoutYn;
	}
	public String getAlBasket() {
		return alBasket;
	}
	public void setAlBasket(String alBasket) {
		this.alBasket = alBasket;
	}
	public String getAlPayment() {
		return alPayment;
	}
	public void setAlPayment(String alPayment) {
		this.alPayment = alPayment;
	}
	public int getAlPrice() {
		return alPrice;
	}
	public void setAlPrice(int alPrice) {
		this.alPrice = alPrice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
}