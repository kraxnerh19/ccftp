import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    id("org.springframework.boot") version "2.7.5"
    id("io.spring.dependency-management") version "1.0.15.RELEASE"
    kotlin("jvm") version "1.6.21"
    kotlin("plugin.spring") version "1.6.21"
    kotlin("plugin.jpa") version "1.6.21"
}

group = "com.cbhk"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_17

repositories {
    mavenCentral()
}

dependencies {
    dependencies {
        implementation("org.springframework.boot:spring-boot-starter-validation")
        implementation("org.springframework.boot:spring-boot-starter-data-jpa")
        implementation("org.springframework.boot:spring-boot-starter-web")
        implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
        implementation("org.jetbrains.kotlin:kotlin-reflect")
        implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
        implementation("org.mariadb.jdbc:mariadb-java-client:3.0.3")
        compileOnly("org.apache.tomcat.embed:tomcat-embed-jasper")
        implementation("javax.servlet:jstl")
        testImplementation("org.springframework.boot:spring-boot-starter-test")
        implementation("org.webjars:bootstrap:5.1.3")
        // spring-security-taglibs
        implementation("org.springframework.security:spring-security-taglibs")
        // https://mvnrepository.com/artifact/org.webjars/chartjs
        implementation("org.webjars:chartjs:3.9.1")
        // https://mvnrepository.com/artifact/com.google.code.gson/gson
        implementation("com.google.code.gson:gson:2.8.9")
        implementation("org.thymeleaf:thymeleaf:2.0.5")
        // https://mvnrepository.com/artifact/commons-io/commons-io
        implementation("commons-io:commons-io:2.6")
        // https://mvnrepository.com/artifact/org.json/json
        implementation("org.json:json:20090211")
    }
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        freeCompilerArgs = listOf("-Xjsr305=strict")
        jvmTarget = "17"
    }
}

tasks.withType<Test> {
    useJUnitPlatform()
}
