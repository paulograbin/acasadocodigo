<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Listagem de Produtos</title>
	</head>
	<body>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user"/>
				<div>
					Ol� ${user.name}
				</div>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:url value="/products/form" var="formLink"/>
			<a href="${formLink}">
				Cadastrar novo produto
			</a>
		</sec:authorize>
		
		<table>
			<tr>
				<th>id</th>
				<th>T�tulo</th>
				<th>Valores</th>
				
				<c:forEach items="${products}" var="product">
					<tr>
						<td>${product.id}</td>
						<td>${product.title}</td>
						<td>
							<c:forEach items="${product.prices}" var="price">
								[${price.value} - ${price.bookType}]
							</c:forEach>
						</td>
						<td>
							<c:url value="/products/${product.id}" var="linkDetalhar"/>
							<a href="${linkDetalhar}">
								Detalhar
							</a>
						</td>
					</tr>				
				</c:forEach>
			</tr>
		</table>
	</body>
</html>