<%@ page language="java"
        import="javax.naming.*,
        javax.sql.DataSource,
        java.util.ArrayList,
        java.util.Date,
        java.text.DateFormat,
        java.text.SimpleDateFormat,
        java.io.ByteArrayOutputStream,
        java.io.*,
        java.sql.*,
        java.util.*,
        org.pentaho.platform.util.web.SimpleUrlFactory,
        org.pentaho.platform.web.jsp.messages.Messages,
        org.pentaho.platform.engine.core.system.PentahoSystem,
        org.pentaho.platform.uifoundation.chart.DashboardWidgetComponent,
        org.pentaho.platform.web.http.request.HttpRequestParameterProvider,
        org.pentaho.platform.web.http.session.HttpSessionParameterProvider,
        org.pentaho.platform.api.engine.IPentahoSession,
        org.pentaho.platform.web.http.WebTemplateHelper,
        org.pentaho.platform.util.VersionHelper,
        org.pentaho.platform.util.messages.LocaleHelper,
        org.pentaho.platform.engine.services.actionsequence.ActionResource,
        org.pentaho.platform.api.engine.IActionSequenceResource,
        org.pentaho.platform.engine.core.solution.SimpleParameterProvider,
        org.pentaho.platform.uifoundation.chart.ChartHelper,org.pentaho.platform.web.http.PentahoHttpSessionHelper,org.pentaho.platform.engine.services.solution.SolutionHelper"
%>



<%!
public String getTimeStamp() {
   Calendar date = Calendar.getInstance();
   String ts = (date.get(date.MONTH)+1) + "/" +date.get(date.DATE)+ "/" + date.get(date.YEAR)+
                    ":" +date.get(date.HOUR_OF_DAY)
                    +":"+date.get(date.MINUTE)+":"+ date.get(date.SECOND);
   return(ts);
}
%>


<%    
/*
*  Copyright 2008 Breadboard BI, Inc.  All rights reserved.
*
*  Version 2.0 Beta
*
*  This software was developed by Breadboard BI and is provided under license. You may
*  not use this file except in compliance with the license. This software is distributed
*  on an AS IS basis, WITHOUT WARRANTY OF ANY KIND, neither expressed nor implied.
*
*  Please send bug fixes and enhancement requests to submit@breadboardbi.com
*/

/*
 * This JSP is an example of how to combine Breadboard BI content with Pentaho components to build a dashboard.
 * The script in this file controls the layout and content generation of the dashboard.
 * See the Pentho document 'Dashboard Builder Guide' for more details.
 * Ideally, the Java code would be in a class that is imported.  Here, we put the
 * the Java code inline to make it easier to edit and understand.  This example is part of a basic "Model 1" type
 * web application with the Java code directly in the page.
 * It is only intended as a simplified example of making dynamic reports.  
 * As a service to a our clients, we would provide a
 * customized interface, error handling, and security among other features.
 */



// set the character encoding e.g. UFT-8
response.setCharacterEncoding(LocaleHelper.getSystemEncoding());
// create a new Pentaho session
IPentahoSession userSession = PentahoHttpSessionHelper.getPentahoSession( request );




////////////////////////////////////////////////////////////////////
//SET UP PARAMETERS/////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
String temporal_value = ((request.getParameter("temporal_value")!=null)?request.getParameter("temporal_value"):"");
String temporal_cat = ((request.getParameter("temporal_cat")!=null)?request.getParameter("temporal_cat"):"");
String channel = ((request.getParameter("channel")!=null)?request.getParameter("channel"):"");
String category = ((request.getParameter("category")!=null)?request.getParameter("category"):"");
String msgs = "Start Time = " +getTimeStamp();
boolean debugMode = false;
if (request.getParameter("show") != null)
   debugMode = true;

