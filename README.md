# flutter_webtoon_app

A new Webtoon project by Flutter.

## Getting Started
# 웹툰 클론 프로젝트
- 사용 기술 
  1. 데이터 불러오기
  2. 인터넷에서 패키지 다운 받아 사용하기
  3. 스마트폰의 API 사용하기 - API에서 받을 응답 : ** 제목, URL, ID **
  4. 스마트폰에 데이터 저장하기
  5. 캐러셀 사용
  6. Http request 라이브러리 설치 
    -   1. pubspec.yaml dependecies에 http: ^0.13.5설치
    -   2. 터미널에 flutter pub add http 커멘드 실행
    -   3. 터미널에 dart pub add http 커맨드 실행 
  7. https://webtoon-crawler.nomadcoders.workers.dev/ 링크 사용

# 새로 안 정보들
- 위젯은 key를 가지고 있고, Id처럼 사용한다.
- Scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공한다.
- centerTitle: true, //가운데정렬
- elevation: 0, //음영 제거
- await는 async 함수 내에서만 사용할 수 있다.
- Future - 미래에 받을 값의 타입을 알려줌, 즉 함수가 바로 처리되는 게 아니다.
  - 비동기일 때 Dart가 그냥 다음 코드로 넘어가는 걸 원치 않을 때
  - 요청의 결과값이 중요하기 때문에
  - await를 사용한다.
- jsonDecode를 사용하여 String을 json파일로 변환할 수 있다.(반환값은 dynamic)