<%-- 
    Document   : input_plan
    Created on : Oct 9, 2018, 11:49:06 PM
    Author     : xiangweiwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 
    <body>
        <form action="<%= request.getContextPath() %>/plan/init.htm" method="POST">
            <label for="name">日期</label><input id="name" type="text" name="name"/>
            <label for="password">客户</label><input type="password" name="password"/>
            <label for="password">生产计划通知书号</label><input type="password" name="password"/>
            <label for="password">版本号</label><input type="password" name="password"/>
            <label for="password">产品型号</label><input type="password" name="password"/>
            <label for="password">生产BOM编号</label><input type="password" name="password"/>
            <label for="password">软件版本</label><input type="password" name="password"/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
