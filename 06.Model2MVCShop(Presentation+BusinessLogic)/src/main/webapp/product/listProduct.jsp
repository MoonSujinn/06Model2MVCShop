<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
<%@ page import="java.util.List"  %>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
   List<Product> list= (List<Product>)request.getAttribute("list");
   Page resultPage=(Page)request.getAttribute("resultPage");
   
   Search search = (Search)request.getAttribute("search");
   //==> null 을 ""(nullString)으로 변경
   String searchCondition = CommonUtil.null2str(search.getSearchCondition());
   String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>

<%
   String menu = request.getParameter("menu");
   String title = null;

      if(menu.equals("manage")){
         title="상품관리";
      }else{
         title="상품 목록조회";
      }
%>
--%>





<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
<!--
   // 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
   function fncGetUserList(currentPage) {
      document.getElementById("currentPage").value = currentPage;
         document.detailForm.submit();      
   }
-->
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=search" method="post">

<table width="100%" height="37" border="0" cellpadding="0"   cellspacing="0">
   <tr>
      <td width="15" height="37">
         <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
      </td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">
               
                     상품 목록조회
               
               </td>
            </tr>
         </table>
      </td>
      <td width="12" height="37">
         <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td align="right">
         <select name="searchCondition" class="ct_input_g" style="width:80px">
            <%-- 
            <option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
            <option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>
            <option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>가격</option>
            --%>
            <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
            <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
            <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
         </select>
         <input    type="text" name="searchKeyword" 
         				value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
         				class="ct_input_g" style="width:200px; height:20px" >
      </td>
      <td align="right" width="70">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
               </td>
               <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
                  <a href="javascript:fncGetUserList('1');">검색</a>
               </td>
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td colspan="11" >전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
   </tr>
   <tr>
      <td class="ct_list_b" width="100">No</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">상품명</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">가격</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">등록일</td>   
      <td class="ct_line02"></td>
      <td class="ct_list_b">현재상태</td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="808285" height="1"></td>
   </tr>
   
   <%-- 
    <%    
      int no=list.size();
      for(int i=0; i<list.size(); i++) {
         Product vo = (Product)list.get(i);
   %>

   
   
   <tr class="ct_list_pop">
      <td align="center"><%=no%></td>
      <td></td>
            
      <c:if test= "${menu==manage}" >
            
           <td align="left"><a href="/updateProductView.do?prodNo=${product.prodNo}">${product.prodName}</a>
           </td>
            
       		<c:if test= "${menu==search}" >
          
            	<td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}">${product.prodName}</a>
            	</td>
            </c:if>
      </c:if>
          
      
      <td></td>
      <td align="left"><%= vo.getPrice() %></td>
      <td></td>
      <td align="left"><%= vo.getRegDate() %></td>
      <td></td>
      <td align="left"><%= vo.getProTranCode() %></td> 
        
   </tr>
   <tr>
      <td colspan="11" bgcolor="D6D7D6" height="1"></td>
   </tr> 
   <% } %>
 </table> 
  --%>
  
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			
			<c:if test= "${param.menu=='manage'}" >
            	<td align="left"><a href="/updateProductView.do?prodNo=${product.prodNo}">${product.prodName}</a></td>
      		</c:if>
      		
      		<c:if test= "${param.menu!='manage'}" >
          			<td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}">${product.prodName}</a></td>
            </c:if>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left">
			<c:if test= "${param.menu=='search'}" >
				<c:if test= "${product.proTranCode.trim()=='0'}" >
				 	판매중				
				</c:if>
				<c:if test="${product.proTranCode.trim()!='0'}">
					재고없음
				</c:if>
			</c:if>
			<c:if test= "${param.menu!='search'}" >
				<c:if test="${product.proTranCode.trim()=='0'}">
					판매중
				</c:if>
				<c:if test="${product.proTranCode.trim()=='1'}">
					구매완료&nbsp;<a href="/updateTranCode.do?prodNo=${product.prodNo}&tranCode=2">배송하기</a>
				</c:if>
				<c:if test="${product.proTranCode.trim()=='2'}">
					배송중
				</c:if>
				<c:if test="${product.proTranCode.trim()=='3'}">
					배송완료
				</c:if>
			</c:if>			
			</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>  
 

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td align="center">
        <input type="hidden" id="currentPage" name="currentPage" value=""/>
        <%-- 
         <% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
               ◀ 이전
         <% }else{ %>
               <a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
         <% } %>

         <%   for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){   %>
               <a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
         <%    }  %>
   
         <% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
               이후 ▶
         <% }else{ %>
               <a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
         <% } %>
         --%>
         
         <jsp:include page="../common/pageNavigator.jsp"/>	
         
       </td>
   </tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>