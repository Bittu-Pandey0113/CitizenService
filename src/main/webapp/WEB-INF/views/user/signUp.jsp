 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

<%-- <c:if test="${not empty successPwdChangeMsg}">
	<script>
		alert("${successPwdChangeMsg}");  
	</script>
</c:if> 
<c:if test="${not empty failurePwdChangeMsg}">
	<script>
		alert("${failurePwdChangeMsg}");  
	</script>
</c:if> 
 --%>
<head>
	<title> Citizen Service Portal</title> 
	<h1>
<span style="font-size:50px; font-weight:bold;color: Orange">WELCOME TO <br>CITIZEN SERVICE PORTAL</span></h1>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Classic Sign In Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png">  
	
	<link rel="stylesheet" href="${contextPath}/static/login/css/bootstrap.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${contextPath}/static/login/css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${contextPath}/static/login/css/fontawesome-all.css">
	
</head>
<body>
	  
	
	<div class="sub-main-w3">
		<form action="${contextPath}/addSignUpUser.htm" id="userSignup" method="post">    
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                 
			
			<label style="font-size:30px;font-weight:bold;color:Chartreuse">
					<b><u>SIGN UP HERE</u></b>
				</label>
			<div class="row">					
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-12" for="schemeName">Name</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="name" name="name" maxlength="500"> 
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">User Name</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="userName" name="userName" maxlength="20" onchange="userNameValidation(this.value)"> 
								</div>
							</div>
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Password</label>
								<div class="col-md-10">
									<input type="password" class="form-control" id="password" name="password" maxlength="30"> 
								</div>
							</div>
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Confirm Password</label>
								<div class="col-md-10">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" maxlength="30"> 
								</div>
							</div>
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Mobile Number</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="mobileNumber" name="mobileNumber" maxlength="10" onkeypress="validateNumber();"> 
								</div>
							</div>
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Email Id</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="emailId" name="emailId" maxlength="100"> 
								</div> 
							</div>
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Address</label> 
								<div class="col-md-10">
									<textarea name="address" rows="2" cols="20" id="address" tabindex="2" class="form-control" maxlength="500"></textarea>                    
								</div> 
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label style="color:Aqua"class="col-md-10" for="schemeDescription">Remark</label> 
								<div class="col-md-10">
									<input type="text" class="form-control" id="remark" name="remark" maxlength="100"> 
								</div> 
							</div>
						</div>
						<div class="col-md-12">
							<div class="text-center">
<!-- 								<input type="button" name="signIn" value="SignIn" id="signIn" class="btn btn-success" onclick="saveUser();">&nbsp;&nbsp; 
 -->								<%-- <a href="${contextPath}/login" type="button" class="btn btn-warning">Back</a> --%> 
                             <input type="submit" name="signIn" value="SignIn" id="signIn" class="btn btn-success">
							</div> 
						</div>
			
			</div>
			
			
			
			<!-- //switch -->
			<!-- <input type="submit" value="Log In" onclick="login();">  -->
		</form>
	</div>
	
</body>

<!-- <script>
	function login(){	
		var loginUserName = $("#loginUserName").val();  
		if(loginUserName == ""){ 
        	alert("Please Enter User Name");  
        	return false;
        }
        var loginPassword = $("#loginPassword").val(); 
        if(loginPassword == ""){ 
        	alert("Please Enter Password"); 
        	return false;
        }  
		$("#userLogin").submit();  
	} 
</script> -->

<!-- <script>
	function saveUser() {
		var email = $("#emailId").val(); 
		var role = $("#roleId").val(); 
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val(); 
		if ($("#name").val() == "") {
			bootbox.alert("Please Enter Name");
			return false;
		}
		else if ($("#userName").val() == "") {
			bootbox.alert("Please Enter User Name");
			return false;
		}	
		else if ($("#password").val() == "") {
			bootbox.alert("Please Enter Password");
			return false;
		}	
		else if ($("#confirmPassword").val() == "") {
			bootbox.alert("Please Enter Confirm Password");
			return false;
		}	
		else if (password != confirmPassword) { 
			bootbox.alert("Password Mismatch"); 
			$("#password").val("");
			$("#confirmPassword").val("");  
			return false;
		} 
		else if ($("#mobileNumber").val() == "") {
			bootbox.alert("Please Enter Mobile Number");
			return false;
		}	
		else if ($("#emailId").val() == "") {
			bootbox.alert("Please Enter Email Id");
			return false;
		}	
		else if (!ValidateEmail(email)) { 
            return false;
        } 
		else if(role.length == 0 || role == "0"){ 
        	bootbox.alert("Please Choose Role");  
        	return false;
        }  
		else if ($("#address").val() == "") {
			bootbox.alert("Please Enter Address");
			return false;
		}	
        else if ($("#remark").val() == "") {
			bootbox.alert("Please Enter Remark");
			return false;
		}	
		else
		{
			bootbox.confirm("Do you want to signin to the portal ?",
		    function(result) {
		       if (result == true) {
		          $("#addSignUpUser").submit();
		       }
		    }); 
		}
	}
</script> -->
<!-- <script>
	function userNameValidation(){ 
		var userName = $("#userName").val();
		$.ajax({
			type : "GET",
			url : "validate-user-name.htm",
			data : {
				"userName" : userName,
			},
			success : function(response) {
				var val = JSON.parse(response); 
				if (val[0].duplicateUserName == "User Having This Name Is Already Exist") {
					bootbox.alert("User Having This Name Is Already Exist"); 				
					$("#userName").val("");   
				}  
			}, 
			error : function(error) {
				//alert("Failure");
			} 
		});
	} 
</script>   -->
<script>
	$(function() {	
		$('#name').keydown(function (e) {	  
			if (e.ctrlKey || e.altKey) {	    
				e.preventDefault();	      
			} else {	    
				var key = e.keyCode;	      
				if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {	      
					e.preventDefault();	
				} 
			}	
		});         
	});	
	function validateNumber() { 
		if((event.keyCode<48 || event.keyCode>57))
		{
			event.returnValue = false;
		} 
	}  
	function ValidateEmail(email) {
	    if (email != "") {
	        var reg = /^[A-Za-z0-9]([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
	        if (!reg.test(email)) {
	        	bootbox.alert('Enter a valid email id'); 
	            return false;
	        }
	        else
	            return true;
	    }
	    else
	        return true;
	}; 
</script>
 