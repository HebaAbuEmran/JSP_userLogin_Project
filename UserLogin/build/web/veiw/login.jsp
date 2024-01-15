<%-- 
    Document   : login
    Created on : Oct 17, 2023, 4:05:25 PM
    Author     : habuomran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Page</title>
    </head>
    <body>
        <div>
            <form method="post" action="controller" align ="center" >
                
                <div>
                   UserName: <input type="text" name= "userName"/>
                </div>
                <div>
                   passWord: <input type="password" name= "pass"/>
                </div>
                <button type="submit">Submit
                    <input type="hidden" name="action" value="login"/>         
                </button>
                
            </form>
                

         
            
            
        </div>
    </body>
</html>
