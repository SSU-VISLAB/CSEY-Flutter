# Flutter WebView App
이미지 다운로드 가능

## How to Dev
1. ### [Flutter 설치](https://flutter-ko.dev/docs/get-started/install/windows)
    1. flutter 설치
    2. android emulator 설치 (기기 종류 상관 없음)
2. ### vs code로 프로젝트 열기
3. ### 패키지 설치
    #### 터미널
    ```bash
    flutter pub get
    ```
    #### 혹은 VS Code
        pubspec.yaml 파일 열고 우측 상단에 get packages 버튼(다운로드 아이콘) 클릭
4. ### ctrl+shift+p로 명령창 열어서 Flutter: select Device 입력 및 들어가기
    1. Windows 및 브라우저는 platform이 달라서 실행 불가
    2. andriod emulator가 없을 경우 실행 불가
5. emulator 선택 후 `lib` - `main.dart`에서 Crtl + F5로 실행

## Files
```bash
project
    ├── android
    │   └── app
    │       ├── debug
    │       │   └── AndroidManifest.xml
    │       ├── main
    │       │   └── AndroidManifest.xml
    │       └── profile
    │           └── AndroidManifest.xml
    ├── pubspec.yaml
    └── lib
        ├── browser.dart
        ├── custom_image.dart
        ├── custom_popup_dialog.dart
        ├── custom_popup_menu_item.dart
        ├── long_press_alert_dialog.dart
        ├── main.dart
        ├── material_transparent_page_route.dart
        ├── multiselect_dialog.dart
        ├── util.dart
        ├── webview_window.dart
        |
        ├─ floating_button
        |    └── floating_bubble.dart
        |       
        ├─ models
        |    ├─ download_model.dart
        |    └─ webview_model.dart
        |       
        └─ pages
            └─ settings
                ├── android_settings.dart
                ├── cross_platform_settings.dart
                ├── ios_settings.dart
                └── main.dart
```

## TODO
- [ ] ios 설정(안드로이드만 했음)
- [ ] 초기 페이지 변경
- [ ] 다운로드 폴더 변경 팝업(필요시)
