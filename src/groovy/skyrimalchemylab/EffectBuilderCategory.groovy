package skyrimalchemylab


class EffectBuilderCategory {

    /**
     * usage:
     * use(EffectBuilderCategory){
     *  effect(name, nature)
     * }
     * @param builder
     * @param name
     * @param nature
     * @return
     */
    static EffectImpl effect(EffectBuilder builder, String name, String nature){
        builder.effect(name, nature)
    }
}
