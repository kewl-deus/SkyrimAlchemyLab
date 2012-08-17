<%@ page import="skyrimalchemylab.Effect" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">

    <g:set var="entityName" value="${message(code: 'effect.label', default: 'Effect')}"/>

    <r:require modules="bootstrap-css"/>

    <title>Effekte</title>
</head>

<body>
<a href="#list-effect" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-effect" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="pagination">
        <ul>
            <g:if test="${pagination.previous}">
                <li>
                    <g:link action="list" params="[startsWith: pagination.previous]">Prev</g:link>
                </li>
            </g:if>

            <g:each in="${pagination.letters}" var="letter">
                <g:if test="${pagination.current == letter}">
                    <li class="active">
                        <g:link action="list" params="[startsWith: letter]">${letter}</g:link>
                    </li>
                </g:if>
                <g:else>
                    <li>
                        <g:link action="list" params="[startsWith: letter]">${letter}</g:link>
                    </li>
                </g:else>

            </g:each>
            <g:if test="${pagination.next}">
                <li>
                    <g:link action="list" params="[startsWith: pagination.next]">Next</g:link>
                </li>
            </g:if>
        </ul>
    </div>


    <table>
        <thead>
        <tr>
            <th>Effekt</th>
            <th>Zutaten mit Effekt</th>
            <th>Aliases</th>
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
                            <span class="label label-important">toxic</span>
                        </g:else>
                    </g:link>
                </td>

                <td>
                    <ul>
                        <g:each in="${ingredientsWithEffect[effectInstance.id]}" var="ing">
                            <li>
                                <g:link action="show" id="${ing.id}">${ing.name}</g:link>
                            </li>
                        </g:each>
                    </ul>
                </td>

                <td>
                    <ul>
                        <g:each in="${effectAliases[effectInstance.id]}" var="effAlias">
                            <li>
                                <g:link action="show" id="${effAlias.id}">${effAlias.name}</g:link>
                                <span class="label label-info">${effAlias.lang.isoCode}</span>
                            </li>
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
