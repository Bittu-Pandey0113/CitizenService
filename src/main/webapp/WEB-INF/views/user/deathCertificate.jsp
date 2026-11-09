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
       <span style="font-size:20px; font-weight:bold">DEPARTMENT OF HEALTH AND FAMILY WELFARE MUNCIPALITY</span>
       <br><br>
       <span style="font-size:30px; font-weight:bold;color: red"> DEATH CERTIFICATE</span>
       <br><br>
       <span style="font-family:corier; font-size:23px"><i>Issued under section 12/17 of the registration of births and deaths act,1969 and rule 8/13 of the odisha registration of births and deaths rules 2001. </i></span>
       <br><br>
       <span style="font-family:corier; font-size:23px"><b><i>This is to certify that the following information has been taken from the original record of death which is the register for MUNICIPAL COUNCIL of district</i> <b><ins><code>${deathCertificate.dist}</code></ins></b> <i>of state of</i> <b><ins><code>${deathCertificate.state}</code></ins>.</b></span>
       

       <table align="left" style="font-size:17px">
       	<br><br><br><tr>
       		<td align="left"><i><b>NAME OF DECEASED:</i></b> <b><ins><code>${deathCertificate.deceasedName }</code></ins></i></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>SEX:</i></b><b><ins><code>${deathCertificate.gender}</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>DATE OF DEATH:</i></b> <b><ins><code>${deathCertificate.deathDate}</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>PLACE OF DEATH:</i></b><br> <b><ins><code>${deathCertificate.deathPlace}</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>REGISTRATION NO:</i></b> <b><ins><code>10023004${deathCertificate.deathCertificateApplicationId}</code></ins></b></td>
       	</tr>
       	<!-- <tr>
       		<td><b>Date Of Registration......</b></td>
       	</tr> -->
   
       	
       
       </table>
        <table align="right" style="font-size:17px">
       <tr>
       		<td align="right"><b><i>NAME OF FATHER/HUSBAND:</i></b><br> <b><ins><code>${deathCertificate.fName}</code></ins></b></td>
       	</tr>
       <%-- 	 	<tr>
       		<td><b>NAME OF FATHER.................................:${deathCertificate. }</b></td>
       	</tr>
       	 	<tr>
       		<td><b>NAME OF MOTHER.................................:${deathCertificate. }</b></td>
       	</tr> --%>
       	 	<tr>
       		<td ><b><i>PERMANENT ADDRESS:</i></b><br> <b><ins><code>${deathCertificate.address}</code></ins></b></td>
       	</tr>
       	<!-- <tr>
       		<td><b>DATE OF ISSUE......</b></td>
       	</tr> -->
       	
       	 </table><br><br><br>
        <table align="right" style="font-size:20px">
       
       <br><br><br><br><br><br><br><tr>
       		<td><b>Signature of Authority with Stamp</b></td>
       	</tr>
       </table>
        <table align="left" style="font-size:15px">
       
       <tr>
       		<td align="left"><b>Place:<i><code>${deathCertificate.dist}</code></i></b></td>
       	</tr>
       	 <tr>
       		<td align="left"><b>Date:<i><code>12/02/2020</code></i></b></td>
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