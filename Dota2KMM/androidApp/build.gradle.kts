plugins {
    id("com.android.application")
    kotlin("android")
}

dependencies {
    implementation(project(":shared"))
    implementation("com.google.android.material:material:1.2.1")
    implementation("androidx.appcompat:appcompat:1.2.0")
    implementation("androidx.constraintlayout:constraintlayout:2.0.4")
}

android {
    compileSdkVersion(29)
    defaultConfig {
        applicationId = "com.big.dota2kmm.androidApp"
        minSdkVersion(24)
        targetSdkVersion(29)
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
        }
    }

    packagingOptions {
        exclude("META-INF/ktor-client-serialization.kotlin_module")
        exclude("META-INF/kotlinx-coroutines-io.kotlin_module")
        exclude("META-INF/atomicfu.kotlin_module")
        exclude("META-INF/kotlinx-coroutines-core.kotlin_module")
        exclude("META-INF/ktor-client-json.kotlin_module")
        exclude("META-INF/kotlinx-serialization-runtime.kotlin_module")
        exclude("META-INF/kotlinx-io.kotlin_module")
        exclude("META-INF/ktor-client-core.kotlin_module")
        exclude("META-INF/ktor-http.kotlin_module")
        exclude("META-INF/ktor-http-cio.kotlin_module")
        exclude("META-INF/ktor-utils.kotlin_module")
    }
}