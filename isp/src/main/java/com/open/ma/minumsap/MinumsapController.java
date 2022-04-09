package com.open.ma.minumsap;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.minumsap.service.MinumsapVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MinumsapController {  /** @Controller로 등록된 클래스 파일에 대한 bean 자동생성*/

	@Resource(name = "cmmnService") /** @Resource는 이름으로 자원 자동연결 */ 
    protected CmmnService cmmnService; 
	
	@Resource(name = "FileMngService") 
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService") /** 공통 인터페이스 클래스 설정 */ 
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties") /** 공통 파일업로드 클래스 설정 */ 
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;  /** model과 view json형식으로 반환 */ 
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Minumsap"; 
    /** DB쿼리문 실행할 때 필요한 id값 세팅-- sql.xml 파일 mapper namespace 동일해야함!!  */

    /** folderPath **/

    private final static String folderPath = "/ma/book/minumsap/"; /** 상위 폴더 경로를 folderPath로 지정*/

    @Autowired
	private EhCacheCacheManager cacheManager; /** 캐시 사용 클래스 설정 */ 
    
	Logger log = Logger.getLogger(this.getClass());
	

	/**
	 * 게시판 관리 화면 조회 
	 * @param searchVO 검색조건
	 * @param model
	 * @return "content/contentList"
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list"; /** .mLayout : tiles로 지정해둔 layout tiles-defs.xml 사용 */
	}
	
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		searchVO.setPageUnit(5);  /**페이지당 게시물수 */
		searchVO.setPageSize(10);  /**한번에 노출되는 페이지수 */


		/** pageing setting 페이징 세팅 */
		PaginationInfo paginationInfo = new PaginationInfo();   /* 페이징처리 클래스 객체 생성  */
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); 
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); 
		paginationInfo.setPageSize(searchVO.getPageSize()); 
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID ); /** 쿼리에서 전체 건수 가져와 페이징 처리 */
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		 /** 리스트 쿼리 실행(태그 id값으로 매칭)*/
		List<MinumsapVO> resultList = (List<MinumsapVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList); /**  model로 넘김 */
		
		return folderPath + "addList";
	}


	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") MinumsapVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		MinumsapVO minumsapVO = new MinumsapVO();
		minumsapVO = (MinumsapVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("minumsapVO", minumsapVO);
		
		return ".mLayout:"+ folderPath + "view";
	}

	/**
	 * 메뉴권한 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do") /*procType : 업무구분*/
	public String form(@ModelAttribute("searchVO") MinumsapVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		MinumsapVO minumsapVO = new MinumsapVO();
		if (procType.equals("update")) {
			minumsapVO = (MinumsapVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		
		model.addAttribute("minumsapVO", minumsapVO);

		return ".mLayout:"+ folderPath + "form";
	}

	/**
	 * 메뉴권한 처리
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") MinumsapVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		if(procType != null){
			
			if(procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID );
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
			} 
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "miSeq");	
				model.addAttribute("pValue", searchVO.getMiSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("delete") ){
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else{
	    		return "redirect:list.do";
	    	}
		}

		return "redirect:list.do";

	}
	


	
		

}
