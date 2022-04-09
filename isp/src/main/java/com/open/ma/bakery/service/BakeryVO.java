package com.open.ma.bakery.service;

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
@Alias("bakeryVO")
public class BakeryVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String bkSeq;                
	private String bkTitle;
	private String bkCont;
	private String bkRgstDt;
	private String bkRgstId;
	private String bkRvseDt;
	private String bkRvstId;
	private String bkUseYn;
	private String bkAtchFileId;
	private String bkReview;
	private String bkStar;
	private String bkCategory;
	private String bkLike;
	private String bkPtoho;
	private String bkSoldoutYn;
	private String bkBasket;
	private String bkPurchaseYn;
	private String bkBrand;
	private String bkIngredient;
	private String bkPayment;
	private int bkPrice;
	
	
	public String getBkSeq() {
		return bkSeq;
	}
	public void setBkSeq(String bkSeq) {
		this.bkSeq = bkSeq;
	}
	public String getBkTitle() {
		return bkTitle;
	}
	public void setBkTitle(String bkTitle) {
		this.bkTitle = bkTitle;
	}
	public String getBkCont() {
		return bkCont;
	}
	public void setBkCont(String bkCont) {
		this.bkCont = bkCont;
	}
	public String getBkRgstDt() {
		return bkRgstDt;
	}
	public void setBkRgstDt(String bkRgstDt) {
		this.bkRgstDt = bkRgstDt;
	}
	public String getBkRgstId() {
		return bkRgstId;
	}
	public void setBkRgstId(String bkRgstId) {
		this.bkRgstId = bkRgstId;
	}
	public String getBkRvseDt() {
		return bkRvseDt;
	}
	public void setBkRvseDt(String bkRvseDt) {
		this.bkRvseDt = bkRvseDt;
	}
	public String getBkRvstId() {
		return bkRvstId;
	}
	public void setBkRvstId(String bkRvstId) {
		this.bkRvstId = bkRvstId;
	}
	public String getBkUseYn() {
		return bkUseYn;
	}
	public void setBkUseYn(String bkUseYn) {
		this.bkUseYn = bkUseYn;
	}
	public String getBkAtchFileId() {
		return bkAtchFileId;
	}
	public void setBkAtchFileId(String bkAtchFileId) {
		this.bkAtchFileId = bkAtchFileId;
	}
	public String getBkReview() {
		return bkReview;
	}
	public void setBkReview(String bkReview) {
		this.bkReview = bkReview;
	}
	public String getBkStar() {
		return bkStar;
	}
	public void setBkStar(String bkStar) {
		this.bkStar = bkStar;
	}
	public String getBkCategory() {
		return bkCategory;
	}
	public void setBkCategory(String bkCategory) {
		this.bkCategory = bkCategory;
	}
	public String getBkLike() {
		return bkLike;
	}
	public void setBkLike(String bkLike) {
		this.bkLike = bkLike;
	}
	public String getBkPtoho() {
		return bkPtoho;
	}
	public void setBkPtoho(String bkPtoho) {
		this.bkPtoho = bkPtoho;
	}
	public String getBkSoldoutYn() {
		return bkSoldoutYn;
	}
	public void setBkSoldoutYn(String bkSoldoutYn) {
		this.bkSoldoutYn = bkSoldoutYn;
	}
	public String getBkBasket() {
		return bkBasket;
	}
	public void setBkBasket(String bkBasket) {
		this.bkBasket = bkBasket;
	}
	public String getBkPurchaseYn() {
		return bkPurchaseYn;
	}
	public void setBkPurchaseYn(String bkPurchaseYn) {
		this.bkPurchaseYn = bkPurchaseYn;
	}
	public String getBkBrand() {
		return bkBrand;
	}
	public void setBkBrand(String bkBrand) {
		this.bkBrand = bkBrand;
	}
	public String getBkIngredient() {
		return bkIngredient;
	}
	public void setBkIngredient(String bkIngredient) {
		this.bkIngredient = bkIngredient;
	}
	public String getBkPayment() {
		return bkPayment;
	}
	public void setBkPayment(String bkPayment) {
		this.bkPayment = bkPayment;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getBkPrice() {
		return bkPrice;
	}
	public void setBkPrice(int bkPrice) {
		this.bkPrice = bkPrice;
	}

	
	
	
	
}