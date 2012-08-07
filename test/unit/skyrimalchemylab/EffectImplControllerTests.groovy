package skyrimalchemylab



import org.junit.*
import grails.test.mixin.*

@TestFor(EffectImplController)
@Mock(EffectImpl)
class EffectImplControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/effectImpl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.effectImplInstanceList.size() == 0
        assert model.effectImplInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.effectImplInstance != null
    }

    void testSave() {
        controller.save()

        assert model.effectImplInstance != null
        assert view == '/effectImpl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/effectImpl/show/1'
        assert controller.flash.message != null
        assert EffectImpl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/effectImpl/list'


        populateValidParams(params)
        def effectImpl = new EffectImpl(params)

        assert effectImpl.save() != null

        params.id = effectImpl.id

        def model = controller.show()

        assert model.effectImplInstance == effectImpl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/effectImpl/list'


        populateValidParams(params)
        def effectImpl = new EffectImpl(params)

        assert effectImpl.save() != null

        params.id = effectImpl.id

        def model = controller.edit()

        assert model.effectImplInstance == effectImpl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/effectImpl/list'

        response.reset()


        populateValidParams(params)
        def effectImpl = new EffectImpl(params)

        assert effectImpl.save() != null

        // test invalid parameters in update
        params.id = effectImpl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/effectImpl/edit"
        assert model.effectImplInstance != null

        effectImpl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/effectImpl/show/$effectImpl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        effectImpl.clearErrors()

        populateValidParams(params)
        params.id = effectImpl.id
        params.version = -1
        controller.update()

        assert view == "/effectImpl/edit"
        assert model.effectImplInstance != null
        assert model.effectImplInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/effectImpl/list'

        response.reset()

        populateValidParams(params)
        def effectImpl = new EffectImpl(params)

        assert effectImpl.save() != null
        assert EffectImpl.count() == 1

        params.id = effectImpl.id

        controller.delete()

        assert EffectImpl.count() == 0
        assert EffectImpl.get(effectImpl.id) == null
        assert response.redirectedUrl == '/effectImpl/list'
    }
}
