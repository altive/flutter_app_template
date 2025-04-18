pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // 最新バージョンはここで確認：Google Services Gradle Plugin
    // https://mvnrepository.com/artifact/com.android.tools.build/gradle
    id("com.android.application") version "8.7.0" apply false
    // 最新バージョンはここで確認：Kotlin Releases
    // https://kotlinlang.org/docs/releases.html#release-details
    id("org.jetbrains.kotlin.android") version "2.1.20" apply false
    // 最新バージョンはここで確認：Firebase Android SDK Release Notes
    // https://firebase.google.com/support/release-notes/android
    id("com.google.gms.google-services") version "4.4.2" apply false
    id("com.google.firebase.crashlytics") version "2.9.9" apply false
}

include(":app") 