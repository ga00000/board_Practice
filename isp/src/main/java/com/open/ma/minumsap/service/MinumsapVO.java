package com.open.ma.minumsap.service;

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
@Alias("minumsapVO")
public class MinumsapVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String miSeq;                
	private String miTitle;
	private String miCont;
	private String miRgstDt;
	private String miRgstId;
	private String miRvseDt;
	private String miRvstId;
	private String miUseYn;
	private String miAtchFileId;
	private String miReview;
	private String miStar;
	private String miCategory;
	private String miLike;
	private String miPtoho;
	private String miSoldoutYn;
	private String miBasket;
	private String miPurchaseYn;
	private String miBrand;
	private String miIngredient;
	private String miPayment;
	private int miPrice;
	
	public String getMiSeq() {
		return miSeq;
	}

	public void setMiSeq(String miSeq) {
		this.miSeq = miSeq;
	}

	public String getMiTitle() {
		return miTitle;
	}

	public void setMiTitle(String miTitle) {
		this.miTitle = miTitle;
	}
	
	public String getMiCont() {
		return miCont;
	}

	public void setMiCont(String miCont) {
		this.miCont = miCont;
	}

	public String getMiRgstDt() {
		return miRgstDt;
	}

	public void setMiRgstDt(String miRgstDt) {
		this.miRgstDt = miRgstDt;
	}

	public String getMiRgstId() {
		return miRgstId;
	}

	public void setMiRgstId(String miRgstId) {
		this.miRgstId = miRgstId;
	}

	public String getMiRvseDt() {
		return miRvseDt;
	}

	public void setMiRvseDt(String miRvseDt) {
		this.miRvseDt = miRvseDt;
	}

	public String getMiRvstId() {
		return miRvstId;
	}

	public void setMiRvstId(String miRvstId) {
		this.miRvstId = miRvstId;
	}

	public String getMiUseYn() {
		return miUseYn;
	}

	public void setMiUseYn(String miUseYn) {
		this.miUseYn = miUseYn;
	}

	public String getMiAtchFileId() {
		return miAtchFileId;
	}

	public void setMiAtchFileId(String miAtchFileId) {
		this.miAtchFileId = miAtchFileId;
	}

	public String getMiReview() {
		return miReview;
	}

	public void setMiReview(String miReview) {
		this.miReview = miReview;
	}

	public String getMiStar() {
		return miStar;
	}

	public void setMiStar(String miStar) {
		this.miStar = miStar;
	}

	public String getMiCategory() {
		return miCategory;
	}

	public void setMiCategory(String miCategory) {
		this.miCategory = miCategory;
	}

	public String getMiLike() {
		return miLike;
	}

	public void setMiLike(String miLike) {
		this.miLike = miLike;
	}

	public String getMiPtoho() {
		return miPtoho;
	}

	public void setMiPtoho(String miPtoho) {
		this.miPtoho = miPtoho;
	}

	public String getMiSoldoutYn() {
		return miSoldoutYn;
	}

	public void setMiSoldoutYn(String miSoldoutYn) {
		this.miSoldoutYn = miSoldoutYn;
	}

	public String getMiBasket() {
		return miBasket;
	}

	public void setMiBasket(String miBasket) {
		this.miBasket = miBasket;
	}

	public String getMiPurchaseYn() {
		return miPurchaseYn;
	}

	public void setMiPurchaseYn(String miPurchaseYn) {
		this.miPurchaseYn = miPurchaseYn;
	}

	public String getMiBrand() {
		return miBrand;
	}

	public void setMiBrand(String miBrand) {
		this.miBrand = miBrand;
	}

	public String getMiIngredient() {
		return miIngredient;
	}

	public void setMiIngredient(String miIngredient) {
		this.miIngredient = miIngredient;
	}

	public String getMiPayment() {
		return miPayment;
	}

	public void setMiPayment(String miPayment) {
		this.miPayment = miPayment;
	}

	public int getMiPrice() {
		return miPrice;
	}

	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
	}
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
	
	
}