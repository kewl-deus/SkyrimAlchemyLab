
<%@ page import="skyrimalchemylab.Effect" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'effect.label', default: 'Effect')}" />
		<title>Effekte</title>
	</head>
	<body>
		<a href="#list-effect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-effect" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="pagination">
                <g:each in="${effectIndexLinks}" var="indexLink">
                    ${indexLink}
                </g:each>
            </div>


			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'effect.name.label', default: 'Effekt')}" />
						<th>Zutaten mit Effekt</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${effectInstanceList}" status="i" var="effectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
                            <g:link controller="effectImpl" action="show" id="${effectInstance.id}">
                                <g:if test="${effectInstance.positive}">
                                    <span style="color: blue;">
                                        ${fieldValue(bean: effectInstance, field: "name")}
                                    </span>
                                </g:if>
                                <g:else>
                                    <span class="toxic">
                                        ${fieldValue(bean: effectInstance, field: "name")}
                                    </span>
                                </g:else>
                            </g:link>
                        </td>
					
						<td>
                            <ul>
                            <g:each in="${ingredientsWithEffect[effectInstance.id]}" var="ing">
                                <li>${ing}</li>
                            </g:each>
                            </ul>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