String temporal_week_value =  "";
String temporal_month_value = "";
String temporal_year_value = "";
String temporal_day_value = "";
String temporal_quarter_value = "";
String sql = "";
String sql2 = "SELECT MAX(INVOICE_DATE) AS INVOICE_DATE FROM FACT_BILLING";
// Oracle - String sql2 = "SELECT TO_CHAR(MAX(INVOICE_DATE),'MM-DD-YYYY HH24:MI:SS') AS INVOICE_DATE FROM FACT_BILLING";
String sql3 = "";
int myResolved = 0;
int mySLAcomp = 0;
String exceptionErrors = "";
String title = "Sample Dashboard - Select a channel";
String report_title = "";
String dial_title = "";
if (channel.length() < 1)
   channel = "Web";
if (category.length() < 1)
   category = "Drink";
   dial_title = "Average Invoice Lines for " + channel + " and " + category;

String invoice_date = "";
StringBuffer content_period = new StringBuffer();
StringBuffer content_channel_vert_bar = new StringBuffer();
StringBuffer content_channel_pcat_vert_bar = new StringBuffer();
ByteArrayOutputStream stream_interactive_report = new ByteArrayOutputStream();
StringBuffer content_billing_dial = new StringBuffer();
int avg_trxn_invoice_amt = 0;
Context context = null;
DataSource dataSource = null;
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;







////////////////////////////////////////////////////////////////////
//SET UP SQL QUERY FOR DATABASE/////////////////////////////////////
////////////////////////////////////////////////////////////////////
if (temporal_value.length() < 1) {
   //Uncomment Below - used to accommodate Breadboard BI Test Data
   temporal_cat = "Month of ";
   /*
   Date current_dt = new Date();
   SimpleDateFormat sdf_year = new SimpleDateFormat("yyyy");
   SimpleDateFormat sdf_month = new SimpleDateFormat("MM");
   temporal_value = sdf_year.format(current_dt)+sdf_month.format(current_dt);
   */

   //Comment the line below after uncommenting the four lines above.
   temporal_value = "200604";
}

   title = "Invoices by " + temporal_value + " and " + channel + " and " + category;
   report_title = "Top Invoices by " + temporal_value + " and " + channel + " and " + category;


