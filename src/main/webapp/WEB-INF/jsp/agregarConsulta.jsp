<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/caja.js" />">
</script>

<link rel="stylesheet" type="text/css"  href="<c:url  value="/css/sanantial.css" />" /> 
<link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/main.css" />"  />

</head>
<body>

 
 
      <table border=0 cellSpacing=0 cellPadding=0 width=780 align=center>
        <tbody>
           <tr>
            <td>
            </td>
            </tr>
           <tr>
            <td>
              <div id="popup">
              <div id="div_center">
              <table width="100%" >
                  <c:forEach items="${consultas}" var="consulta">
                  <c:choose>
	                    <c:when test="${consulta.consultaId != '0'}">
							<tr>
								<td><c:out value="${consulta.doctor.doctorNombre}"></c:out></td>
								<td><c:out value="${consulta.consultaNombre}"></c:out></td>
								<td><c:out value="${consulta.precio}"></c:out></td>
								<td><input type="checkbox" id="consulta" name="consulta" value="${consulta.consultaId}" /></td>
							</tr>
						</c:when>	
					</c:choose>
				  </c:forEach>
                </table>
                </div>
              </div>


             </td>
           </tr>
           <tr>
              <td align="center">
                  <input id="Aceptar" name="Aceptar" type="button" value="Aceptar" onclick="javascript:guardarConsultas()"/>
                  <input id="Cancelar" name="Cancelar" type="button" value="Cancelar" onclick="javascript:window.close();"/>
              </td>
           </tr>
         </tbody>
        </table>
        
     
</body>
</html>