package skyrimalchemylab



import org.junit.*
import grails.test.mixin.*

@TestFor(IngredientAliasController)
@Mock(IngredientAlias)
class IngredientAliasControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ingredientAlias/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ingredientAliasInstanceList.size() == 0
        assert model.ingredientAliasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ingredientAliasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ingredientAliasInstance != null
        assert view == '/ingredientAlias/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ingredientAlias/show/1'
        assert controller.flash.message != null
        assert IngredientAlias.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientAlias/list'


        populateValidParams(params)
        def ingredientAlias = new IngredientAlias(params)

        assert ingredientAlias.save() != null

        params.id = ingredientAlias.id

        def model = controller.show()

        assert model.ingredientAliasInstance == ingredientAlias
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientAlias/list'


        populateValidParams(params)
        def ingredientAlias = new IngredientAlias(params)

        assert ingredientAlias.save() != null

        params.id = ingredientAlias.id

        def model = controller.edit()

        assert model.ingredientAliasInstance == ingredientAlias
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ingredientAlias/list'

        response.reset()


        populateValidParams(params)
        def ingredientAlias = new IngredientAlias(params)

        assert ingredientAlias.save() != null

        // test invalid parameters in update
        params.id = ingredientAlias.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ingredientAlias/edit"
        assert model.ingredientAliasInstance != null

        ingredientAlias.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ingredientAlias/show/$ingredientAlias.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ingredientAlias.clearErrors()

        populateValidParams(params)
        params.id = ingredientAlias.id
        params.version = -1
        controller.update()

        assert view == "/ingredientAlias/edit"
        assert model.ingredientAliasInstance != null
        assert model.ingredientAliasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ingredientAlias/list'

        response.reset()

        populateValidParams(params)
        def ingredientAlias = new IngredientAlias(params)

        assert ingredientAlias.save() != null
        assert IngredientAlias.count() == 1

        params.id = ingredientAlias.id

        controller.delete()

        assert IngredientAlias.count() == 0
        assert IngredientAlias.get(ingredientAlias.id) == null
        assert response.redirectedUrl == '/ingredientAlias/list'
    }
}
