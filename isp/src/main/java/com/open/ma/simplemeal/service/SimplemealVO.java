package com.open.ma.simplemeal.service;

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
@Alias("simplemealVO")
public class SimplemealVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String smSeq;                
	private String smTitle;
	private String smCont;
	private String smRgstDt;
	private String smRgstId;
	private String smRvseDt;
	private String smRvstId;
	private String smUseYn;
	private String smAtchFileId;
	private String smReview;
	private String smStar;
	private String smCategory;
	private String smLike;
	private String smPtoho;
	private String smSoldoutYn;
	private String smBasket;
	private String smPurchaseYn;
	private String smBrand;
	private String smDeliveryYn;
	private String smPayment;
	
	public String getSmSeq() {
		return smSeq;
	}
	public void setSmSeq(String smSeq) {
		this.smSeq = smSeq;
	}
	public String getSmTitle() {
		return smTitle;
	}
	public void setSmTitle(String smTitle) {
		this.smTitle = smTitle;
	}
	public String getSmCont() {
		return smCont;
	}
	public void setSmCont(String smCont) {
		this.smCont = smCont;
	}
	public String getSmRgstDt() {
		return smRgstDt;
	}
	public void setSmRgstDt(String smRgstDt) {
		this.smRgstDt = smRgstDt;
	}
	public String getSmRgstId() {
		return smRgstId;
	}
	public void setSmRgstId(String smRgstId) {
		this.smRgstId = smRgstId;
	}
	public String getSmRvseDt() {
		return smRvseDt;
	}
	public void setSmRvseDt(String smRvseDt) {
		this.smRvseDt = smRvseDt;
	}
	public String getSmRvstId() {
		return smRvstId;
	}
	public void setSmRvstId(String smRvstId) {
		this.smRvstId = smRvstId;
	}
	public String getSmUseYn() {
		return smUseYn;
	}
	public void setSmUseYn(String smUseYn) {
		this.smUseYn = smUseYn;
	}
	public String getSmAtchFileId() {
		return smAtchFileId;
	}
	public void setSmAtchFileId(String smAtchFileId) {
		this.smAtchFileId = smAtchFileId;
	}
	public String getSmReview() {
		return smReview;
	}
	public void setSmReview(String smReview) {
		this.smReview = smReview;
	}
	public String getSmStar() {
		return smStar;
	}
	public void setSmStar(String smStar) {
		this.smStar = smStar;
	}
	public String getSmCategory() {
		return smCategory;
	}
	public void setSmCategory(String smCategory) {
		this.smCategory = smCategory;
	}
	public String getSmLike() {
		return smLike;
	}
	public void setSmLike(String smLike) {
		this.smLike = smLike;
	}
	public String getSmPtoho() {
		return smPtoho;
	}
	public void setSmPtoho(String smPtoho) {
		this.smPtoho = smPtoho;
	}
	public String getSmSoldoutYn() {
		return smSoldoutYn;
	}
	public void setSmSoldoutYn(String smSoldoutYn) {
		this.smSoldoutYn = smSoldoutYn;
	}
	public String getSmBasket() {
		return smBasket;
	}
	public void setSmBasket(String smBasket) {
		this.smBasket = smBasket;
	}
	public String getSmPurchaseYn() {
		return smPurchaseYn;
	}
	public void setSmPurchaseYn(String smPurchaseYn) {
		this.smPurchaseYn = smPurchaseYn;
	}

	
	public String getSmDeliveryYn() {
		return smDeliveryYn;
	}
	public void setSmDeliveryYn(String smDeliveryYn) {
		this.smDeliveryYn = smDeliveryYn;
	}
	public String getSmPayment() {
		return smPayment;
	}
	public void setSmPayment(String smPayment) {
		this.smPayment = smPayment;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSmBrand() {
		return smBrand;
	}
	public void setSmBrand(String smBrand) {
		this.smBrand = smBrand;
	}
	
	
	
	
	
}