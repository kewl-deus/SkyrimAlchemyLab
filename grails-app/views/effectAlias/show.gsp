
<%@ page import="skyrimalchemylab.EffectAlias" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'effectAlias.label', default: 'EffectAlias')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-effectAlias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-effectAlias" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list effectAlias">
			
				<g:if test="${effectAliasInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="effectAlias.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${effectAliasInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${effectAliasInstance?.aliased}">
				<li class="fieldcontain">
					<span id="aliased-label" class="property-label"><g:message code="effectAlias.aliased.label" default="Aliased" /></span>
					
						<span class="property-value" aria-labelledby="aliased-label"><g:link controller="effect" action="show" id="${effectAliasInstance?.aliased?.id}">${effectAliasInstance?.aliased?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${effectAliasInstance?.lang}">
				<li class="fieldcontain">
					<span id="lang-label" class="property-label"><g:message code="effectAlias.lang.label" default="Lang" /></span>
					
						<span class="property-value" aria-labelledby="lang-label"><g:link controller="language" action="show" id="${effectAliasInstance?.lang?.id}">${effectAliasInstance?.lang?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${effectAliasInstance?.id}" />
					<g:link class="edit" action="edit" id="${effectAliasInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
