<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Listagem de Produtos</title>
	</head>
	<body>
		<table>
			<tr>
				<th>Título</th>
				<th>Valores</th>
				
				<c:forEach items="${products}" var="product">
					<tr>
						<td>${product.title}</td>
						<td>
							<c:forEach items="${product.prices}" var="price">
								[${price.value}] - ${proce.bookType}
							</c:forEach>
						</td>
					</tr>				
				</c:forEach>
			</tr>
		</table>
	</body>
</html>