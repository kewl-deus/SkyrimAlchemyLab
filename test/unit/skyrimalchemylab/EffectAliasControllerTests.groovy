package skyrimalchemylab



import org.junit.*
import grails.test.mixin.*

@TestFor(EffectAliasController)
@Mock(EffectAlias)
class EffectAliasControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/effectAlias/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.effectAliasInstanceList.size() == 0
        assert model.effectAliasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.effectAliasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.effectAliasInstance != null
        assert view == '/effectAlias/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/effectAlias/show/1'
        assert controller.flash.message != null
        assert EffectAlias.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/effectAlias/list'


        populateValidParams(params)
        def effectAlias = new EffectAlias(params)

        assert effectAlias.save() != null

        params.id = effectAlias.id

        def model = controller.show()

        assert model.effectAliasInstance == effectAlias
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/effectAlias/list'


        populateValidParams(params)
        def effectAlias = new EffectAlias(params)

        assert effectAlias.save() != null

        params.id = effectAlias.id

        def model = controller.edit()

        assert model.effectAliasInstance == effectAlias
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/effectAlias/list'

        response.reset()


        populateValidParams(params)
        def effectAlias = new EffectAlias(params)

        assert effectAlias.save() != null

        // test invalid parameters in update
        params.id = effectAlias.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/effectAlias/edit"
        assert model.effectAliasInstance != null

        effectAlias.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/effectAlias/show/$effectAlias.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        effectAlias.clearErrors()

        populateValidParams(params)
        params.id = effectAlias.id
        params.version = -1
        controller.update()

        assert view == "/effectAlias/edit"
        assert model.effectAliasInstance != null
        assert model.effectAliasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/effectAlias/list'

        response.reset()

        populateValidParams(params)
        def effectAlias = new EffectAlias(params)

        assert effectAlias.save() != null
        assert EffectAlias.count() == 1

        params.id = effectAlias.id

        controller.delete()

        assert EffectAlias.count() == 0
        assert EffectAlias.get(effectAlias.id) == null
        assert response.redirectedUrl == '/effectAlias/list'
    }
}
