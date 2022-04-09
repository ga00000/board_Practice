package com.open.ma.noodle.service;

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
@Alias("noodleVO")
public class NoodleVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ndSeq;                
	private String ndTitle;
	private String ndCont;
	private String ndRgstDt;
	private String ndRgstId;
	private String ndRvseDt;
	private String ndRvstId;
	private String ndUseYn;
	private String ndAtchFileId;
	private String ndReview;
	private String ndStar;
	private String ndCategory;
	private String ndLike;
	private String ndPtoho;
	private String ndSoldoutYn;
	private String ndBasket;
	private String ndPurchaseYn;
	private String ndBrand;
	private String ndIngredient;
	private String ndPayment;
	private int ndPrice;
	
	
	public String getNdSeq() {
		return ndSeq;
	}
	public void setNdSeq(String ndSeq) {
		this.ndSeq = ndSeq;
	}
	public String getNdTitle() {
		return ndTitle;
	}
	public void setNdTitle(String ndTitle) {
		this.ndTitle = ndTitle;
	}
	public String getNdCont() {
		return ndCont;
	}
	public void setNdCont(String ndCont) {
		this.ndCont = ndCont;
	}
	public String getNdRgstDt() {
		return ndRgstDt;
	}
	public void setNdRgstDt(String ndRgstDt) {
		this.ndRgstDt = ndRgstDt;
	}
	public String getNdRgstId() {
		return ndRgstId;
	}
	public void setNdRgstId(String ndRgstId) {
		this.ndRgstId = ndRgstId;
	}
	public String getNdRvseDt() {
		return ndRvseDt;
	}
	public void setNdRvseDt(String ndRvseDt) {
		this.ndRvseDt = ndRvseDt;
	}
	public String getNdRvstId() {
		return ndRvstId;
	}
	public void setNdRvstId(String ndRvstId) {
		this.ndRvstId = ndRvstId;
	}
	public String getNdUseYn() {
		return ndUseYn;
	}
	public void setNdUseYn(String ndUseYn) {
		this.ndUseYn = ndUseYn;
	}
	public String getNdAtchFileId() {
		return ndAtchFileId;
	}
	public void setNdAtchFileId(String ndAtchFileId) {
		this.ndAtchFileId = ndAtchFileId;
	}
	public String getNdReview() {
		return ndReview;
	}
	public void setNdReview(String ndReview) {
		this.ndReview = ndReview;
	}
	public String getNdStar() {
		return ndStar;
	}
	public void setNdStar(String ndStar) {
		this.ndStar = ndStar;
	}
	public String getNdCategory() {
		return ndCategory;
	}
	public void setNdCategory(String ndCategory) {
		this.ndCategory = ndCategory;
	}
	public String getNdLike() {
		return ndLike;
	}
	public void setNdLike(String ndLike) {
		this.ndLike = ndLike;
	}
	public String getNdPtoho() {
		return ndPtoho;
	}
	public void setNdPtoho(String ndPtoho) {
		this.ndPtoho = ndPtoho;
	}
	public String getNdSoldoutYn() {
		return ndSoldoutYn;
	}
	public void setNdSoldoutYn(String ndSoldoutYn) {
		this.ndSoldoutYn = ndSoldoutYn;
	}
	public String getNdBasket() {
		return ndBasket;
	}
	public void setNdBasket(String ndBasket) {
		this.ndBasket = ndBasket;
	}
	public String getNdPurchaseYn() {
		return ndPurchaseYn;
	}
	public void setNdPurchaseYn(String ndPurchaseYn) {
		this.ndPurchaseYn = ndPurchaseYn;
	}
	public String getNdBrand() {
		return ndBrand;
	}
	public void setNdBrand(String ndBrand) {
		this.ndBrand = ndBrand;
	}
	public String getNdIngredient() {
		return ndIngredient;
	}
	public void setNdIngredient(String ndIngredient) {
		this.ndIngredient = ndIngredient;
	}
	public String getNdPayment() {
		return ndPayment;
	}
	public void setNdPayment(String ndPayment) {
		this.ndPayment = ndPayment;
	}
	public int getNdPrice() {
		return ndPrice;
	}
	public void setNdPrice(int ndPrice) {
		this.ndPrice = ndPrice;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
}