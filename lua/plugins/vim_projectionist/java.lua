return {
    -- activation in java projects
    activation = 'pom.xml|build.gradle|settings.gradle|gradle.properties|gradlew',
    config = {

        -- projections for java
        ['src/main/java/*.java'] = {
            type = "source",
            alternate = { "src/test/java/{}Test.java", "src/test/java/{}ITCase.java", "src/test/java/{}Tests.java", "src/test/java/{}IT.java", "src/test/java/{}Spec.java" },
        },
        ['src/main/groovy/*.groovy'] = {
            -- type = "source",
            alternate = {
                "src/test/groovy/{}Test.groovy",
                "src/test/groovy/{}ITCase.groovy",
                "src/test/groovy/{}Tests.groovy",
                "src/test/groovy/{}Spec.groovy",
                "src/test/groovy/{}IT.groovy"
            },
        },
        ['src/test/groovy/*Test.groovy'] = {
            type = "test",
            alternate = "src/main/groovy/{}.groovy"
        },
        ['src/test/groovy/*Spec.groovy'] = {
            type = "test",
            alternate = "src/main/groovy/{}.groovy"
        },
        ['src/test/java/*Test.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*IT.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*Tests.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*ITCase.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        }
    },

}
