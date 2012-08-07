
<%@ page import="skyrimalchemylab.EffectAlias" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'effectAlias.label', default: 'EffectAlias')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-effectAlias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-effectAlias" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'effectAlias.name.label', default: 'Name')}" />
					
						<th><g:message code="effectAlias.aliased.label" default="Aliased" /></th>
					
						<th><g:message code="effectAlias.lang.label" default="Lang" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${effectAliasInstanceList}" status="i" var="effectAliasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${effectAliasInstance.id}">${fieldValue(bean: effectAliasInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: effectAliasInstance, field: "aliased")}</td>
					
						<td>${fieldValue(bean: effectAliasInstance, field: "lang")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${effectAliasInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
