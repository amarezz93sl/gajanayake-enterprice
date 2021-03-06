<%-- 
    Document   : AddInsuranceCompany
    Created on : Jul 29, 2015, 4:26:24 AM
    Author     : windya yasas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%@include file="content.jsp" %>

<%@include file="DB_Connector.jsp"%>  

</head>
<body class="page page-id-39 page-template-default no-fittext basic">

	<div id="page">

		<header id="header">
			<%@include file="header.jsp" %>
<!-- #site-navigation -->


<script>
    
$(document).ready(function() {
    
       $('#infrm #plcmp').bind('input', function(){
        
       var tmp;
        
       $.ajax({type:    'POST',
                 url:     'InCmpList.jsp',
                 cache:   false,
                 success: function(data){
                     tmp = data.split("|");
                     for(var x=0;x<tmp.length;x++)
                     {
                         
                         tmp[x]= $.trim(tmp[x]);
                         
                         
                     }
                    $( "#plcmp" ).autocomplete({
                        minLength:1,
               source: tmp
            });
                    
                 }
                });
        
        

            
            
  
  
});
    
    

    // process the form
    $('#infrm').submit(function(event) {


    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
  
    
  
	var request =  $.ajax({
	    type: "POST",
	    url: formURL,
	    data: postData
	  });
          
          
          
          request.done(function( msg ) {
 if(msg.indexOf("ok") >= 0){
     
     
     $("#msg").text("Insurance Policy Updated.");
     
      $(function() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
          
          
          location.replace("ViewPlans.jsp");
          
          
          
          
        }
      }
    });
  });
    
    
     
     
     
 }
 
 else
 {
     $("#msg").text("Insurance Policy Not Updated.\n"+msg);
      $(function() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  });
     
 }
 
 
 
 
 
 
 
});
          
          
	 
  
  
  
         event.preventDefault();
    });

});
  


</script>

			 <div class="title-card-wrapper">
               
			</div>

		</header>

		<main>
                    <br>
	<div class="container">
            
            
            
      <div id="dialog-message" >
          <p id="msg">
		
	</p>
	
</div>
            
            
      
            
            
            
            
            
            
            
		<div class="row">

<div id="primary" class="col-md-8 pull-left hfeed">
									<!-- #post-39 -->

					
<div id="comments" class="comments-area">
<article id="post-39" class="post-39 page type-page status-publish hentry xfolkentry">
						

					    <!-- .entry-content -->

					    		
<h1 class="entry-title">Edit Leasing Plan</h1>
<footer class="clearfix">
	    	</footer><!-- .entry -->
</article>
<div id="respond" class="comment-respond">
    
    <form  id="infrm"  action="EditPlan1.jsp" method="POST" class="comment-form" >
        
        
        
        <%  ResultSet rs;
 String id=request.getParameter("id");
 Statement stmt = conn.createStatement();
 String sql="select p.PlanID,p.Name,p.NoOfyears,p.LeasingID,p.minDownPayment,p.rate,c.LeasingID,c.Name as Name_ from leasingplans p,leasingcompany c where p.LeasingID=c.LeasingID and p.PlanID = '"+id+"' ";
 
 
 
 
 rs = stmt.executeQuery(sql);  %> <% while(rs.next()) {%>
        
        

 <input   type='hidden' id="id"  value="<%=rs.getString("PlanID")%>"   name="id_">
  <p>
            
            <label for="plcmp">Leasing Company </label> 
      <input type="text" id="plcmp" name="plcmp" value="<%=rs.getString("Name_")%>" size="40" aria-required="true" required placeholder="Enter the Company Name">
        </p>
        
        
        
<p ><label for="plname">Name </label> 
<input  type="text" id="plname"  value="<%=rs.getString("Name")%>"  size="40" aria-required="true" name="plname" required placeholder="Enter the Plan Name"></p>



<p ><label for="down">Minimum DownPayment</label> 
    <input  type="number" id="down" value="<%=rs.getString("minDownPayment")%>"   min="1.00" size="40" aria-required="true" name="down" required placeholder="Enter the Value"></p>



<p ><label for="value_">No Of Years</label> 
    <input  type="number" id="value_" value="<%=rs.getString("NoOfyears")%>"  min="1.00" size="40" aria-required="true" name="year_" required placeholder="Enter the Value"></p>

<p ><label for="value_">Rate</label> 
    <input  type="number" id="value_"  value="<%=rs.getString("rate")%>"  min="1.00" size="40" aria-required="true" name="rate_" required placeholder="Enter the Value"></p>


<p class="form-submit">
    <input type="submit" class="submit" value="Update Plan">
</p>	

<%}%>


</form>
							</div><!-- #respond -->
			</div><!-- #comments .comments-area -->			</div>
			
						</div>
	</div>

	</main><!-- main -->
        <%@include file="footer.jsp" %>
</div><!-- #page -->



</body></html>
