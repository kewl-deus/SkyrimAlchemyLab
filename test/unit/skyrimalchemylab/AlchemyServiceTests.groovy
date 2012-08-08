package skyrimalchemylab



import grails.test.mixin.*
import org.junit.Before
import org.junit.Ignore

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(AlchemyService)
@Mock([IngredientImpl, EffectImpl, Language])
class AlchemyServiceTests {


    void testFindIngredientsWithEffect(){
        Language lang = new Language(name: "Deutsch", isoCode: "de")
        lang.save()

        10.times { i ->
            new EffectImpl(name: "eff${i+1}", lang: lang).save()
        }

        IngredientBuilder ib = new IngredientBuilder(lang)
        ib.ingredient(name: "ing1", effects: ["eff1", "eff2", "eff3", "eff4"])
        ib.ingredient(name: "ing2", effects: ["eff2", "eff3"])
        ib.ingredient(name: "ing3", effects: ["eff3", "eff5", "eff7"])
        ib.withIngredients { ing -> ing.save() }

        println "effs: $EffectImpl.count"
        println "ings: $IngredientImpl.count"

        def onlyEff1 = service.findIngredientsWithEffect("eff1")
        assert onlyEff1.size() == 1
        assert onlyEff1.get(0).name == "eff1"
    }

}
