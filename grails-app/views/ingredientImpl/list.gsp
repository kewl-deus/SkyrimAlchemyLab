
<%@ page import="skyrimalchemylab.IngredientImpl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredientImpl.label', default: 'IngredientImpl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ingredientImpl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ingredientImpl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'ingredientImpl.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="source" title="${message(code: 'ingredientImpl.source.label', default: 'Source')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'ingredientImpl.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="weight" title="${message(code: 'ingredientImpl.weight.label', default: 'Weight')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ingredientImplInstanceList}" status="i" var="ingredientImplInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ingredientImplInstance.id}">${fieldValue(bean: ingredientImplInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: ingredientImplInstance, field: "source")}</td>
					
						<td>${fieldValue(bean: ingredientImplInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: ingredientImplInstance, field: "weight")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ingredientImplInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
