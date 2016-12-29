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
<link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/style-login.css" />"  />

<%-- <link  rel="stylesheet" type="text/css"  href="<c:url  value="/css/excel-2007.css" />"  /> --%>

</head>
<body>

<table align="center">
  <tr>
    <td><p><img src="<c:url value="/images/logosanantial.jpg" />"></img></p></td>
  </tr>

 </table>         
</body>