
<%@ page import="skyrimalchemylab.IngredientAlias" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredientAlias.label', default: 'IngredientAlias')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ingredientAlias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ingredientAlias" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ingredientAlias">
			
				<g:if test="${ingredientAliasInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="ingredientAlias.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ingredientAliasInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientAliasInstance?.aliased}">
				<li class="fieldcontain">
					<span id="aliased-label" class="property-label"><g:message code="ingredientAlias.aliased.label" default="Aliased" /></span>
					
						<span class="property-value" aria-labelledby="aliased-label"><g:link controller="ingredientImpl" action="show" id="${ingredientAliasInstance?.aliased?.id}">${ingredientAliasInstance?.aliased?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientAliasInstance?.lang}">
				<li class="fieldcontain">
					<span id="lang-label" class="property-label"><g:message code="ingredientAlias.lang.label" default="Lang" /></span>
					
						<span class="property-value" aria-labelledby="lang-label"><g:link controller="language" action="show" id="${ingredientAliasInstance?.lang?.id}">${ingredientAliasInstance?.lang?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ingredientAliasInstance?.id}" />
					<g:link class="edit" action="edit" id="${ingredientAliasInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
