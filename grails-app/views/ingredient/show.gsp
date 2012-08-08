
<%@ page import="skyrimalchemylab.Ingredient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ingredient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ingredient">
			
				<g:if test="${ingredientInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="ingredient.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ingredientInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="ingredient.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${ingredientInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientInstance?.lang}">
				<li class="fieldcontain">
					<span id="lang-label" class="property-label"><g:message code="ingredient.lang.label" default="Lang" /></span>
					
						<span class="property-value" aria-labelledby="lang-label"><g:link controller="language" action="show" id="${ingredientInstance?.lang?.id}">${ingredientInstance?.lang?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ingredientInstance?.id}" />
					<g:link class="edit" action="edit" id="${ingredientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
