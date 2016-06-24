<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@attribute name="title" required="true"%>
<%@attribute name="bodyClass" required="false"%>
<%@attribute name="extraScripts" fragment="true"%>

<!DOCTYPE html>
<html class="no-js" lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>${title}</title>
	
	<c:url value="/resources" var="dir"/>
	<link href="${dir}/css/cssbase-min.css" rel="stylesheet" type="text/css"  media="all"  />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link href="${dir}/css/fonts.css" rel="stylesheet" type="text/css"  media="all"  />
	<link href="${dir}/css/fontello-ie7.css" rel="stylesheet" type="text/css"  media="all"  />
	<link href="${dir}/css/fontello-embedded.css" rel="stylesheet" type="text/css"  media="all"  />
	<link href="${dir}/css/fontello.css" rel="stylesheet" type="text/css"  media="all"  />
    <link href="${dir}/css/book-collection.css" rel="stylesheet" type="text/css"  media="all"  />
    <link href="${dir}/css/style.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/layout-colors.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/responsive-style.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/produtos.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/guia-do-programador-style.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/checkout-stule.css" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="${dir}/css/checkout.scss.css" rel="stylesheet" type="text/css"  media="all"  />
</head>

<body class="${bodyClass}">
	<jsp:doBody />
	
	<jsp:invoke fragment="extraScripts" />
</body>

</html>
