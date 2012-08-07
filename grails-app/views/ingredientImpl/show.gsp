
<%@ page import="skyrimalchemylab.IngredientImpl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredientImpl.label', default: 'IngredientImpl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ingredientImpl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ingredientImpl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ingredientImpl">
			
				<g:if test="${ingredientImplInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="ingredientImpl.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ingredientImplInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientImplInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="ingredientImpl.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${ingredientImplInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientImplInstance?.effects}">
				<li class="fieldcontain">
					<span id="effects-label" class="property-label"><g:message code="ingredientImpl.effects.label" default="Effects" /></span>
					
						<g:each in="${ingredientImplInstance.effects}" var="e">
						<span class="property-value" aria-labelledby="effects-label"><g:link controller="effect" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientImplInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="ingredientImpl.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${ingredientImplInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientImplInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="ingredientImpl.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${ingredientImplInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ingredientImplInstance?.id}" />
					<g:link class="edit" action="edit" id="${ingredientImplInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
