<%@ include file="common/headerIndex.jsp" %>

	<div id="main">
	  <div id="center">
			<div class="login">
				      <h1>Ingresar a Sanantial</h1>
				      <form method="post" action="/sanantial/autentia">
				        <p><input type="text" id="user" name="user" value="" placeholder="Username or Email"></p>
				        <p><input type="password" id="password" name="password" value="" placeholder="Password"></p>
				        <p class="submit"><input type="submit" name="commit" value="Login"></p>
				      </form>
   			 </div>
   			 <table>
   			 <tr>
	   			  <td>
		   			 <c:if test="${valid == 'fail'}">
									<p class="error">Usuario o contraseña invalida</p>
					</c:if>
				</td>
			</tr>
			
			</table>
		</div>
	</div>



<%@ include file="common/footer.jsp" %>
