<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core' %>

<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

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

<fmt:setBundle basename="gl_hybrid_dashboard_jsp"/>

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

ResourceBundle rb = ResourceBundle.getBundle("gl_hybrid_dashboard_jsp");


// set the character encoding e.g. UFT-8
response.setCharacterEncoding(LocaleHelper.getSystemEncoding());
// create a new Pentaho session
IPentahoSession userSession = PentahoHttpSessionHelper.getPentahoSession( request );




////////////////////////////////////////////////////////////////////
//SET UP PARAMETERS/////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
String temporal_value = ((request.getParameter("temporal_value")!=null)?request.getParameter("temporal_value"):"");
String temporal_cat = ((request.getParameter("temporal_cat")!=null)?request.getParameter("temporal_cat"):"");
String account_type = ((request.getParameter("account_type")!=null)?request.getParameter("account_type"):"");
String bu_type = ((request.getParameter("bu_type")!=null)?request.getParameter("bu_type"):"");




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
String sql2 = "SELECT MAX(DW_LOAD_DATE) AS DW_LOAD_DATE FROM FACT_GL_POSTED_TRANSACTION";
String sql3 = "";


String default_temporal_value = "";
String default_account_type = "";
String default_bu_type = "";
String sql_defaults = "SELECT "+
          "CAST(MAX(D.MONTH_SK) AS CHAR) AS DEFAULT_TEMPORAL_VALUE, "+
          "MAX(A.ACCOUNT_TYPE_DESC) AS DEFAULT_ACCOUNT_TYPE, "+
          "MAX(B.BUSINESS_UNIT_TYPE_NAME) AS DEFAULT_BU_TYPE "+
          "FROM "+
          "FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_BUSINESS_UNIT B, DIMENSION_DAY D "+
          "WHERE F.ACCOUNT_SK = A.ACCOUNT_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK AND F.TRXN_DATE_SK = D.DATE_SK "+
          "AND F.ACCOUNT_SK > 0";

int myResolved = 0;
int mySLAcomp = 0;
String exceptionErrors = "";

String dashboard_title = rb.getString("GL_Posted_Transactions_Dashboard");
String widget_1_title = "";
String widget_2_title = "";
String widget_3_title = "";
String trend_line_amt_title = "";
String trend_line_qty_title = "";

String dw_load_date = "";
StringBuffer content_period = new StringBuffer();
StringBuffer content_account_type = new StringBuffer();
StringBuffer content_account_type_bu = new StringBuffer();
StringBuffer content_account_type_bu_line1 = new StringBuffer();
StringBuffer content_account_type_bu_line2 = new StringBuffer();
StringBuffer content_gl_dial = new StringBuffer();

int avg_trxn_amt = 0;
Context context = null;
DataSource dataSource = null;
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

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
   //get the first query results, String sql_defaults
   conn = dataSource.getConnection();
   ps = conn.prepareStatement(sql_defaults);
   rs = ps.executeQuery();
   if (rs.next()) {
      default_temporal_value = rs.getString("DEFAULT_TEMPORAL_VALUE");
      default_account_type = rs.getString("DEFAULT_ACCOUNT_TYPE");
      default_bu_type = rs.getString("DEFAULT_BU_TYPE");
   }
   if (rs != null) rs.close(); rs = null;
   if (ps != null) ps.close(); ps = null;

   //Assign default values if needed.
   /* Comment out this next line if data supports the current date as default */
   if (temporal_value.length() < 1) 
	{	temporal_value = default_temporal_value; 
		temporal_cat = "Month of ";
	}
   if (account_type.length() < 1) {account_type = default_account_type;}
   if (bu_type.length() < 1) {bu_type = default_bu_type;}

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
//SET UP OTHER SQL QUERIES FOR DATABASE/////////////////////////////
////////////////////////////////////////////////////////////////////
 //Uncomment Below - to set default date to current date (test data doesn't support this).
