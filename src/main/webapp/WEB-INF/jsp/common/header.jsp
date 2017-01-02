<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tags/function-exclusion" prefix="fex" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>

<script type="text/javascript" src="<c:url value="/js/jquery-2.1.0.js" />" ></script>  
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js" />" ></script>
<%-- <script type="text/javascript" src="<c:url value="/js/jquery-ui-1.10.4.custom.min.js" />" ></script> --%>


<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>

<script type="text/javascript" src="<c:url value="/js/menu/hoverIntent.js" />" ></script>
<script type="text/javascript" src="<c:url value="/js/menu/superfish.js" />" ></script>

<%-- <link href="<c:url  value="/css/ui-lightness/jquery-ui-1.10.4.custom.min.css" />"  rel="stylesheet" type="text/css" /> --%>

<%-- <link href="<c:url  value="/css/cupertino/jquery-ui-1.10.4.custom.css" />"  rel="stylesheet" type="text/css" /> --%>



<script>
		(function($){ //create closure so we can safely use $ as alias for jQuery

			$(document).ready(function(){
				
				// initialise plugin
				var example = $('#example').superfish({
					//add options here if required
				});

				// buttons to demonstrate Superfish's public methods
				$('.destroy').on('click', function(){
					example.superfish('destroy');
				});

				$('.init').on('click', function(){
					example.superfish();
				});

				$('.open').on('click', function(){
					example.children('li:first').superfish('show');
				});

				$('.close').on('click', function(){
					example.children('li:first').superfish('hide');
				});
			
			});

		})(jQuery);

		</script>

<!--  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />-->
<link rel="stylesheet" type="text/css"  href="<c:url  value="/css/sanantial.css" />" /> 
<link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/main.css" />"  />
<link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/superfish.css" />"  />
<%-- <link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/style-login.css" />"  /> --%>

<%-- <link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/excel-2007.css" />"  /> --%>

</head>
<body>

<table align="center">
  <tr>
    <td><p><img src="<c:url value="/images/logosanantial.jpg" />"></img></p></td>
  </tr>
  <tr>
            <td align="right">
            <table align="center">
            <tr>
            <td>
             <ul class="sf-menu" id="example">
              <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,5)}">
			 <li class="current">
				<a >Alta</a>
				<ul>
					<li>
						<a href="/clinicaweb/buscar/paciente">Cita</a>
					</li>
                    <li>
						<a href="/clinicaweb/alta/paciente">Paciente</a>
					</li>
                    <li>
						<a href="/clinicaweb/alta/medicamento">Medicamento</a>

					</li>
					 <li>
						<a href="/clinicaweb/alta/tratamiento">Tratamiento</a>

					</li>


				</ul>
			 </li>
			 </c:if>
			  <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,7)}">
	             <li class="current">
	              <a >Clinica</a>
					<ul>
					 <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,3)}">
						<li>
							<a href="/clinicaweb/tablero/doctores">Tablero Doctores</a>
						</li>
					 </c:if>
					 <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,4)}">
	                    <li>
							<a href="/clinicaweb/tablero/enfermeras">Tablero Enfermeras</a>
						</li>
					 </c:if>
					</ul>
				 </li>
			  </c:if>
			  <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,2)}">
	             <li class="current">
					<a >Caja</a>
					<ul>
	                    <li>
							<a href="/clinicaweb/tablero/caja">Tablero Caja</a>
						</li>
	                    <li>
							<a href="/clinicaweb/buscar/reporte_ventas">Ventas Diarias</a>
						</li>
	
					</ul>
				 </li>
			 </c:if>
             <li>
             <c:if test="${fex:isPermitted(sessionScope.exclusionesNumbers,1)}">
				<a href="/clinicaweb/ingresar/paciente">Ingresar Paciente</a>
			</c:if>
			 </li>	
			 <li>
	    		<a href="/clinicaweb/logout">Salir</a>
			 </li>	
		    </ul>
            </td>
            </tr>
            </table>
           </td>
    </tr>
 </table>         
</body>