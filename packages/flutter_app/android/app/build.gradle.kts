// cSpell: words Charsets
import java.util.Properties
import java.io.FileInputStream
import java.util.Base64
import java.nio.charset.StandardCharsets

plugins {
    id("com.android.application")
    id("kotlin-android")
    // For Firebase.
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(StandardCharsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

// KeyStore for release builds
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "jp.co.altive.fat"
    compileSdk = flutter.compileSdkVersion
    // Using flutter.ndkVersion will display a warning during the build process.
    ndkVersion = "27.0.12077973" 

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        // for flutter_local_notifications
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        minSdk = 23 // from flutter.minSdkVersion, for Firebase
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    signingConfigs {
        if (keystorePropertiesFile.exists()) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        getByName("release") {
            if (keystorePropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }
    
    flavorDimensions += "default"
    productFlavors {
        create("dev") {
            dimension = "default"
            applicationId = "jp.co.altive.fat.dev"
            resValue(
                type = "string",
                name = "app_name",
                value = "App.dev")
        }
        create("stg") {
            dimension = "default"
            applicationId = "jp.co.altive.fat.stg"
            resValue(
                type = "string",
                name = "app_name",
                value = "App.stg")
        }
        create("prod") {
            dimension = "default"
            applicationId = "jp.co.altive.fat"
            resValue(
                type = "string",
                name = "app_name",
                value = "App")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.3.0"))

    // Firebase libraries
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-crashlytics")
    
    // Add desugaring support for flutter_local_notifications
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
} 