if (temporal_value.indexOf("W") >= 0) {
   temporal_cat = "Week of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value, "+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM "+
          "DIMENSION_DAY "+
          "WHERE "+
          "WEEK_NAME = ?";      
   sql3 = "SELECT "+
          "ROUND(AVG(F.TRXN_INVOICE_AMT)) AS AVG_TRXN_INVOICE_AMT "+
          "FROM "+
          "FACT_BILLING F, "+ 
          "DIMENSION_PRODUCT P, "+
          "DIMENSION_DAY D, "+ 
          "DIMENSION_SALES_CHANNEL SC "+ 
          "WHERE "+
          "D.WEEK_NAME = ? "+
          "AND SC.SALES_CHANNEL_NAME = ? "+ 
          "AND P.PARENT_PRODUCT_CATEGORY_NAME = ? "+ 
          "AND F.PRODUCT_SK = P.PRODUCT_SK "+ 
          "AND F.INVOICE_DATE_SK = D.DATE_SK "+ 
          "AND F.SALES_CHANNEL_SK = SC.SALES_CHANNEL_SK";          
} else if (temporal_value.indexOf("Q") >= 0) {
   temporal_cat = "Quarter of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value, "+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM "+
          "DIMENSION_DAY "+
          "WHERE "+
          "YEAR_QUARTER_NAME = ?";
   sql3 = "SELECT "+
          "ROUND(AVG(F.TRXN_INVOICE_AMT)) AS AVG_TRXN_INVOICE_AMT "+
          "FROM "+
          "FACT_BILLING F, "+ 
          "DIMENSION_PRODUCT P, "+
          "DIMENSION_DAY D, "+ 
          "DIMENSION_SALES_CHANNEL SC "+ 
          "WHERE "+
          "D.YEAR_QUARTER_NAME = ? "+
          "AND SC.SALES_CHANNEL_NAME = ? "+ 
          "AND P.PARENT_PRODUCT_CATEGORY_NAME = ? "+ 
          "AND F.PRODUCT_SK = P.PRODUCT_SK "+ 
          "AND F.INVOICE_DATE_SK = D.DATE_SK "+ 
          "AND F.SALES_CHANNEL_SK = SC.SALES_CHANNEL_SK";                      
} else if (temporal_value.length() == 6) {
   temporal_cat = "Month of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value, "+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM "+
          "DIMENSION_DAY WHERE MONTH_SK = ?";
	sql3 = "SELECT "+
          "ROUND(AVG(F.TRXN_INVOICE_AMT)) AS AVG_TRXN_INVOICE_AMT "+
          "FROM "+
          "FACT_BILLING F, "+ 
          "DIMENSION_PRODUCT P, "+
          "DIMENSION_DAY D, "+ 
          "DIMENSION_SALES_CHANNEL SC "+ 
          "WHERE "+
          "D.MONTH_SK = ? "+
          "AND SC.SALES_CHANNEL_NAME = ? "+ 
          "AND P.PARENT_PRODUCT_CATEGORY_NAME = ? "+ 
          "AND F.PRODUCT_SK = P.PRODUCT_SK "+ 
          "AND F.INVOICE_DATE_SK = D.DATE_SK "+ 
          "AND F.SALES_CHANNEL_SK = SC.SALES_CHANNEL_SK";                    
} else if (temporal_value.length() == 4) {
   temporal_cat = "Year of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value,"+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM "+
          "DIMENSION_DAY "+
          "WHERE "+
          "YEAR_SK = ?";
	sql3 = "SELECT "+
          "ROUND(AVG(F.TRXN_INVOICE_AMT)) AS AVG_TRXN_INVOICE_AMT "+
          "FROM "+
          "FACT_BILLING F, "+ 
          "DIMENSION_PRODUCT P, "+
          "DIMENSION_DAY D, "+ 
          "DIMENSION_SALES_CHANNEL SC "+ 
          "WHERE "+
          "D.YEAR_SK = ? "+
          "AND SC.SALES_CHANNEL_NAME = ? "+ 
          "AND P.PARENT_PRODUCT_CATEGORY_NAME = ? "+ 
          "AND F.PRODUCT_SK = P.PRODUCT_SK "+ 
          "AND F.INVOICE_DATE_SK = D.DATE_SK "+ 
          "AND F.SALES_CHANNEL_SK = SC.SALES_CHANNEL_SK"; 
} else if (temporal_value.length() == 8) {
   temporal_cat = "Day of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value, "+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM DIMENSION_DAY WHERE DATE_SK = ?";
	sql3 = "SELECT "+
          "ROUND(AVG(F.TRXN_INVOICE_AMT)) AS AVG_TRXN_INVOICE_AMT "+
          "FROM "+
          "FACT_BILLING F, "+ 
          "DIMENSION_PRODUCT P, "+
          "DIMENSION_DAY D, "+ 
          "DIMENSION_SALES_CHANNEL SC "+ 
          "WHERE "+
          "D.DATE_SK = ? "+
          "AND SC.SALES_CHANNEL_NAME = ? "+ 
          "AND P.PARENT_PRODUCT_CATEGORY_NAME = ? "+ 
          "AND F.PRODUCT_SK = P.PRODUCT_SK "+ 
          "AND F.INVOICE_DATE_SK = D.DATE_SK "+ 
          "AND F.SALES_CHANNEL_SK = SC.SALES_CHANNEL_SK";
} else {
   temporal_cat = "";
}






////////////////////////////////////////////////////////////////////
//GET CONNECTION TO DATABASE////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//Replace with your client's connection code
if (debugMode) msgs += "<br>  START-->Get DB connection = " +getTimeStamp()+ "<br>";
context = new InitialContext();
dataSource = (DataSource)((Context)context.lookup("java:comp/env")).lookup("jdbc/mdw_mysql");
if (debugMode) msgs += "  END-->Get DB connection = " +getTimeStamp()+ "<br>";





