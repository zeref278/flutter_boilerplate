import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.boilerplate.boilerplate.dev"
            resValue(type = "string", name = "app_name", value = "Boilerplate Dev")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.boilerplate.boilerplate"
            resValue(type = "string", name = "app_name", value = "Boilerplate")
        }
    }

    buildFeatures.resValues = true
}