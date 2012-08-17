package skyrimalchemylab


class EffectController {

    def alchemyService

    static allowedMethods = [index: "GET", list: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def effectLetters = EffectImpl.list().collect { it.name[0] }

        def pagination = ControllerUtils.createAlphabeticPagination(effectLetters, params.startsWith)

        def effects = EffectImpl.createCriteria().list {
            like 'name', pagination.current + '%'
        }

        def ingMap = [:]
        effects.each { eff ->
            ingMap[eff.id] = alchemyService.findIngredientsWithEffect(eff)
        }

        def aliasMap = [:]
        effects.each {eff ->
            aliasMap[eff.id] = alchemyService.findAliases(eff)
        }

        return [
                effectInstanceList: effects,
                ingredientsWithEffect: ingMap,
                pagination: pagination,
                effectAliases: aliasMap
                ]
    }

    def show() {
        if (EffectImpl.get(params.id)){
            redirect(controller: "effectImpl", action: "show", params: params)
        } else {
            redirect(controller: "effectAlias", action: "show", params: params)
        }
    }

    def edit() {
        if (EffectImpl.get(params.id)){
            redirect(controller: "effectImpl", action: "edit", params: params)
        } else {
            redirect(controller: "effectAlias", action: "edit", params: params)
        }
    }
}