////////////////////////////////////////////////////////////////////
//QUERY THE DATABASE////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
if (debugMode) msgs += "  START-->Query 1= " +getTimeStamp()+ "<br>";
try {
   //get the first query results, String sql
   conn = dataSource.getConnection();
   ps = conn.prepareStatement(sql);
   ps.setString(1, temporal_value);
   rs = ps.executeQuery();
   if (rs.next()) {
      temporal_week_value = ((rs.getString("temporal_week_value")!=null)?rs.getString("temporal_week_value"):"");
      temporal_month_value = ((rs.getString("temporal_month_value")!=null)?rs.getString("temporal_month_value"):"");
      temporal_year_value = ((rs.getString("temporal_year_value")!=null)?rs.getString("temporal_year_value"):"");
      temporal_day_value = ((rs.getString("temporal_day_value")!=null)?rs.getString("temporal_day_value"):"");
      temporal_quarter_value = ((rs.getString("temporal_quarter_value")!=null)?rs.getString("temporal_quarter_value"):"");
   }
   if (rs != null) rs.close(); rs = null;
   if (ps != null) ps.close(); ps = null;


   if (debugMode) msgs += "  START-->Query 2= " +getTimeStamp()+ "<br>";
   //now get the second query results, String sql2
   ps = conn.prepareStatement(sql2);
   rs = ps.executeQuery();
   if (rs.next()) {
      invoice_date = "Updated with billing data as of "+rs.getString("INVOICE_DATE")+" PST";
   }
   if (rs != null) rs.close(); rs = null;
   if (ps != null) ps.close(); ps = null;


   if (debugMode) msgs += "  START-->Query 3= " +getTimeStamp()+ "<br>";
   //now get the third query results, String sql3
   ps = conn.prepareStatement(sql3);
   ps.setString(1, temporal_value);
   ps.setString(2, channel);
   ps.setString(3, category);
   rs = ps.executeQuery();
   if (rs.next()) {
      avg_trxn_invoice_amt = rs.getInt("AVG_TRXN_INVOICE_AMT");
   }
   if (rs != null) rs.close(); rs = null;
   if (ps != null) ps.close(); ps = null;


} catch (Exception e) {
   StringWriter writer = new StringWriter();
   e.printStackTrace(new PrintWriter(writer));
   System.out.println("Exception while connecting to db and reading = " +writer.getBuffer());
   exceptionErrors  = writer.getBuffer().toString();
}
//close connection
if (conn != null) conn.close(); conn = null;
if (debugMode) msgs += "  END-->Queries= " +getTimeStamp()+ "<br>";






////////////////////////////////////////////////////////////////////
//Format the data for charting//////////////////////////////////////
////////////////////////////////////////////////////////////////////

//Make a bar chart showing the Periods
//create the parameters for the bar chart
if (debugMode) msgs += "  START-->Chart 1= " +getTimeStamp()+ "<br>";
SimpleParameterProvider parameters = new SimpleParameterProvider();
if (temporal_cat == "Year of " || temporal_cat == "Quarter of ") {
   //define the click url template
   parameters.setParameter( "drill-url", "billing_interactive_dashboard.jsp?temporal_value={SERIES}" );
}
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
//define the bars of the bar chart
parameters.setParameter( "inner-param", "temporal_value"); //$NON-NLS-1$ //$NON-NLS-2$
//set the width and the height
parameters.setParameter( "image-width", "400"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "300"); //$NON-NLS-1$ //$NON-NLS-2$
ArrayList messages = new ArrayList();
//call the chart helper to generate the bar chart image and to get the HTML content
//use the chart definition in 'breadboard/dashboard/billing_invoice_date_vert_bar.widget.xml'
ChartHelper.doChart("breadboard", "finance/billing/dashboards",
                    "billing_period_vert_bar.widget.xml", parameters,
                    content_period, userSession, messages, null);



//Make a bar chart showing the channel
//create the parameters for the bar chart
if (debugMode) msgs += "  START-->Chart 2= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
//define the click url template
parameters.setParameter("drill-url", "billing_interactive_dashboard.jsp?temporal_value="
                        +temporal_value+"&amp;channel={SERIES}" );
