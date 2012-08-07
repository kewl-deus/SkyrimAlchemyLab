package skyrimalchemylab



import org.junit.*
import grails.test.mixin.*

@TestFor(IngredientImplController)
@Mock(IngredientImpl)
class IngredientImplControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ingredientImpl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ingredientImplInstanceList.size() == 0
        assert model.ingredientImplInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ingredientImplInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ingredientImplInstance != null
        assert view == '/ingredientImpl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ingredientImpl/show/1'
        assert controller.flash.message != null
        assert IngredientImpl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientImpl/list'


        populateValidParams(params)
        def ingredientImpl = new IngredientImpl(params)

        assert ingredientImpl.save() != null

        params.id = ingredientImpl.id

        def model = controller.show()

        assert model.ingredientImplInstance == ingredientImpl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientImpl/list'


        populateValidParams(params)
        def ingredientImpl = new IngredientImpl(params)

        assert ingredientImpl.save() != null

        params.id = ingredientImpl.id

        def model = controller.edit()

        assert model.ingredientImplInstance == ingredientImpl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientImpl/list'

        response.reset()


        populateValidParams(params)
        def ingredientImpl = new IngredientImpl(params)

        assert ingredientImpl.save() != null

        // test invalid parameters in update
        params.id = ingredientImpl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ingredientImpl/edit"
        assert model.ingredientImplInstance != null

        ingredientImpl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ingredientImpl/show/$ingredientImpl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ingredientImpl.clearErrors()

        populateValidParams(params)
        params.id = ingredientImpl.id
        params.version = -1
        controller.update()

        assert view == "/ingredientImpl/edit"
        assert model.ingredientImplInstance != null
        assert model.ingredientImplInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ingredientImpl/list'

        response.reset()

        populateValidParams(params)
        def ingredientImpl = new IngredientImpl(params)

        assert ingredientImpl.save() != null
        assert IngredientImpl.count() == 1

        params.id = ingredientImpl.id

        controller.delete()

        assert IngredientImpl.count() == 0
        assert IngredientImpl.get(ingredientImpl.id) == null
        assert response.redirectedUrl == '/ingredientImpl/list'
    }
}
