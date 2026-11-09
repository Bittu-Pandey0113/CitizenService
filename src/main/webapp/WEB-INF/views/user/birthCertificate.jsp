
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
       <span style="font-size:30px; font-weight:bold;color: red">BIRTH CERTIFICATE</span>
       <br><br>
       <span style="font-family:corier; font-size:24px"><i>Issued under section 12/17 of the registration of births and deaths act,1969 and rules of odisha birth and deaths rules 2001. </i></span>
       <br><br>
       <span style="font-family:corier; font-size:23px"><b><i>This is to certify that the following information has been taken from the original record of birth which is register for   MUNICIPAL COUNCIL  <%-- of Tahsil..${birthCertificate.fName }.. --%>of district </i></b> <i><code> ${birthCertificate.dist } </code></i><b><i>of state of </i></b> <i><code> ${birthCertificate.state }</code></i>.</span>

       <table align="left" style="font-size:17px">
       	<br><br><br><tr>
       		<td align="left"><b><i>Name :</i></b><b><ins><code>${birthCertificate.childName }</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>Sex :</i></b> <b><ins><code>${birthCertificate.gender }</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>Date Of Birth :</i></b> <b><ins><code>${birthCertificate.dob }</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="left"><b><i>Place of Birth :</i></b> <b><ins><code>${birthCertificate.birthPlace }</code></ins></b></td>
       	</tr>
       
       	<%-- <tr>
       		<td><b>Date Of Registration ................</b></td>
       	</tr> --%>
       	<%-- <tr>
       		<td><b>Date Of Issue ................</b></td>
       	</tr> --%>
       	
       
       </table>
        <table align="right" style="font-size:17px">
       	<tr>
       		<td align="right"><b><i>Name of Father :</i></b> <b><ins><code>${birthCertificate.fName }</code></ins></b></td>
       	</tr>
       		<tr>
       		<td align="right"><b><i>Name of Mother :</i></b> <b><ins><code> ${birthCertificate.mName }</code></ins></b></td>
       	</tr>
       	<tr>
       		<td align="right"><b><i>Permanent address :</i></b> <br> <b><ins><code>${birthCertificate.address }</code></ins></b></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><b><i>Registration No :</i></b>  <b><ins><code>0000000${birthCertificate.birthCertificateApplicationId }</code></ins></b></td>
       	</tr>
       	
   
      </table><br><br><br>
        <table align="right" style="font-size:20px">
       
       <br><br><br><br><br><br><br><tr>
       		<td><b>Signature of Authority with Stamp</b></td>
       	</tr>
       </table>
        <table align="left" style="font-size:15px">
       
       <tr>
       		<td align="left"><b>Place:</b><b><i><code>${birthCertificate.dist }</code></i></b></td>
       	</tr>
       	 <tr>
       		<td align="left"><b>Date:<i><code>12/02/2020</code></i></b></td>    		
       	</tr>
       </table>
      <!-- <script align="left">
       		n=new Date();
            d=n.getDate()+"/"+(n.getMonth()+1)+"/"+n.getFullYear();
            document.write("<h5>Date:  "+d+"</h5>");
            </script> -->
     
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
