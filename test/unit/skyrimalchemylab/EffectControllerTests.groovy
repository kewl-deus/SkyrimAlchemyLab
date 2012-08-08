package skyrimalchemylab



import org.junit.*
import grails.test.mixin.*

@TestFor(EffectController)
@Mock(Effect)
class EffectControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/effect/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.effectInstanceList.size() == 0
        assert model.effectInstanceTotal == 0
    }

}
