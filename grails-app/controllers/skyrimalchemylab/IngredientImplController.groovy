package skyrimalchemylab

import org.springframework.dao.DataIntegrityViolationException

class IngredientImplController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredientImplInstanceList: IngredientImpl.list(params), ingredientImplInstanceTotal: IngredientImpl.count()]
    }

    def create() {
        [ingredientImplInstance: new IngredientImpl(params)]
    }

    def save() {
        def ingredientImplInstance = new IngredientImpl(params)
        if (!ingredientImplInstance.save(flush: true)) {
            render(view: "create", model: [ingredientImplInstance: ingredientImplInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), ingredientImplInstance.id])
        redirect(action: "show", id: ingredientImplInstance.id)
    }

    def show() {
        def ingredientImplInstance = IngredientImpl.get(params.id)
        if (!ingredientImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "list")
            return
        }

        [ingredientImplInstance: ingredientImplInstance]
    }

    def edit() {
        def ingredientImplInstance = IngredientImpl.get(params.id)
        if (!ingredientImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "list")
            return
        }

        [ingredientImplInstance: ingredientImplInstance]
    }

    def update() {
        def ingredientImplInstance = IngredientImpl.get(params.id)
        if (!ingredientImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ingredientImplInstance.version > version) {
                ingredientImplInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ingredientImpl.label', default: 'IngredientImpl')] as Object[],
                        "Another user has updated this IngredientImpl while you were editing")
                render(view: "edit", model: [ingredientImplInstance: ingredientImplInstance])
                return
            }
        }

        ingredientImplInstance.properties = params

        if (!ingredientImplInstance.save(flush: true)) {
            render(view: "edit", model: [ingredientImplInstance: ingredientImplInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), ingredientImplInstance.id])
        redirect(action: "show", id: ingredientImplInstance.id)
    }

    def delete() {
        def ingredientImplInstance = IngredientImpl.get(params.id)
        if (!ingredientImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ingredientImplInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ingredientImpl.label', default: 'IngredientImpl'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
