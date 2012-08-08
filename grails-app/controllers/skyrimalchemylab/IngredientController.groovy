package skyrimalchemylab


class IngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredientInstanceList: Ingredient.list(params), ingredientInstanceTotal: Ingredient.count()]
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
