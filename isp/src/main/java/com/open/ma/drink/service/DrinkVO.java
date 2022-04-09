package com.open.ma.drink.service;

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
@Alias("drinkVO")
public class DrinkVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String drSeq;                
	private String drTitle;
	private String drCont;
	private String drRgstDt;
	private String drRgstId;
	private String drRvseDt;
	private String drRvstId;
	private String drUseYn;
	private String drAtchFileId;
	private String drReview;
	private String drStar;
	private String drCategory;
	private String drLike;
	private String drPtoho;
	private String drSoldoutYn;
	private String drBasket;
	private String drPurchaseYn;
	private String drBrand;
	private String drIngredient;
	private String drPayment;
	private int drPrice;
	
	
	public String getDrSeq() {
		return drSeq;
	}
	public void setDrSeq(String drSeq) {
		this.drSeq = drSeq;
	}
	public String getDrTitle() {
		return drTitle;
	}
	public void setDrTitle(String drTitle) {
		this.drTitle = drTitle;
	}
	public String getDrCont() {
		return drCont;
	}
	public void setDrCont(String drCont) {
		this.drCont = drCont;
	}
	public String getDrRgstDt() {
		return drRgstDt;
	}
	public void setDrRgstDt(String drRgstDt) {
		this.drRgstDt = drRgstDt;
	}
	public String getDrRgstId() {
		return drRgstId;
	}
	public void setDrRgstId(String drRgstId) {
		this.drRgstId = drRgstId;
	}
	public String getDrRvseDt() {
		return drRvseDt;
	}
	public void setDrRvseDt(String drRvseDt) {
		this.drRvseDt = drRvseDt;
	}
	public String getDrRvstId() {
		return drRvstId;
	}
	public void setDrRvstId(String drRvstId) {
		this.drRvstId = drRvstId;
	}
	public String getDrUseYn() {
		return drUseYn;
	}
	public void setDrUseYn(String drUseYn) {
		this.drUseYn = drUseYn;
	}
	public String getDrAtchFileId() {
		return drAtchFileId;
	}
	public void setDrAtchFileId(String drAtchFileId) {
		this.drAtchFileId = drAtchFileId;
	}
	public String getDrReview() {
		return drReview;
	}
	public void setDrReview(String drReview) {
		this.drReview = drReview;
	}
	public String getDrStar() {
		return drStar;
	}
	public void setDrStar(String drStar) {
		this.drStar = drStar;
	}
	public String getDrCategory() {
		return drCategory;
	}
	public void setDrCategory(String drCategory) {
		this.drCategory = drCategory;
	}
	public String getDrLike() {
		return drLike;
	}
	public void setDrLike(String drLike) {
		this.drLike = drLike;
	}
	public String getDrPtoho() {
		return drPtoho;
	}
	public void setDrPtoho(String drPtoho) {
		this.drPtoho = drPtoho;
	}
	public String getDrSoldoutYn() {
		return drSoldoutYn;
	}
	public void setDrSoldoutYn(String drSoldoutYn) {
		this.drSoldoutYn = drSoldoutYn;
	}
	public String getDrBasket() {
		return drBasket;
	}
	public void setDrBasket(String drBasket) {
		this.drBasket = drBasket;
	}
	public String getDrPurchaseYn() {
		return drPurchaseYn;
	}
	public void setDrPurchaseYn(String drPurchaseYn) {
		this.drPurchaseYn = drPurchaseYn;
	}
	public String getDrBrand() {
		return drBrand;
	}
	public void setDrBrand(String drBrand) {
		this.drBrand = drBrand;
	}
	public String getDrIngredient() {
		return drIngredient;
	}
	public void setDrIngredient(String drIngredient) {
		this.drIngredient = drIngredient;
	}
	public String getDrPayment() {
		return drPayment;
	}
	public void setDrPayment(String drPayment) {
		this.drPayment = drPayment;
	}
	public int getDrPrice() {
		return drPrice;
	}
	public void setDrPrice(int drPrice) {
		this.drPrice = drPrice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
}