<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>  <%--  번호5 / 책 이름 / 작가5 / 출판사5 / 별점5 / 전자책유무5 / 가격 10/ 좋아요5   --%>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:5%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject  lengthCut"  >책 이름</th>
				<th scope="col">작가</th>
				<th scope="col">출판사</th>
				<th scope="col">별점</th>
				<th scope="col">E-BOOK</th>
				<th scope="col">가격</th>
				<th scope="col">좋아요</th>
			</tr>
		</thead>
		
		
		<tbody>
			<c:choose>  <%--  번호5 / 책 이름 / 작가5 / 출판사5 / 별점5 / 전자책유무5 / 가격 10/ 좋아요5   --%>
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.alSeq}','alSeq')">
							<td>  ${paginationInfo.totalRecordCount+1- ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}  </td>
							<td class="subject"><span class=" lengthCut">${result.alTitle }</span></td>
							<td>${result.alWriter }</td>
							<td>${result.alPublishing }</td>
							<td>${result.alStar }</td>
							<td>${result.alEbookYn }</td>
							<td>${result.alPrice }</td>
							<td>${result.alLike }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="8" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>