/*
if (temporal_value.length() < 1)
{  Date current_dt = new Date();
  SimpleDateFormat sdf_year = new SimpleDateFormat("yyyy");
  SimpleDateFormat sdf_month = new SimpleDateFormat("MM");
  temporal_value = sdf_year.format(current_dt)+sdf_month.format(current_dt);
}
*/

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
   sql3 = "select ROUND(AVG(ABS(F.TRXN_AMT))) as AVG_TRXN_AMT FROM FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_DAY D, DIMENSION_BUSINESS_UNIT B WHERE D.WEEK_NAME = ? AND A.ACCOUNT_TYPE_DESC = ? AND B.BUSINESS_UNIT_TYPE_NAME = ? AND F.ACCOUNT_SK = A.ACCOUNT_SK AND F.TRXN_DATE_SK = D.DATE_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK";
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
   sql3 = "select ROUND(AVG(ABS(F.TRXN_AMT))) as AVG_TRXN_AMT FROM FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_DAY D, DIMENSION_BUSINESS_UNIT B WHERE D.YEAR_QUARTER_NAME = ? AND A.ACCOUNT_TYPE_DESC = ? AND B.BUSINESS_UNIT_TYPE_NAME = ? AND F.ACCOUNT_SK = A.ACCOUNT_SK AND F.TRXN_DATE_SK = D.DATE_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK";
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
   sql3 = "select ROUND(AVG(ABS(F.TRXN_AMT))) as AVG_TRXN_AMT FROM FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_DAY D, DIMENSION_BUSINESS_UNIT B WHERE D.MONTH_SK = ? AND A.ACCOUNT_TYPE_DESC = ? AND B.BUSINESS_UNIT_TYPE_NAME = ? AND F.ACCOUNT_SK = A.ACCOUNT_SK AND F.TRXN_DATE_SK = D.DATE_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK";
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
   sql3 = "select ROUND(AVG(ABS(F.TRXN_AMT))) as AVG_TRXN_AMT FROM FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_DAY D, DIMENSION_BUSINESS_UNIT B WHERE D.YEAR_SK = ? AND A.ACCOUNT_TYPE_DESC = ? AND B.BUSINESS_UNIT_TYPE_NAME = ? AND F.ACCOUNT_SK = A.ACCOUNT_SK AND F.TRXN_DATE_SK = D.DATE_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK";
} else if (temporal_value.length() == 8) {
   temporal_cat = "Day of ";
   sql  = "SELECT "+
          "MIN(DATE_SK) AS temporal_day_value, "+
          "MIN(WEEK_NAME) AS temporal_week_value, "+
          "MIN(MONTH_SK) AS temporal_month_value, "+
          "MIN(YEAR_SK) AS temporal_year_value, "+
          "MIN(YEAR_QUARTER_NAME) AS temporal_quarter_value "+
          "FROM DIMENSION_DAY WHERE DATE_SK = ?";
   sql3 = "select ROUND(AVG(ABS(F.TRXN_AMT))) as AVG_TRXN_AMT FROM FACT_GL_POSTED_TRANSACTION F, DIMENSION_ACCOUNT A, DIMENSION_DAY D, DIMENSION_BUSINESS_UNIT B WHERE D.DATE_SK = ? AND A.ACCOUNT_TYPE_DESC = ? AND B.BUSINESS_UNIT_TYPE_NAME = ? AND F.ACCOUNT_SK = A.ACCOUNT_SK AND F.TRXN_DATE_SK = D.DATE_SK AND F.BUSINESS_UNIT_SK = B.BUSINESS_UNIT_SK";
} else {
   temporal_cat = "";
}


