package skyrimalchemylab

import org.junit.Test

class EffectBuilderTests {

    @Test
    void testEffectBuilding(){
        def eb = new EffectBuilder(new Language(name: "Deutsch", isoCode: "de"))
        def anfBlitz = eb.effect ("Anfälligkeit für Blitz", '-')
        def ausRegen = eb.effect ("Ausdauer regenerieren", '+')
        
        int counter = 0
        
        eb.withEffects { Effect eff ->
            EffectImpl ei = (EffectImpl) eff
            if (ei.name == "Anfälligkeit für Blitz") assert ei.positive == false
            if (ei.name == "Ausdauer regenerieren") assert ei.positive == true
            counter++
        }
        assert counter == 2

        assert anfBlitz.negative == true
        assert ausRegen.negative == false
    }

    @Test
    void testAliasBuilding(){
        def eb = new EffectBuilder(new Language(name: "Englisch", isoCode: "en"))
        EffectImpl eff = eb.effect("Lähmen", '-')
        EffectAlias alias = eb.alias("Paralyze", "Lähmen")

        assert alias.lang.isoCode == "en"
        assert alias.name == "Paralyze"
        assert alias.aliased == eff
        assert alias.aliased.name == "Lähmen"
        assert alias.aliased.positive == false

    }
}
