package skyrimalchemylab

import org.springframework.dao.DataIntegrityViolationException

class EffectImplController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [effectImplInstanceList: EffectImpl.list(params), effectImplInstanceTotal: EffectImpl.count()]
    }

    def create() {
        [effectImplInstance: new EffectImpl(params)]
    }

    def save() {
        def effectImplInstance = new EffectImpl(params)
        if (!effectImplInstance.save(flush: true)) {
            render(view: "create", model: [effectImplInstance: effectImplInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), effectImplInstance.id])
        redirect(action: "show", id: effectImplInstance.id)
    }

    def show() {
        def effectImplInstance = EffectImpl.get(params.id)
        if (!effectImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "list")
            return
        }

        [effectImplInstance: effectImplInstance]
    }

    def edit() {
        def effectImplInstance = EffectImpl.get(params.id)
        if (!effectImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "list")
            return
        }

        [effectImplInstance: effectImplInstance]
    }

    def update() {
        def effectImplInstance = EffectImpl.get(params.id)
        if (!effectImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (effectImplInstance.version > version) {
                effectImplInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'effectImpl.label', default: 'EffectImpl')] as Object[],
                        "Another user has updated this EffectImpl while you were editing")
                render(view: "edit", model: [effectImplInstance: effectImplInstance])
                return
            }
        }

        effectImplInstance.properties = params

        if (!effectImplInstance.save(flush: true)) {
            render(view: "edit", model: [effectImplInstance: effectImplInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), effectImplInstance.id])
        redirect(action: "show", id: effectImplInstance.id)
    }

    def delete() {
        def effectImplInstance = EffectImpl.get(params.id)
        if (!effectImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "list")
            return
        }

        try {
            effectImplInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'effectImpl.label', default: 'EffectImpl'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
