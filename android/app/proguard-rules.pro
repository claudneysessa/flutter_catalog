-keep class androidx.lifecycle.DefaultLifecycleObserver
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}

# google_ml_kit bundles a single Dart-facing plugin that references *every*
# text-recognition script, but only the Latin model is a transitive dependency.
# The other scripts are optional artifacts, so tell R8 they may be absent.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**
-keep class com.google.mlkit.** { *; }

# Play Core / deferred components are referenced by the Flutter embedding but
# are not part of this app.
-dontwarn com.google.android.play.core.**
