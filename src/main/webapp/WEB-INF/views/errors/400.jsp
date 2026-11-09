<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<div class="page-navigator">
        <div class="black-div">
        </div>
    </div>
    <!--Page navigator-->
    <div class="errorpage_con">
    	<div class="error_contents">
    		<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
    		<h1>OOPS!</h1>
    		<p>Seems your request is not good .......</p>
    		<a href="${contextPath}/">Back to Home</a>
    	</div>
    </div>
    
 