if (debugMode) msgs += "  START-->Query 1.5= " +getTimeStamp()+ "<br>";
try {
   //get the first query results, String sql_defaults
   conn = dataSource.getConnection();
   //now get the next query results, String sql
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
      dw_load_date = rb.getString("Updated_with_data_as_of")+ " " + rs.getString("DW_LOAD_DATE")+" PST";
   }
   if (rs != null) rs.close(); rs = null;
   if (ps != null) ps.close(); ps = null;

   if (debugMode) msgs += "  START-->Query 3= " +getTimeStamp()+ "<br>";
   //now get the third query results, String sql3
   ps = conn.prepareStatement(sql3);
   ps.setString(1, temporal_value);
   ps.setString(2, account_type);
   ps.setString(3, bu_type);
   rs = ps.executeQuery();
   if (rs.next()) {
    	avg_trxn_amt = rs.getInt("AVG_TRXN_AMT");
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




widget_1_title = rb.getString("By_the") + " " + temporal_cat+" "+temporal_value;
widget_2_title = rb.getString("By_the") + " " + temporal_cat+" "+temporal_value +  " & " + account_type;
widget_3_title = rb.getString("By_the") + " " + temporal_cat+" "+temporal_value +  " & " + account_type + " & " + bu_type;


trend_line_amt_title = rb.getString("Amounts_for_the") + " " + temporal_cat+" "+temporal_value + " & "  + account_type + " & " + bu_type;
trend_line_qty_title = rb.getString("Quantities_for_the") + " " + temporal_cat+" "+temporal_value + " & "  + account_type + " & " + bu_type; 


////////////////////////////////////////////////////////////////////
//Format the data for charting//////////////////////////////////////
////////////////////////////////////////////////////////////////////

// Make a bar chart showing the periods
// create the parameters for the bar chart
if (debugMode) msgs += "  START-->Chart 1= " +getTimeStamp()+ "<br>";
SimpleParameterProvider parameters = new SimpleParameterProvider();
if (temporal_cat == "Year of " || temporal_cat == "Quarter of ") {
// define the Click url template
parameters.setParameter( "drill-url", "gl_hybrid_dashboard.jsp?temporal_value={SERIES}" );
}
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
// define the bars of the bar chart
parameters.setParameter( "inner-param", "temporal_value"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "350"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "250"); //$NON-NLS-1$ //$NON-NLS-2$
ArrayList messages = new ArrayList();
// call the chart helper to generate the bar chart image and to get the HTML content
ChartHelper.doChart( "breadboard", "finance/general_ledger/dashboards", 
					"gl_period_vert_bar.widget.xml", parameters, 
					content_period, userSession, messages, null); 




// Make a bar chart showing the account types
// create the parameres for the bar chart
if (debugMode) msgs += "  START-->Chart 2= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
// define the Click url template
parameters.setParameter( "drill-url", "gl_hybrid_dashboard.jsp?temporal_value="+temporal_value+"&amp;account_type={SERIES}" );
// define the bars of the bar chart
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
parameters.setParameter( "inner-param", "ACCOUNT_TYPE"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "350"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "250"); //$NON-NLS-1$ //$NON-NLS-2$
messages = new ArrayList();
// call the chart helper to generate the bar chart image and to get the HTML content
ChartHelper.doChart( "breadboard", "finance/general_ledger/dashboards",
 					"gl_period_account_type_vert_bar.widget.xml", parameters, 
 					content_account_type, userSession, messages, null ); 




// Make a bar chart showing the account type business unit type 
// create the parameters for the bar chart
if (debugMode) msgs += "  START-->Chart 3= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
// define the Click url template
parameters.setParameter( "drill-url", "gl_hybrid_dashboard.jsp?temporal_value="+temporal_value+"&amp;account_type="+account_type+"&amp;bu_type={SERIES}" );
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
parameters.setParameter( "ACCOUNT_TYPE", account_type );
parameters.setParameter( "outer-params", "BU_TYPE" );
// define the account_type axis of the bar chart
parameters.setParameter( "inner-param", "BU_TYPE"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "350"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "250"); //$NON-NLS-1$ //$NON-NLS-2$
messages = new ArrayList();
// call the chart helper to generate the bar chart image and to get the HTML content
ChartHelper.doChart( "breadboard", "finance/general_ledger/dashboards", 
					"gl_period_account_type_bu_type_vert_bar.widget.xml", parameters, 
					content_account_type_bu, userSession, messages, null ); 



// Make a line showing the account type business unit type
// create the parameters for the line chart
if (debugMode) msgs += "  START-->Chart 4= " +getTimeStamp()+ "<br>";
parameters = new SimpleParameterProvider();
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
parameters.setParameter( "ACCOUNT_TYPE", account_type );
parameters.setParameter( "BU_TYPE", bu_type );
parameters.setParameter( "outer-params", "BU_TYPE" );
// define the category axis of the bar chart
parameters.setParameter( "inner-param", "BU_TYPE"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "400"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "200"); //$NON-NLS-1$ //$NON-NLS-2$
messages = new ArrayList();
// call the chart helper to generate the pie chart image and to get the HTML content
ChartHelper.doChart( "breadboard", "finance/general_ledger/dashboards", 
				"gl_period_account_type_bu_type_line.widget.xml", parameters, 
				content_account_type_bu_line1, userSession, messages, null ); 



// Make another line showing the account type business unit type
// create the parameters for the line chart
parameters = new SimpleParameterProvider();
parameters.setParameter( "TEMPORAL_VALUE", temporal_value);
parameters.setParameter( "ACCOUNT_TYPE", account_type );
parameters.setParameter( "BU_TYPE", bu_type );
parameters.setParameter( "outer-params", "BU_TYPE" );		
// define the category axis of the bar chart
parameters.setParameter( "inner-param", "BU_TYPE"); //$NON-NLS-1$ //$NON-NLS-2$
// set the width and the height
parameters.setParameter( "image-width", "400"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "200"); //$NON-NLS-1$ //$NON-NLS-2$
messages = new ArrayList();
// call the chart helper to generate the pie chart image and to get the HTML content
// use the chart definition in 'samples/dashboard/regions.widget.xml'
ChartHelper.doChart( "breadboard", "finance/general_ledger/dashboards",
 			"gl_period_account_type_bu_type_line_II.widget.xml", parameters, 
 			content_account_type_bu_line2, userSession, messages, null ); 



messages = new ArrayList();
parameters = new SimpleParameterProvider();
parameters.setParameter( "image-width", "105"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "image-height", "105"); //$NON-NLS-1$ //$NON-NLS-2$
parameters.setParameter( "value", ""+avg_trxn_amt );
parameters.setParameter( "title", "Average Amount "+widget_3_title);
ChartHelper.doDial( "breadboard", "finance/general_ledger/dashboards", 
			"gl_dial.widget.xml", parameters, 
			content_gl_dial, userSession, messages, null ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$


if (debugMode) msgs += "  END-->Charts = " +getTimeStamp()+ "<br><br><br>Sql1 = " 
                       +sql+ "<br><br>Sql2 = " +sql2+ "<br><br>Sql3 = " +sql3+ "<br><br>"+
                       "time="+temporal_value+" Account Type="+account_type+ " Business Unit Type=" +bu_type+"<br>";
%>



   




<!-- BEGIN HTML  -->
<html>
<head>
<title><fmt:message key="Breadboard_BI_Sample_General_Ledger_Dashboard"/></title>


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
<%= dw_load_date %>
 </font>
 </td>
 </tr>

<tr>
<td valign="top" colspan="3">

<h3 style='font-family:Arial'><%= dashboard_title %></h3>
</td>
</tr>

<tr>
<td valign="top" colspan="3">

<form name="form1" action="gl_hybrid_dashboard.jsp" method="GET">
<select name="temporal_value" onChange="submitNewoption(this)">
<option value= "<%= temporal_week_value %>" SELECTED><fmt:message key="Select_a_Time_Period"/></option>
<option value= "<%= temporal_day_value %>" ><fmt:message key="Daily"/></option>
<option value= "<%= temporal_week_value %>" ><fmt:message key="Weekly"/></option>
<option value= "<%= temporal_month_value %>" ><fmt:message key="Monthly"/></option>
<option value= "<%= temporal_quarter_value %>" ><fmt:message key="Quarterly"/></option>
<option value= "<%= temporal_year_value %>" ><fmt:message key="Yearly"/></option>
 </select>

<INPUT name= "myDateFld" type="text" id="myDateFld" value="" onChange='isValidDate2(this)' SIZE="12" MAXLENGTH="10">
<!-- show_calendar('MForm.mydate3', 4, 2001, 'MM/DD/YYYY', null, 'CallFunction=SplitDate') -->
<!-- http://www.softricks.com/products/calendar/tutorial.html -->
 <a href="javascript:show_calendar('form1.myDateFld',3)"
 onmouseover="window.status='Date Picker';return true;"
 onmouseout="window.status='';return true;">
<img src='/pentaho/images/show-calendar.gif' width=24 height=22 border=0 alt=''>
</a>
<input type='button' name='dateBtn' value="Go" onClick='doDateChange()'>
Note:  test data available for 02/2005 - 06/2006.
</form>

</td>
</tr>

<tr>
<td valign="top" style="width: 33%;font-family:Arial;font-weight:bold;">
<!-- Top of 1 -->
<%= widget_1_title %><br>
<small><fmt:message key="Click_the_chart_to_launch_an_Analysis_Cube_in_a_new_window"/></small>
<%= content_period.toString() %>
<!-- Bottom of 1 -->
</td>

<td valign="top" style="width: 33%;font-family:Arial;font-weight:bold;">
<!-- Top #2 -->
<%= widget_2_title %><br>
<small><fmt:message key="Click_on_a_bar_to_change_the_account_type"/></small>
<%= content_account_type.toString() %>
<!-- BOTTOM 2 -->
</td>

<!-- Top 3 -->        
<td valign="top" style="width: 33%;font-family:Arial;font-weight:bold;">
<%= widget_3_title %><br>
<small><fmt:message key="Click_on_a_bar_to_change_the_business_unit"/></small>
<%= content_account_type_bu.toString() %>
<!-- Bottom of #3 -->
</td>
</tr>

<tr>
<td valign="top" style="font-family:Arial;font-weight:bold">
<BR>
<%= trend_line_amt_title %>
<!-- Top of #4 -->

<BR>
<a href="Pivot?solution=breadboard&path=finance/general_ledger/analysis&action=ledger_account_time_bu_cube.xaction" target="_blank">
<small><fmt:message key="Click_the_chart_to_launch_an_Analysis_Cube_in_a_new_window"/></small>
<%= content_account_type_bu_line1.toString() %>
</a>
<!-- BOTTOM 4 -->
</td>

<!-- Top of #5 -->
<td style="vertical-align: top;font-family:Arial;font-weight:bold;">
<BR>
<%= trend_line_qty_title %>
<BR>
<a href="Pivot?solution=breadboard&path=finance/general_ledger/analysis&action=ledger_account_time_bu_cube.xaction" target="_blank">     
<small><fmt:message key="Click_the_chart_to_launch_an_Analysis_Cube_in_a_new_window"/></small>   
<%= content_account_type_bu_line2.toString() %>
</a>     
</td>    

<td style="vertical-align: top;font-family:Arial;font-weight:bold;">    
<br>
<!-- Top of #6 -->
<%= content_gl_dial.toString() %> 
<!-- BOTTOM 6 -->
</td>
</tr>
</table>

<BR><BR>
<center>Copyright � 2009 Breadboard BI, Inc. All rights reserved.</center>
</body>

</html>