parameters.setParameter("CHANNEL", channel);
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
//define the channel axis of the bar chart
parameters.setParameter( "inner-param", "CHANNEL"); //$NON-NLS-1$ //$NON-NLS-2$
//set the width and the height
parameters.setParameter( "image-width", "400"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "300"); //$NON-NLS-1$ //$NON-NLS-2$
messages = new ArrayList();
//call the chart helper to generate the bar chart image and to get the HTML content
//use the chart definition in 'samples/dashboard/regions.widget.xml'
ChartHelper.doChart("breadboard", "finance/billing/dashboards",
                    "billing_period_channel_vert_bar.widget.xml", parameters,
                    content_channel_vert_bar, userSession, messages, null );



// Make a bar chart showing the product category
// create the parameters for the bar chart
if (debugMode) msgs += "  START-->Chart 3= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
// define the click url template
parameters.setParameter( "drill-url", "billing_interactive_dashboard.jsp?temporal_value="+temporal_value
                         +"&amp;channel="+channel+"&amp;category={SERIES}" );
parameters.setParameter( "CHANNEL", channel );
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
parameters.setParameter( "outer-params", "CATEGORY" );
// define the channel axis of the bar chart
parameters.setParameter( "inner-param", "CATEGORY"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "400"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "300"); //$NON-NLS-1$ //$NON-NLS-2$
 messages = new ArrayList();
//call the chart helper to generate the bar chart image and to get the HTML content
//use the chart definition in 'samples/dashboard/regions.widget.xml'
ChartHelper.doChart("breadboard", "finance/billing/dashboards",
                    "billing_period_channel_pcat_vert_bar.widget.xml", parameters,
                    content_channel_pcat_vert_bar, userSession, messages, null );




// if the user has clicked on a bar of the bar chart we should have a year quarter, channel and category
// run a report and embed the content into this page
// create the parameters for the report
if (debugMode) msgs += "  START-->Chart 4= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
// pass the category, type, status parameters to the report
parameters.setParameter( "TEMPORAL_VALUE", temporal_value );
parameters.setParameter( "CHANNEL", channel );
parameters.setParameter( "CATEGORY", category );
// create an output stream for the report content
messages = new ArrayList();
// run the action sequence 'breadboard/dashboard/report/billing_dashboard_report.xaction'
SolutionHelper.doAction("breadboard", "finance/billing/dashboards/reports",
                     "billing_top_invoices_report.xaction", "billing_interactive_dashboard.jsp",
                     parameters, stream_interactive_report, userSession, messages, null );


if (temporal_value.length() > 0) {
   messages = new ArrayList();
   parameters = new SimpleParameterProvider();
   parameters.setParameter( "image-width", "105"); //$NON-NLS-1$ //$NON-NLS-2$
   parameters.setParameter( "image-height", "105"); //$NON-NLS-1$ //$NON-NLS-2$
   parameters.setParameter( "value", ""+avg_trxn_invoice_amt );
   //parameters.setParameter( "title", "Average Line Amount For the Period" );
   ChartHelper.doDial("breadboard", "finance/billing/dashboards", "billing_dial.widget.xml",
                      parameters, content_billing_dial, userSession, messages, null); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
}


if (debugMode) msgs += "  END-->Charts = " +getTimeStamp()+ "<br><br><br>Sql1 = " 
                       +sql+ "<br><br>Sql2 = " +sql2+ "<br><br>Sql3 = " +sql3+ "<br><br>"+
                       "time="+temporal_value+" Channel="+channel+ " Category=" +category+"<br>";
%>



   




<!-- BEGIN HTML  -->
<html>
<head>
<title>Breadboard BI Sample Billing Dashboard</title>


<script type='text/javascript'>
 function submitNewoption(selObj) {
    document.form1.submit();
 }

function doDateChange() {
   //date in mm/dd/yyyy format
   var newDate = "";
   var date2 = document.form1.myDateFld.value;
   newDate = date2.substring(date2.lastIndexOf("/")+1, date2.length);
   newDate += date2.substring(0, date2.indexOf("/"));
   newDate += date2.substring(date2.indexOf("/")+1,
   date2.lastIndexOf("/"));
   var selObj = document.form1.temporal_value;
   doSelObjLookUpAdd(selObj, newDate);
   document.form1.submit();
}
</script>
</head>
  

