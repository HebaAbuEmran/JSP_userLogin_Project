<%-- 
    Document   : client
    Created on : Oct 18, 2023, 10:51:51 AM
    Author     : habuomran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>client Page</title>
    </head>
    <body>
        <div align ="center">
            <table border =1 callbading = 4>
                <caption><h2>client info</h2</caption>
                <tr>
                    <th>Name</th> 
                    <th>Age</th>
                    <th>Skill</th>
                    <th>Address</th>
                </tr>
                <tr>
                    <td>${theClient.getName()}</td>
                    <td>${theClient.getAge()}</td>
                    <td>${theClient.getSkill()}</td>
                    <td>${theClient.getAdress()}</td>

                </tr>
            </table> 
        </div>
    </body>
</html>
