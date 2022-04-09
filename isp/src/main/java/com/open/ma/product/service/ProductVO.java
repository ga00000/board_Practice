package com.open.ma.product.service;

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
@Alias("productVO")
public class ProductVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String pdSeq;
	private String pdTitle;
	private String pdCont;
	private String pdRgstDt;
	private String pdRgstId;
	private String pdRvseDt;
	private String pdRvstId;
	private String pdUseYn;
	private String pdAtchFileId;
	private String pdReview;
	private String pdStar;
	private String pdCategory;
	private String pdLike;
	private String pdPtoho;
	private String pdSoldoutYn;
	private String pdBasket;
	private String pdPurchaseYn;
	private String pdCompany;
	private String pdDeliveryYn;
	private String pdPayment;
	
	public String getPdSeq() {
		return pdSeq;
	}
	public void setPdSeq(String pdSeq) {
		this.pdSeq = pdSeq;
	}
	public String getPdTitle() {
		return pdTitle;
	}
	public void setPdTitle(String pdTitle) {
		this.pdTitle = pdTitle;
	}
	public String getPdCont() {
		return pdCont;
	}
	public void setPdCont(String pdCont) {
		this.pdCont = pdCont;
	}
	public String getPdRgstDt() {
		return pdRgstDt;
	}
	public void setPdRgstDt(String pdRgstDt) {
		this.pdRgstDt = pdRgstDt;
	}
	public String getPdRgstId() {
		return pdRgstId;
	}
	public void setPdRgstId(String pdRgstId) {
		this.pdRgstId = pdRgstId;
	}
	public String getPdRvseDt() {
		return pdRvseDt;
	}
	public void setPdRvseDt(String pdRvseDt) {
		this.pdRvseDt = pdRvseDt;
	}
	public String getPdRvstId() {
		return pdRvstId;
	}
	public void setPdRvstId(String pdRvstId) {
		this.pdRvstId = pdRvstId;
	}
	public String getPdUseYn() {
		return pdUseYn;
	}
	public void setPdUseYn(String pdUseYn) {
		this.pdUseYn = pdUseYn;
	}
	public String getPdAtchFileId() {
		return pdAtchFileId;
	}
	public void setPdAtchFileId(String pdAtchFileId) {
		this.pdAtchFileId = pdAtchFileId;
	}
	public String getPdReview() {
		return pdReview;
	}
	public void setPdReview(String pdReview) {
		this.pdReview = pdReview;
	}
	public String getPdStar() {
		return pdStar;
	}
	public void setPdStar(String pdStar) {
		this.pdStar = pdStar;
	}
	public String getPdCategory() {
		return pdCategory;
	}
	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}
	public String getPdLike() {
		return pdLike;
	}
	public void setPdLike(String pdLike) {
		this.pdLike = pdLike;
	}
	public String getPdPtoho() {
		return pdPtoho;
	}
	public void setPdPtoho(String pdPtoho) {
		this.pdPtoho = pdPtoho;
	}
	public String getPdSoldoutYn() {
		return pdSoldoutYn;
	}
	public void setPdSoldoutYn(String pdSoldoutYn) {
		this.pdSoldoutYn = pdSoldoutYn;
	}
	public String getPdBasket() {
		return pdBasket;
	}
	public void setPdBasket(String pdBasket) {
		this.pdBasket = pdBasket;
	}
	public String getPdPurchaseYn() {
		return pdPurchaseYn;
	}
	public void setPdPurchaseYn(String pdPurchaseYn) {
		this.pdPurchaseYn = pdPurchaseYn;
	}
	public String getPdCompany() {
		return pdCompany;
	}
	public void setPdCompany(String pdCompany) {
		this.pdCompany = pdCompany;
	}
	public String getPdDeliveryYn() {
		return pdDeliveryYn;
	}
	public void setPdDeliveryYn(String pdDeliveryYn) {
		this.pdDeliveryYn = pdDeliveryYn;
	}
	public String getPdPayment() {
		return pdPayment;
	}
	public void setPdPayment(String pdPayment) {
		this.pdPayment = pdPayment;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
	
	
}