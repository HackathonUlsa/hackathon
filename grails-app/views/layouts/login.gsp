<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 12/02/16
  Time: 09:30 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.png')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'fonts/css', file: 'font-awesome.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
    <g:javascript src="jquery-1.11.3.min.js"/>
    <g:javascript src="jquery-ui.js"></g:javascript>
    <g:javascript src="bootstrap.min.js"></g:javascript>
    <g:javascript src="bootbox.min.js"></g:javascript>
    <g:javascript src="jsapi.js"/>
    <g:javascript src="jquery.dataTables.min.js"/>
    <g:javascript src="offcanvas.js"/>
    <g:javascript src="bootstrap-filestyle.min.js"/>
    <g:javascript src="application.js"></g:javascript>
    <g:layoutHead/>
</head>

<body style="background:#F7F7F7;">

<div class="">

    <div id="wrapper">
        <div id="login" class="animate form">
            <section class="login_content">
                <g:layoutBody/>
            </section>
        </div>
    </div>
</div>

</body>
</html>