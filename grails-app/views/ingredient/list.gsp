<%@ page import="skyrimalchemylab.Ingredient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">

    <g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}"/>

    <r:require modules="bootstrap-css"/>

    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
        </li>
        <li>
            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
        </li>
    </ul>
</div>

<div id="list-ingredient" class="content scaffold-list" role="main">
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

            <th><g:message code="ingredient.name.label" default="Name"/></th>

            <th>Effekte</th>

            <!--
						<th>Zutaten mit selben Effekten</th>
						-->

            <th>Aliases</th>

            <th><g:message code="ingredient.source.label" default="Herkunft"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${ingredientInstance.id}">${fieldValue(bean: ingredientInstance, field: "name")}</g:link></td>


                <td>
                    <ul>
                        <g:each in="${ingredientInstance.providedEffects.sort({it.name})}" var="eff">
                            <li><g:link action="show" controller="effect" id="${eff.id}">${eff.name}</g:link></li>
                        </g:each>
                    </ul>
                </td>

                <!--
                        <td>
                            <ul>
                            -->
                <!-- g:render template="ingsWithSameEffect"/ -->
                <!--
                            </ul>
                        </td>
                        -->

                <td>
                    <ul>
                        <g:each in="${ingredientAliases[ingredientInstance.id]}" var="ingAlias">
                            <li>
                                <g:link action="show" id="${ingAlias.id}">${ingAlias.name}</g:link>
                                <span class="label label-info">${ingAlias.lang.isoCode}</span>
                            </li>
                        </g:each>
                    </ul>
                </td>

                <td>${fieldValue(bean: ingredientInstance, field: "source")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>
