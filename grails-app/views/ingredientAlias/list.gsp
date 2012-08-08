
<%@ page import="skyrimalchemylab.IngredientAlias" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredientAlias.label', default: 'IngredientAlias')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ingredientAlias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ingredientAlias" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'ingredientAlias.name.label', default: 'Alias')}" />

                        <g:sortableColumn property="aliased" title="${message(code: 'ingredientAlias.aliased.label', default: 'Original')}" />

						<th><g:message code="ingredientAlias.lang.label" default="Lang" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ingredientAliasInstanceList}" status="i" var="ingredientAliasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ingredientAliasInstance.id}">${fieldValue(bean: ingredientAliasInstance, field: "name")}</g:link></td>
					
						<td><g:link controller="ingredientImpl" action="show" id="${ingredientAliasInstance.aliased.id}">${fieldValue(bean: ingredientAliasInstance, field: "aliased")}</g:link></td>
					
						<td>${fieldValue(bean: ingredientAliasInstance, field: "lang")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ingredientAliasInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
