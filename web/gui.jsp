<%@page import="com.sayantan.ActionForm.Gui2FormVars"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible"
          content="IE=EmulateIE7; IE=EmulateIE9">
    <!--[if IE]><script src="path/to/excanvas.js"></script><![endif]-->
    <script type="text/javascript" src="demo_files/dygraph-dev.js"></script>
    <script type="text/javascript" src="demo_files/strftime-min.js"></script>
    <script type="text/javascript" src="demo_files/rgbcolor.js"></script>
    <script type="text/javascript" src="demo_files/stacktrace.js"></script>
    <script type="text/javascript" src="demo_files/dashed-canvas.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-layout.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-canvas.js"></script>
    <script type="text/javascript" src="demo_files/dygraph.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-utils.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-gviz.js"></script>
    <script type="text/javascript"
            src="demo_files/dygraph-interaction-model.js"></script>
    <script type="text/javascript"
            src="demo_files/dygraph-range-selector.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-tickers.js"></script>
    <script type="text/javascript" src="demo_files/base.js"></script>
    <script type="text/javascript" src="demo_files/annotations.js"></script>
    <script type="text/javascript" src="demo_files/axes.js"></script>
    <script type="text/javascript" src="demo_files/chart-labels.js"></script>
    <script type="text/javascript" src="demo_files/grid.js"></script>
    <script type="text/javascript" src="demo_files/legend.js"></script>
    <script type="text/javascript" src="demo_files/install.js"></script>
    <script type="text/javascript"
            src="demo_files/dygraph-options-reference.js"></script>
    <script type="text/javascript" src="demo_files/dygraph-combined.js"></script>
    <link type="text/css" rel="stylesheet"
          href="datepicker/datepickercontrol.css">
    <link rel="stylesheet" type="text/css" href="css/global.css" />
    <link type="text/css" rel="stylesheet" href="css/displayDecorator.css">
    <link type="text/css" rel="stylesheet" href="css/alternative.css">
    <link type="text/css" rel="stylesheet" href="css/base.css">
    <link type="text/css" rel="stylesheet" href="css/screen.css">
    <link type="text/css" rel="stylesheet" href="css/global.css">
    <title>Access Data Details</title>
</head>
<body>
<!-- Input form -->
<s:form name="stockReport" action="accessDetails" method="post"
        theme="simple" namespace="/">
    <h4>Filters:</h4>
    <table>
        <tr>
            <td>Dept:</td>
            <td><s:select name="dept" list="deptList"
                          headerKey="1" /></td>
            <td>&nbsp;&nbsp;</td>
            <td>Price History:</td>
            <td><s:select name="priceHistoryField"
                          list="#{'All':'All',30:30, 60:60, 120:120, 250:250}" headerKey="1" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2"><s:submit name="submit" /></td>
            <td>&nbsp;&nbsp;</td>
        </tr>
    </table>
</s:form>

<div style="font-size: 12pt; color: white; background-color: darkred">
    <s:actionerror />
    <s:fielderror />
    <s:actionmessage />
    <s:property value="fileNotFoundMessage" />
    <s:property value="errorMessage" />
</div>
<br>
<div style="font-size: 12pt; color: white; background-color: green">
    <s:property value="successUploadMessage" />
</div>
<p></p>

<h4>Results:</h4>
<!-- Results page -->
<display:table id="lcp" name="lcp" pagesize="10"
               sort="list" export="true" requestURI="/accessDetails.action"
               cellspacing="10">
    <!-- Serial No. -->
    <% int countess = 0; %>
    <display:column  class="colId" title="" media="html" paramId="id"
                     paramProperty="scenarioId" total="true" style="align:right">
        <!-- check out correct syntax for align -->
        <%--Integer.parseInt(pageContext.getAttribute(
                        "lcp_rowNum").toString())--%>
        <s:set name="rNum" value="%{lcp.row_rowNum}" />
    </display:column>

    <!-- Common fields -->
    <display:column  class="colId" title="security" sortable="true" paramId="id"
                     paramProperty="scenarioId" total="true">
        <%=Gui2FormVars.getIdMap().get(
                Integer.parseInt(pageContext.getAttribute(
                        "lcp_rowNum").toString()) - 1)%>
    </display:column>

    <c:if test="<%=Gui2FormVars.getDeptMap().size() != 0%>">
        <display:column  class="colId" title="Last Price" sortable="true" paramId="lcp"
                         paramProperty="lcp" escapeXml="true" headerClass="sortable">
            <%=Gui2FormVars.getDeptMap().get(
                    Integer.parseInt(pageContext.getAttribute(
                            "lcp_rowNum").toString()) - 1)%>
        </display:column>
    </c:if>


    <display:column>
    </display:column>

    <!-- Footer -->
    <br>
    <br>
    <%-- <display:caption><h3>Trade Details</h3></display:caption> --%>
    <display:setProperty name="paging.banner.placement" value="bottom" />
</display:table>
<!-- Graph -->
</body>
</html>