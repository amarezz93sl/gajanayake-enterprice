 <%-- 
    Document   : AddCustomer
    Created on : Jun 30, 2015, 7:21:36 AM
    Author     : windya yasas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="content.jsp" %>

<script type="text/javascript" src="validateScript.js"></script>
<script>
function xmlhttpPost(field)
{ 
var xmlHttpReq = false; 
var self = this; 

// Mozilla/Safari 
if (window.XMLHttpRequest) { 
self.xmlHttpReq = new XMLHttpRequest(); 
} 
// IE 
else if (window.ActiveXObject) { 
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
} 
self.xmlHttpReq.open('POST', "Addcustomer1.jsp", false); 
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
self.xmlHttpReq.onreadystatechange = function()
{
    
    if (self.xmlHttpReq.readyState != 4 && self.xmlHttpReq.status == 200)
 {
     document.getElementById(field).innerHTML = "Validating..";
 }
  else if (self.xmlHttpReq.readyState == 4)
  { 
     updatepage(field,self.xmlHttpReq.responseText); 
  } 
}
var word1 ='fname='+ escape( document.getElementById('fname').value);
var word2 ='lname='+ escape( document.getElementById('lname').value);
var word3 ='nic='+ escape( document.getElementById('nic').value);
var word4 ='Address='+ escape( document.getElementById('Address').value);
var word5 ='BDay='+ escape( document.getElementById('BDay').value);
var word6 ='tel='+ escape( document.getElementById('tel').value);
var word7 ='email='+ escape( document.getElementById('email').value);
var word8 ='role='+escape('Customer');
var word9 ='ufile='+ escape( document.getElementById('ufile').value);


var the_data =word1 +'&'+ word2+'&'+ word3+'&'+ word4+'&'+ word5+'&'+ word6+'&'+ word7+'&'+ word8+'&'+ word9;
self.xmlHttpReq.send(the_data); 






}




function updatepage(field,str){ 
document.getElementById(field).innerHTML = str;
alert("Successfully Updated");

} 

</script>

</head>
<% if(session.getAttribute("noti").toString()== "yes")
{
    %><%="<body class='page page-id-39 page-template-default no-fittext basic' onload='JavaScript:noti()'>"%><%
}
else
{
    %><%="<body class='page page-id-39 page-template-default no-fittext basic'>"%><% 
}
session.setAttribute("noti","No");
%>	<div id="page">

		<header id="header">
			<%@include file="header.jsp" %>
<!-- #site-navigation -->

			 <div class="title-card-wrapper">
               
			</div>

		</header>
<form method="POST"    class="comment-form" onsubmit='JavaScript:xmlhttpPost("success")'>

		<main>
                    
                    <br>
	<div class="container">
		<div class="row">

<div id="primary" class="col-md-8 pull-left hfeed">
									<!-- #post-39 -->

					
<div id="comments" class="comments-area">
<article id="post-39" class="post-39 page type-page status-publish hentry xfolkentry">
						<h1 class="entry-title">Add Customer</h1>

					    <!-- .entry-content -->

					    	<footer class="clearfix">
	    	</footer><!-- .entry -->
					</article>	
	
<div id="respond" class="comment-respond">


							
<p ><label for="author">First Name </label> 
<input  type="name" id="fname"  size="70" aria-required="true" onblur='JavaScript:xmlhttpVPost("fname1","fname","Addcustomervalidate.jsp")' name="fname" required placeholder="Enter the First name"><div class="val" id="fname1"></div></p>
<p ><label for="author">Last Name </label> 
    <input  type="name" id="lname"  size="70" aria-required="true" onblur='JavaScript:xmlhttpVPost("lname1","lname","Addcustomervalidate.jsp")' name="lname" required placeholder="Enter the  Last name"><div class="val" id="lname1"></div></p>

<p ><label for="author">NIC no</label> 
<input id="nic" type="name"  size="70" aria-required="true" name="nic" onblur=' JavaScript:xmlhttpVPost("nic1","nic","Addcustomervalidate.jsp")' required placeholder="Enter the NIC no"><div class="val" id="nic1"></div></p>
<p ><label for="author">Address </label> 
 <textarea rows="4" aria-required="true" name="Address" id="Address" onblur=' JavaScript:xmlhttpVPost("Address1","Address","Addcustomervalidate.jsp")' required placeholder="Enter the Address"></textarea></p><div class="val" id="Address1"></div></p>
<p ><label for="author">Date Of Birth </label> 
<input   type="date"  size="70" aria-required="true" id="BDay" name="BDay" onblur=' JavaScript:xmlhttpVPost("BDay1","BDay","Addcustomervalidate.jsp")' required placeholder="Enter the DoB"><div class="val" id="BDay1"></div></p>
<p><label for="author">Phone no</label> 
<input  type="number"  size="70" aria-required="true" min="1.00" name="tel" id="tel" onblur=' JavaScript:xmlhttpVPost("tel1","tel","Addcustomervalidate.jsp")' required placeholder="Enter the Telephone number"><div class="val" id="tel1"></div></p>
<p ><label for="author">Email</label> 
<input id="email" type="email"  size="70" aria-required="true" name="email" onblur=' JavaScript:xmlhttpVPost("email1","email","Addcustomervalidate.jsp")' required placeholder="Enter the Email Address"></p><div class="val" id="email1"></div>

<p class="form-submit">
        <input type="submit"  class="submit"  value="Add Customer"> 
       <!-- -->
<div id="success" style="color:green"></div>
</p>


							</div><!-- #respond -->
			</div><!-- #comments .comments-area -->			</div>
			
				<div id="secondary" class="col-md-4" role="complementary">
<article id="post-39" class="post-39 page type-page status-publish hentry xfolkentry">
						<h3>Upload Customer image </h3>

					    <!-- .entry-content -->

					    	<footer class="clearfix">
	    	</footer><!-- .entry -->
					</article>
<aside id="search-2" class="widget widget_search">
<div id="upload-area">
   
	<div id="preview" style="padding:10px">
		<img width="400px" height="400px" src="Images/User.jpg" id="thumb">
	</div>

	
		
                <p><input type="file" size="20" id="ufile" name="ufile" ></p>
                <p class="form-submit">
		
                </p>

    <p style="color: red">Optional * </p>
</div>

</aside>

</div><!-- #secondary.widget-area -->		</div>
	</div>
        
	</main><!-- main -->
        </form>
        
        <%@include file="footer.jsp" %>
</div><!-- #page -->



</body></html>
