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
  8. url_launcher패키지 설치하여 앱에서 웹사이트 열기
  >  "flutter pub add url_launcher"
> xml을 AndroidManifest.xml파일에 추가해야된다.
  9. launchUrl은 Future을 가져다 주는 기능이기 때문에 await를 써줘야 한다.
```
onButtonTap() async{
    //final url = Uri.parse("https://google.com");
    await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }
```

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
- 원래는 setState()를 사용해서 화면을 업데이트해줘야 해서 statefulwidget로
만들었는데, FutureBuilder를 사용해서 비동기 작업을 처리해주는 위젯을 사용하니까 statelesswidget사용가능
```
ex)body: FutureBuilder(
  future: webtoons,
  builder: (context,snapshot){
  if(snapshot.hasData){
  return const Text('There is data!');
  }
  return const Text('Loading....');
  },
  )
  ```
- CircularProgressIndicator() -> 프로그래스바 표시
- ListView사용법
```
return ListView(
              children: [
                for(var webtoon in snapshot.data!) Text(webtoon.title)
              ],
            );
```
- ListView와 ListView.builder의 차이점
> LisetView는 한번에 모든 데이터를 가져오지만 builder는 필요할 부분만 가져온다.
- ListView.separated를 사용해서 각 아이템들을 분리할 수 있다.
>  return ListView.separated( separatorBuilder: (context, index) => SizedBox(
width: 20,
),
-  Image.network(webtoon.thumb) - 이미지를 url경로로 설정한다.
- 시뮬레이터에서 403에러 날 때 사용
```
 Image.network( webtoon.thumb,
                    headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",},),
                  Text(webtoon.title)
```
-   borderRadius: BorderRadius.circular(10)를 사용했는데 적용안될 경우
> clipBehavior때문이다. 이것은 자식의 부모영역 침범을 제어하는 방법이다. => clipBehavior: Clip.hardEdge,

- 클릭 이벤트 감지 (GestureDetector) - 위젯의 한 종류
> return GestureDetector(
onTap: (){ };
- MaterialPageRoute
>하나의 클래스이며 statelesswidget을 route로 감싸서 다른 스크린처럼 보여줌
> fullscreenDialog: true 하면 스크린이 아래서 올라옴 아이콘은 X로(안하면 옆에서, 아이콘은 뒤로가기)
- HeroWidget
> 화면을 전환활 때 애니메이션을 제공하는 위젯, 두 개의 화면에 각각사용하고 같은 태그를 사용한다, 컨테이너에 위젯 적용