<body>

<% if (debugMode) { %> <%= msgs %> <%}%>

<table align="center">
<tr>
<td colspan ="2" valign="top" style="width: 66%">

<!-- Script to reference calendar.  This js would have to be put into your client's web application. -->
<script type="text/javascript" src="/pentaho/js/common.js"></script>

<!-- Replace the src value so it points to your client's logo/banner. -->
<!-- include file="navBarTopSimple.html"  -->
 </td>

 <td valign="top" style="width: 33%" align="right">
 <font style='font-family:Arial'>
<%= invoice_date %>
 </font>
 </td>
 </tr>

<tr>
<td valign="top" colspan="3">

<h3 style='font-family:Arial'><%= title %></h3>

</td>
</tr>

<tr>
<td valign="top" colspan="3">

<form name="form1" action="billing_interactive_dashboard.jsp" method="GET">
<select name="temporal_value" onChange="submitNewoption(this)">
<option value= "<%= temporal_week_value %>" SELECTED>Select a Time Period</option>
<option value= "<%= temporal_day_value %>" >Daily</option>
<option value= "<%= temporal_week_value %>" >Weekly</option>
<option value= "<%= temporal_month_value %>" >Monthly</option>
<option value= "<%= temporal_quarter_value %>" >Quarterly</option>
<option value= "<%= temporal_year_value %>" >Yearly</option>
 </select>
<script type="text/javascript">

</script>

<INPUT name= "myDateFld" type="text" id="myDateFld" value="" onChange='isValidDate2(this)' SIZE="12" MAXLENGTH="10">
<!-- show_calendar('MForm.mydate3', 4, 2001, 'MM/DD/YYYY', null, 'CallFunction=SplitDate') -->
<!-- http://www.softricks.com/products/calendar/tutorial.html -->
 <a href="javascript:show_calendar('form1.myDateFld',3)"
 onmouseover="window.status='Date Picker';return true;"
 onmouseout="window.status='';return true;">
<img src='/pentaho/images/show-calendar.gif' width=24 height=22 border=0 alt=''>
</a>
<input type='button' name='dateBtn' value="Go" onClick='doDateChange()'>
Note:  test data available for 01/2006 - 06/2006.
</form>

</td>




</tr>
        <tr>
                <td valign="top" style="width: 33%">
<!-- Top of 1 -->
                <span style="font-family:Arial;font-weight:bold"> Select a Period</span>
                <%= content_period.toString() %>
<!-- Bottom of 1 -->
<br/>
                </td>


                        <td valign="top" style="width: 33%">
                        <span style="font-family:Arial;font-weight:bold">
<!-- Top #2 -->
                <span style="font-family:Arial;font-weight:bold">Select a Channel</span>
                <%= content_channel_vert_bar.toString() %>

<!-- BOTTOM 2 -->
        </td>
        <td valign="top" style="width: 33%"><span style="font-family:Arial;font-weight:bold">
<!-- Top 3 -->         Select a Product Category
                        </span>
                        <%= content_channel_pcat_vert_bar.toString() %>
<!-- Bottom of #3 -->
        </td>
        </tr>


        <tr>
                <td valign="top" style="font-family:Arial;font-weight:bold"  colspan=2>
<!--			Click on an Order ID to drill to another page (not activated) -->
<BR>
<font style="font-family:Arial;font-weight:bold;font-size:14pt">
<%= report_title %>
</font>
                       <span style="font-family:Arial;font-weight:bold">  </span>
<!-- Top of #4 -->
                        <%= stream_interactive_report.toString() %>
<!-- BOTTOM 4 -->
                </td>

<!-- Top of #5 -->




        <td style="vertical-align: top;">
<BR>
<center>
<font style="font-family:Arial;font-weight:bold;font-size:14pt">
<%= dial_title %>
</font>
</center>
<!-- Top of #6 -->
<%= content_billing_dial.toString() %>

<!-- BOTTOM 6 -->

</td>

</tr>
</table>

<BR><BR>
<center>Copyright � 2009 Breadboard BI, Inc. All rights reserved.</center>
</body>

</html>
