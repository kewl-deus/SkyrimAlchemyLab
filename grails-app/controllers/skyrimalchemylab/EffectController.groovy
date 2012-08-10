package skyrimalchemylab


class EffectController {

    def alchemyService

    static allowedMethods = [index: "GET", list: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def startsWith = 'A'
        if (params.startsWith) startsWith = params.startsWith

        def effectIndexLetters = EffectImpl.list().collect { it.name[0] }.toSet().sort()

        def effectIndexLinks = effectIndexLetters.collect { letter ->
            link(controller: 'effect', action: 'list', params: [startsWith: letter], letter)
        }

        def effects = EffectImpl.createCriteria().list {
            like 'name', startsWith + '%'
        }

        def ingMap = [:]

        effects.each { eff ->
            def ingsWithEffect = alchemyService.findIngredientsWithEffect(eff)
            ingMap[eff.id] = ingsWithEffect
                    .collect { link(controller: 'ingredientImpl', action: 'show', id: it.id, it.name) }
                    //.join(", ")
        }

        return [
                effectInstanceList: effects,
                effectInstanceTotal: EffectImpl.count(),
                ingredientsWithEffect: ingMap,
                effectIndexLinks: effectIndexLinks]
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
