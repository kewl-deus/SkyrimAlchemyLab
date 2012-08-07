<%@ page import="skyrimalchemylab.EffectAlias" %>



<div class="fieldcontain ${hasErrors(bean: effectAliasInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="effectAlias.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${effectAliasInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: effectAliasInstance, field: 'aliased', 'error')} required">
	<label for="aliased">
		<g:message code="effectAlias.aliased.label" default="Aliased" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aliased" name="aliased.id" from="${skyrimalchemylab.Effect.list()}" optionKey="id" required="" value="${effectAliasInstance?.aliased?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: effectAliasInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="effectAlias.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lang" name="lang.id" from="${skyrimalchemylab.Language.list()}" optionKey="id" required="" value="${effectAliasInstance?.lang?.id}" class="many-to-one"/>
</div>

