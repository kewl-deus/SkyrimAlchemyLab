package skyrimalchemylab


class IngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def alchemyService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        if (!session.lang){
            session.lang = grailsApplication.config.skyrim.alchemylab.default.lang
        }
        Language lang = Language.findByIsoCode(session.lang)

        def startsWith = 'A'
        if (params.startsWith) startsWith = params.startsWith

        def pagination = [:]
        pagination.current = startsWith
        pagination.letters = Ingredient.findAllByLang(lang).collect { it.name[0] }.unique().sort()
        int currentIndex = pagination.letters.indexOf(startsWith)
        if (currentIndex > 0){
            pagination.previous = pagination.letters[currentIndex - 1]
        }
        if (currentIndex < pagination.letters.size()){
            pagination.next = pagination.letters[currentIndex + 1]
        }


        def ingredients = Ingredient.createCriteria().list {
            eq  'lang', lang
            like 'name', startsWith + '%'
        }

        /*
        def ingredientsWithSameEffect = [:]
        ingredients.collect{ ing ->
            def ingsWithSame = ing.effects
                    .collect { eff -> alchemyService.findIngredientsWithEffect(eff)}
                    .flatten()
                    .unique()
                    .sort { it.name }
            ingsWithSame.remove(ing)
            ingredientsWithSameEffect[ing.id] = ingsWithSame
        }
        */

        def ingredientAliases = [:]
        ingredients.collect{ ing ->
            ingredientAliases[ing.id] = alchemyService.findAliases(ing)
        }

        return [ingredientInstanceList: ingredients,
                //ingredientsWithSameEffect: ingredientsWithSameEffect,
                ingredientAliases: ingredientAliases,
                pagination: pagination
               ]
    }


    def show() {
        if (IngredientImpl.get(params.id)){
            redirect(controller: "ingredientImpl", action: "show", params: params)
        } else {
            redirect(controller: "ingredientAlias", action: "show", params: params)
        }
    }

    def edit() {
        if (IngredientImpl.get(params.id)){
            redirect(controller: "ingredientImpl", action: "edit", params: params)
        } else {
            redirect(controller: "ingredientAlias", action: "edit", params: params)
        }
    }
}
