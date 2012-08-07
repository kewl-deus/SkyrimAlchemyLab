package skyrimalchemylab



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(IngredientAlias)
class IngredientAliasTests {

    void testDelegation() {
        Language en = new Language(name: "Englisch", isoCode: "en")
        Effect eff = new EffectImpl(name: "Dummyeffekt", positive: true)
        IngredientImpl impl = new IngredientImpl(name: "Holz", source: "Wald", weight: 0.85, price: 17, effects: [eff])
        Ingredient alias = new IngredientAlias(name: "Wood", aliased: impl, lang: en)

        assert alias.name == "Wood"
        assert alias.source == "Wald"
        assert alias.price == 17
        assert alias.weight == impl.weight
        assert alias.providedEffects.contains(eff)
        assert alias.providedEffects == impl.providedEffects

        //call setter
        alias.price = 29
        assert alias.price == 29
        assert impl.price == 29
    }
}
