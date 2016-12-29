<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/reporteVentaDiaria.js" />">
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
              <table>
	              <c:forEach items="${gasto}" var="itemGasto">
	               <c:if test="${itemGasto.gastoId != '0'}">
						<tr>
							<td><c:out value="${itemGasto.conceptoGasto}"></c:out></td>
							<td><c:out value="${itemGasto.totalGasto}"></c:out></td>
							<td><input type="checkbox" id="gasto" name="gasto" value="${itemGasto.gastoId}" /></td>
						</tr>
					</c:if>
				  </c:forEach>
               </table>
              </div>
              </div>
             </td>
           </tr>
     
           <tr>
              <td align="center">
                  <input id="Aceptar" name="Aceptar" type="button" value="Aceptar" onclick="javascript:guardarGastos()"/>
                  <input id="Cancelar" name="Cancelar" type="button" value="Cancelar" onclick="javascript:window.close();"/>
              </td>
           </tr>
         </tbody>
        </table>
 </body>