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

// Extract dart-defines properties.
val dartDefines = mutableMapOf<String, String>()
if (project.hasProperty("dart-defines")) {
    dartDefines.putAll(project.property("dart-defines")
        .toString()
        .split(",")
        .map { entry ->
            val pair = String(Base64.getDecoder().decode(entry), StandardCharsets.UTF_8).split("=")
            if (pair.size == 2) pair[0] to pair[1] else null
        }
        .filterNotNull()
        .toMap())
}

// フレーバー依存のリソースをコピーするタスク
tasks.register<Copy>("copyFlavorResources") {
    val flavor = dartDefines["flavor"] ?: return@register
    
    // Google Servicesの設定ファイルをコピー
    from("src/$flavor/google-services.json")
    into(projectDir) // appディレクトリにコピー
    
    // フレーバー固有のリソースをコピー
    from("src/$flavor/res")
    into("src/main/res")
    
    // 必要なリソースが存在するかチェック
    doFirst {
        val googleServicesFile = file("src/$flavor/google-services.json")
        if (!googleServicesFile.exists()) {
            logger.warn("Warning: google-services.json for flavor '$flavor' not found at ${googleServicesFile.absolutePath}")
        }
    }
}

// タスク依存関係を明示的に設定
tasks.whenTaskAdded {
    // デバッグビルド関連タスク
    if (name == "generateDebugResources" || name == "processDebugResources") {
        dependsOn("copyFlavorResources")
    }
    // リリースビルド関連タスク
    if (name == "generateReleaseResources" || name == "processReleaseResources") {
        dependsOn("copyFlavorResources")
    }
    // Firebase関連タスク
    if (name == "processDebugGoogleServices" || name == "processReleaseGoogleServices") {
        dependsOn("copyFlavorResources")
    }
    // Flutter関連タスク
    if (name.startsWith("compile") && name.contains("Flutter")) {
        dependsOn("copyFlavorResources")
    }
}

android {
    namespace = "jp.co.altive.fat"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = 27.0.12077973 // flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        // for flutter_local_notifications
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
            res.srcDirs("src/main/res")
        }
    }

    defaultConfig {
        applicationId = dartDefines["appId"] ?: ""
        minSdk = 23 // from flutter.minSdkVersion, for Firebase
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
        resValue("string", "app_name", dartDefines["appName"] ?: "")
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
        release {
            if (keystorePropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
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