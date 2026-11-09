
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
  
	<center>
	<div style="width:900px; height:700px; padding:20px; text-align:center; border: 10px solid #787878">
<div style="width:850px; height:650px; padding:20px; text-align:center; border: 5px solid #787878">
       <span style="font-size:50px; font-weight:bold;color: green">CITIZEN SERVICE PORTAL</span>
       <br><br>
       <span style="font-size:20px; font-weight:bold">DEPARTMENT OF HEALTH AND FAMILY WELFARE</span>
       <br><br>
       <span style="font-size:30px; font-weight:bold;color: red">MARRIAGE CERTIFICATE</span>
       <br><br>
       <span style="font-family:corier; font-size:25px"><i>Issued under section 13/17 of the registration of marriage act,1969 and rules of odisha marriage rules 2006. </i></span>
       <br><br><br>
       <span style="font-family:corier; font-size:22px"><i>This is to certify that Shri </i> <b><ins><code>${marriageCertificate.groomName}</code></ins></b>
       <i>Son of Mr./Mrs. </i> <b><u><code>${marriageCertificate.groomFather}</code></u></b><i> residing at </i><b><u><code>${marriageCertificate.groomAddress}</code></u></b> <i>and Mrs </i><b><u><code>${marriageCertificate.brideName}</code></u></b> 
      <i> Daughter of Mr./Mrs. </i> <b><u><code>${marriageCertificate.brideFather}</code></u></b><i> residing at </i> <b><u><code>${marriageCertificate.brideAddress}</code></u></b> 
       have furnished the particula in Memorandum declaring that their marriage has been solemnioed on </i> <b><u><code>${marriageCertificate.marriageDate}</code></u></b> at <b><u><code>${marriageCertificate.brideAddress}</code></u></b> <i>and that the same has been registered on </i><b><u><code>${marriageCertificate.marriageDate}</code></u></b> <i>at serial No.</i> <b><u><code>${marriageCertificate.marriageCertificateApplicationId}</code></u></b> <i>of Register of Marriages maintained under the 
       original record of marriage which is register for   MUNICIPAL COUNCIL of District </i><b><u><code>${marriageCertificate.groomDist}</code></u></b> <i>of State of </i><b><u><code>${marriageCertificate.groomState}</code></u>.</b></span><br/><br/>

       <table align="left" style="font-size:18px">
       	<br><br><tr>
       		<td><i>Place:</i> <b><code> ${marriageCertificate.groomDist}</code></b></td>
       	</tr>
       	<tr>
       		<td><i>Date:</i>  <b><code>${marriageCertificate.marriageDate}</code></b></td>
       	</tr>
       	<tr>
       		<td><i>Registration No :</i> <b><code>160002300${marriageCertificate.marriageCertificateApplicationId}</code></b></td>
       	</tr>
       	<%-- <tr>
       		<td><b>Date Of Registration ................</b></td>
       	</tr> --%>
       	<%-- <tr>
       		<td><b>Date Of Issue ................</b></td>
       	</tr> --%>
       	
       
       </table>
        <table align="right" style="font-size:20px">
       
       <br><br><br><tr>
       		<td><b>Signature of Authority with Stamp</b></td>
       	</tr>
       </table>
</div>
</div>
</center>
</body>
</html>
<center>

 		<div class="col-md-12">
  			<div class="text-center">
  			<br><br><span style="font-size:20px; font-weight:bold;color: purple">Click on the Download Button and Download the Certificate.</span>
  			</div> 
  		</div> 
  		<div class="col-md-12">
  			<div class="text-center">
			<br><!-- <input type="download" name="download" value="Download Here" id="downloadbtn" class="btn btn-success" >&nbsp;&nbsp; -->
			<a href="${contextPath}/dashBoard.htm" type="button" class="btn btn-warning">Download</a>  
  			</div> 
  		</div> 
  		<div class="col-md-12">
  			<div class="text-center">
  			<br><br><span style="font-size:20px; font-weight:bold;color: blue">!! THANK YOU !!!! VISIT AGAIN !!</span><br><br><br><br>  
  			</div> 
  		</div> 
</center>
