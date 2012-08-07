package skyrimalchemylab

import grails.test.mixin.*
import org.junit.*

@Mock([EffectImpl, EffectAlias, IngredientImpl, IngredientAlias, Language])
class IngredientBuilderTest {

    @Test
    void testBuildIngredient() {
        Language lang = new Language(name:"Englisch", isoCode: "en")
        lang.save()

        EffectBuilder eb = new EffectBuilder(lang)
        def e1 = eb.effect("pos eff", '+')
        def e2 = eb.effect("neg eff", '-')
        def e3 = eb.effect("noch ein eff", '+')
        def e3alias = eb.alias("another eff", "noch ein eff")
        eb.withEffects {eff -> eff.save() }

        IngredientBuilder ib = new IngredientBuilder(lang)
        def ing = ib.ingredient(name: "Geheime Zutat", price: 15, weight: 0.5, source: "irgendwoher", effects: [e1, "neg eff", "another eff"])
        
        assert ing.name == "Geheime Zutat"
        assert ing.price == 15
        assert ing.weight == 0.5
        assert ing.source == "irgendwoher"
        assert ing.effects.size() == 3
        assert ing.effects.contains(e1)
        assert ing.effects.contains(e2)
        assert ing.effects.contains(e3alias)

    }

    @Test
    void testBuildAlias() {
        EffectBuilder eb = new EffectBuilder()

        def e1 = eb.effect("pos eff", '+')
        def e2 = eb.effect("neg eff", '-')

        IngredientBuilder ib = new IngredientBuilder(new Language(name:"Englisch", isoCode: "en"))
        def ing = ib.ingredient(name: "Geheime Zutat", price: 15, weight: 0.5, source: "irgendwoher", effects: [e1, e2])

        def ingAlias = ib.alias("Secret Ingredient", "Geheime Zutat")

        assert ingAlias.name == "Secret Ingredient"
        assert ingAlias.lang.isoCode == "en"
        assert ingAlias.aliased == ing
        assert ingAlias.providedEffects.size() == 2
        assert ingAlias.providedEffects.contains(e1)
        assert ingAlias.providedEffects.contains(e2)
    }
}
