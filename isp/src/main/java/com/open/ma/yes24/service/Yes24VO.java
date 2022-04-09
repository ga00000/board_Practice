package com.open.ma.yes24.service;

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
@Alias("yes24VO")
public class Yes24VO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String yesSeq;                
	private String yesTitle;
	private String yesCont;
	private String yesRgstDt;
	private String yesRgstId;
	private String yesRvseDt;
	private String yesRvstId;
	private String yesUseYn;
	private String yesAtchFileId;
	private String yesReview;
	private String yesStar;
	private String yesCategory;
	private String yesLike;
	private String yesPtoho;
	private String yesSoldoutYn;
	private String yesBasket;
	private String yesPurchaseYn;
	private String yesBrand;
	private String yesIngredient;
	private String yesPayment;
	private int yesPrice;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getYesSeq() {
		return yesSeq;
	}
	public void setYesSeq(String yesSeq) {
		this.yesSeq = yesSeq;
	}
	public String getYesTitle() {
		return yesTitle;
	}
	public void setYesTitle(String yesTitle) {
		this.yesTitle = yesTitle;
	}
	public String getYesCont() {
		return yesCont;
	}
	public void setYesCont(String yesCont) {
		this.yesCont = yesCont;
	}
	public String getYesRgstDt() {
		return yesRgstDt;
	}
	public void setYesRgstDt(String yesRgstDt) {
		this.yesRgstDt = yesRgstDt;
	}
	public String getYesRgstId() {
		return yesRgstId;
	}
	public void setYesRgstId(String yesRgstId) {
		this.yesRgstId = yesRgstId;
	}
	public String getYesRvseDt() {
		return yesRvseDt;
	}
	public void setYesRvseDt(String yesRvseDt) {
		this.yesRvseDt = yesRvseDt;
	}
	public String getYesRvstId() {
		return yesRvstId;
	}
	public void setYesRvstId(String yesRvstId) {
		this.yesRvstId = yesRvstId;
	}
	public String getYesUseYn() {
		return yesUseYn;
	}
	public void setYesUseYn(String yesUseYn) {
		this.yesUseYn = yesUseYn;
	}
	public String getYesAtchFileId() {
		return yesAtchFileId;
	}
	public void setYesAtchFileId(String yesAtchFileId) {
		this.yesAtchFileId = yesAtchFileId;
	}
	public String getYesReview() {
		return yesReview;
	}
	public void setYesReview(String yesReview) {
		this.yesReview = yesReview;
	}
	public String getYesStar() {
		return yesStar;
	}
	public void setYesStar(String yesStar) {
		this.yesStar = yesStar;
	}
	public String getYesCategory() {
		return yesCategory;
	}
	public void setYesCategory(String yesCategory) {
		this.yesCategory = yesCategory;
	}
	public String getYesLike() {
		return yesLike;
	}
	public void setYesLike(String yesLike) {
		this.yesLike = yesLike;
	}
	public String getYesPtoho() {
		return yesPtoho;
	}
	public void setYesPtoho(String yesPtoho) {
		this.yesPtoho = yesPtoho;
	}
	public String getYesSoldoutYn() {
		return yesSoldoutYn;
	}
	public void setYesSoldoutYn(String yesSoldoutYn) {
		this.yesSoldoutYn = yesSoldoutYn;
	}
	public String getYesBasket() {
		return yesBasket;
	}
	public void setYesBasket(String yesBasket) {
		this.yesBasket = yesBasket;
	}
	public String getYesPurchaseYn() {
		return yesPurchaseYn;
	}
	public void setYesPurchaseYn(String yesPurchaseYn) {
		this.yesPurchaseYn = yesPurchaseYn;
	}
	public String getYesBrand() {
		return yesBrand;
	}
	public void setYesBrand(String yesBrand) {
		this.yesBrand = yesBrand;
	}
	public String getYesIngredient() {
		return yesIngredient;
	}
	public void setYesIngredient(String yesIngredient) {
		this.yesIngredient = yesIngredient;
	}
	public String getYesPayment() {
		return yesPayment;
	}
	public void setYesPayment(String yesPayment) {
		this.yesPayment = yesPayment;
	}
	public int getYesPrice() {
		return yesPrice;
	}
	public void setYesPrice(int yesPrice) {
		this.yesPrice = yesPrice;
	}	
	
	
	
}