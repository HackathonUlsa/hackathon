<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 10/05/16
  Time: 02:12 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>

    <title></title>

    <g:javascript>

        function showModal() {
            $("#myModal").modal('toggle');
        }

</g:javascript>
</head>

<body>

<div>

    <input data-dismiss="modal" id="PDFBtn" onclick="${remoteFunction(controller: 'historial', action: '_modalPDF', update: 'modal',
            onSuccess: 'showModal()')}"  class="btn btn-primary"  type="submit" value="Generar PDF" />

</div>

<div id="modal"></div>

</body>
</html>