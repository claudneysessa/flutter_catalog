plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin
    // Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
}

android {
    namespace = "br.com.claudneysessa.flutter_catalog"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "br.com.claudneysessa.flutter_catalog"
        // Firebase >= 4.x, google_mobile_ads and local_auth require API 23+.
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        // Add this line to resolve "unable to merge dex" error, c.f.
        // https://github.com/flutter/flutter/issues/14874.
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // Add multidex-config.pro and this line to void multidex problem
            // for API version <21.
            // Cf. https://developer.android.com/studio/build/multidex#keep.
            multiDexKeepProguard = file("multidex-config.pro")
            // Enable symbolicated native crash stack traces, cf.
            // https://developer.android.com/studio/build/shrink-code#android_gradle_plugin_version_41_or_later
            // `SYMBOL_TABLE` keeps the function names Crashlytics needs without
            // shipping the full DWARF debug info (which added ~300MB to the APK).
            ndk {
                debugSymbolLevel = "SYMBOL_TABLE"
            }
            isShrinkResources = true
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
            // Signing with the debug keys for now, so `flutter run --release`
            // works out of the box.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
    implementation("androidx.exifinterface:exifinterface:1.4.1")
    implementation("androidx.window:window:1.5.0")
    implementation("androidx.window:window-java:1.5.0")
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.3.0")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.7.0")
}
