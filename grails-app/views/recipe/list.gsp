
<%@ page import="skyrimalchemylab.Recipe" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'recipe.name.label', default: 'Name')}" />
                        <th>Effekte</th>
                        <th>Zutaten</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "name")}</g:link></td>

                        <td>
                            <g:each in="${recipeInstance.effects.sort()}" var="eff" status="effLoopIndex">
                                <g:link controller="effect" action="show" id="${eff.id}">${eff.name}</g:link>
                                <g:if test="${recipeInstance.effects.size() < effLoopIndex}"><pre> + </pre></g:if>
                            </g:each>
                        </td>

                        <td>
                            <g:each in="${recipeInstance.ingredients.sort()}" var="ing" status="ingLoopIndex">
                                <g:link controller="ingredient" action="show" id="${ing.id}">${ing.name}</g:link>
                                <g:if test="${recipeInstance.ingredients.size() < ingLoopIndex}"><pre> + </pre></g:if>
                            </g:each>
                        </td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
