<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <s:form action="UserLogon">
            <s:textfield label="User Name" name="user.name" />
            <s:fielderror cssStyle="color: red"><s:param>user.name</s:param></s:fielderror>
            
            <s:password label="Password" name="user.Pwd" />
            <s:submit />
        </s:form>
    </body>
</html>