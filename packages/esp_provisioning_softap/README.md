# esp_provisioning_softap

A Flutter plugin for provisioning ESP32 modules with SoftAP

[![GitHub release](https://img.shields.io/github/release/Naereen/StrapDown.js.svg)](https://github.com/nicop2000/esp_provisioning_softap/releases)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/nicop2000/esp_provisioning_softap/blob/main/LICENSE)
<!--[![pub points](https://badges.bar/sentry/pub%20points)](https://pub.dev/packages/esp_provisioning_softap/score) -->
## Example App
GIF by original pub-package [esp_softap_provisioning](https://github.com/omert08/esp_softap_provisioning)

<img src="https://raw.githubusercontent.com/omert08/esp_softap_provisioning/main/example/esp_softap_example.gif"  width="360"/>

## Comparison

Comparison to esp_provisioning:

| Repo  | softap support | ble support | cryptography | protobuf 
| ------------- | ------------- | ------------- | ------------- | -------------|
| esp_provisioning_softap  | :heavy_check_mark:  | :heavy_multiplication_x: | :heavy_check_mark: (2.0.1) | :heavy_check_mark: (2.0.0)
| esp_provisioning  | :heavy_multiplication_x:  | :heavy_check_mark: | :heavy_check_mark: (1.4.1)  | :heavy_check_mark: (1.0.1)

Last update: 24 / 03 / 2022

## Usage

Changes on pubspec.yaml
```flutter pub add esp_provisioning_softap_null_safe```

then, run ```flutter pub get```, 

We need to give permissions for http connections.

* Changes on AndroidManifest.xml (<your_app>/android/app/src/main/AndroidManifest.xml):

Add ``` <uses-permission android:name="android.permission.INTERNET"/> ``` and ```android:usesCleartextTraffic="true"``` to AndroidManifest.xml. 
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
   <uses-permission android:name="android.permission.INTERNET"/> 
   <application
         ...
         android:usesCleartextTraffic="true" 
         ...
   ...
```

* Changes on Info.plist (<your_app>/ios/Runner/Info.plist) :
```
<plist version="1.0">
<dict>
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsLocalNetworking</key>
        <true/>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>wifi-prov.local</key>
            <dict>
               <key>NSIncludesSubdomains</key>
               <true/>
               <key>NSExceptionAllowsInsecureHTTPLoads</key>
               <true/>
               <key>NSExceptionMinimumTLSVersion</key>
               <string>1.0</string>
               <key>NSExceptionRequiresForwardSecrecy</key>
               <true/>
            </dict>
        </dict>
    </dict>
    ...
```

For iOS, it's recommended to put platform version >= 9.0 , You can edit this variable from Podfile (<your_app>/ios/Podfile)

Library is ready to use, you can check example app directory for implementation. <b> Notice that Proof of posession (POP) should be matching with ESP's. </b>

## Credits
* I updated the code from the pub-package [esp_softap_provisioning](https://github.com/omert08/esp_softap_provisioning) to null safety.

The original package by Omer Taban referred to:
* I have referred to sunshine-tech [esp_provisioning](https://github.com/sunshine-tech/esp_provisioning) repository for native cipher code.

* I have referred to Espressif [esp_prov](https://github.com/espressif/esp-idf/tree/cf457d4/tools/esp_prov) repository for provisioning structure.
  
