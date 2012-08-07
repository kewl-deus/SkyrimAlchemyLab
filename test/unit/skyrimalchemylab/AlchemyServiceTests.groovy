package skyrimalchemylab



import grails.test.mixin.*
import org.junit.Before
import org.junit.Ignore

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(AlchemyService)
@Mock([EffectImpl, EffectAlias, IngredientImpl, IngredientAlias, Language])
class AlchemyServiceTests {

    @Before
    void insertLanguages(){
        Language langDE = new Language(name: "Deutsch", isoCode: "de")
        langDE.save(flush: true)
        Language langEN = new Language(name: "Englisch", isoCode: "en")
        langEN.save(flush: true)
    }

    @Ignore("tested withing ingredients insertion")
    void testEffectInsertion() {
        assert EffectImpl.count() == 0
        assert EffectAlias.count() == 0

        def service = new AlchemyService()
        service.insertEffects()
        service.insertEffectAliases()

        assert EffectImpl.count() > 0
        assert EffectAlias.count() > 0
    }

    void testIngredientInsertion() {

        def service = new AlchemyService()

        //effects are needed for building ingredients
        assert EffectImpl.count() == 0
        assert EffectAlias.count() == 0

        service.insertEffects()
        service.insertEffectAliases()

        assert EffectImpl.count() > 0
        assert EffectAlias.count() > 0

        //ingredients

        assert IngredientImpl.count() == 0
        assert IngredientAlias.count() == 0

        service.insertIngredients()
        service.insertIngredientAliases()

        assert IngredientImpl.count() > 0
        assert IngredientAlias.count() > 0
    }
}
