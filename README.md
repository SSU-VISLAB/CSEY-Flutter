# Flutter WebView App
이미지 다운로드 가능

## How to Dev
1. ### [Flutter 설치](https://flutter-ko.dev/docs/get-started/install/windows)
    1. flutter 설치
    2. android emulator 설치
2. ### vs code로 프로젝트 열기
3. ### ctrl+shift+p로 명령창 열어서 Flutter: select Device 입력 및 들어가기
    1. Windows 및 브라우저는 platform이 달라서 실행 불가
    2. andriod emulator가 없을 경우 실행 불가
4. emulator 선택 후 `lib` - `main.dart`에서 Crtl + F5로 실행
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
    ├── lib
    │   ├── main.dart (main)
    │   └── downloadService.dart
    └── pubspec.yaml (package.json역할)
```
- `main.dart`
    - ### function
    - ```dart 
      initState()
      // WebView controller 세팅. webview 조작에 관한 설정들을 할 수 있다.
    - ```dart 
      Widget build(BuildContext context)
      // view 세팅. event handler를 등록할 수 있다.
    - ```dart
      Future<bool> _goBack(BuildContext context) async
      // 뒤로가기 이벤트 콜백 함수. 이전 페이지가 있으면 그 페이지로 이동, 없으면 앱 종료
    - ```dart
      void _showDownloadDialog(BuildContext context, String url)
      // javascript channel에서 메세지를 수신하면 실행시킬 함수
      // 다운로드 여부를 묻는 모달창을 하나 띄워준다.
    - ```dart
      Future<void> _downloadFile(String url) async
      //다운로드 함수. 다운로드 후 열기 기능을 제공한다.
- `downloadService.dart`
    - ```dart
      Future<void> download({required String url}) async
      // 다운로드 함수
## Usage

web에서 다음 코드와 같이 jsChannel을 통해 데이터(url)를 전송해줘야 한다.
- `main.dart` 
    ```dart
    // flutter 
    controller = WebViewController()
        ..addJavaScriptChannel('imgDownload', // 채널 이름
            onMessageReceived: (JavaScriptMessage message) { // 데이터 수신 콜백함수
        String imageUrl = message.message;
        _showDownloadDialog(context, imageUrl); // 모달창 띄우기
    })
- `html`
    ```html
    <img src="url" onclick="downloadImage(this.src)" />
- `javascript`
    ```javascript
    <script>
        function downloadImage(imageUrl) {
            window.imgDownload.postMessage(imageUrl); // window.채널이름.postMessage
        }
    </script>

## TODO
- [ ] ios 설정(안드로이드만 했음)
- [ ] 우측 하단 네비게이션 버튼 추가
- [ ] 초기 페이지 변경
- [ ] 다운로드 폴더 변경(필요시)
