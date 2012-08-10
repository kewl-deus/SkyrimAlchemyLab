package skyrimalchemylab


class IngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        if (!session.lang){
            session.lang = grailsApplication.config.skyrim.alchemylab.default.lang
        }
        Language lang = Language.findByIsoCode(session.lang)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredientInstanceList: Ingredient.findByLang(lang, params), ingredientInstanceTotal: Ingredient.countByLang(lang)]
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
