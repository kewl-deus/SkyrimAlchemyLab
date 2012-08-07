
<%@ page import="skyrimalchemylab.EffectImpl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'effectImpl.label', default: 'EffectImpl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-effectImpl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-effectImpl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'effectImpl.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'effectImpl.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="positive" title="${message(code: 'effectImpl.positive.label', default: 'Positive')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${effectImplInstanceList}" status="i" var="effectImplInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${effectImplInstance.id}">${fieldValue(bean: effectImplInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: effectImplInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${effectImplInstance.positive}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${effectImplInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
