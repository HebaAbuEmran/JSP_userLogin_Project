<%-- 
    Document   : addUpdate
    Created on : Oct 22, 2023, 9:51:01 AM
    Author     : habuomran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add and Update Page</title>
    </head>
    <body>
        <div align = "center">
            <c:if test ="${user == null}">
                <form action="controller" method="post">
                    <input type="hidden" name="action" value="addUser"/>
                    <h3> Add new user <h3/>  
            </c:if>        
            <c:if test ="${user != null}">
                <form action="controller" method="post">
                <input type="hidden" name="action" value="updateUser"/>
                <h3> Update user <h3/>  
            </c:if> 
                <table border="1" cellpading="4">
                    <tr>
                        <th>Id</th>
                        <td> <input type ="text" name="id"  value="<c:out value='${user.getId()}' />" /> </td>
                    </tr>
                    <tr>
                        <th>UserName</th>
                        <td> <input type="text" name="userName" value="${user.getUserName()}" /> </td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td> <input type="text" name="password" value="${user.getPassWord()}" /> </td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td> <input type ="text" name="name"  value="<c:out value='${user.getName()}' />" /> </td>
                    </tr>
                    <tr>
                        <th>Age</th>
                        <td> <input type="text" name="age" value="<c:out value='${user.getAge()}' />"/> </td>
                    </tr>
                    <tr>
                        <th>Skill</th>
                        <td> <input type="text" name="skill" value="${user.getSkill()}" /> </td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td> <input type="text" name="address" value="${user.getAdress()}" /> </td>
                    </tr>
                    <tr>
                        <th>Role</th>
                        <td> <input type="text" name="role" value="${user.getRole()}" /> </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="save"/>
                        </td>
                    </tr>
                     
                </table> 
              </form>
                
        </div>
    </body>
</html>
