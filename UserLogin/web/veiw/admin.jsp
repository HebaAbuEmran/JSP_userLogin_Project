<%-- 
    Document   : admin
    Created on : Oct 19, 2023, 9:20:34 AM
    Author     : habuomran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin Page</title>
    </head>
    <body>
      <form method="post" action="controller" align ="center" >
            <button>Add new user
                <input type="hidden" name="action" value="addUserButton"/> 
            </button>
      </form>
          
        <div>
            <p>${notfication}</p> 
            
            <table border="1" cellpadding="5">
                <caption><h2>List of users</h2</caption>
                <tr>
                    <th>Name</th> 
                    <th>Age</th>
                    <th>Skill</th>
                    <th>Address</th>
                    <th> Action </th>
                </tr>
                <c:forEach var= "user" items="${Users}">  
                     <tr>
                        <td><c:out value="${user.getName()}" /></td> 
                        <td><c:out value=" ${user.getAge()}"/></td> 
                        <td><c:out value="${user.getSkill()}"/></td>
                        <td><c:out value=" ${user.getAdress()}"/></td>
                        <td>
                            <form method="post" action="controller" align ="center" >
                            <button>Delete
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="id" value="${user.getId()}"/>
                            </button>
                            </form>
                            <form method="post" action="controller" align ="center" >
                            <button>Update
                                <input type="hidden" name="action" value="updateUserButton"/>
                                <input type="hidden" name="id" value="${user.getId()}"/> 
                            </button>
                            </form>
                        </td>

                     </tr>
                </c:forEach>
                
            </table>
            
        </div>
        
    </body>
</html>
