import 'package:flutter/material.dart';
import 'package:flutter_webtoon_app/services/api_service.dart';

import '../model/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, //음영 제거
        centerTitle: true, //가운데정렬
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text("오늘의 웹툰"
        ,style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Column(
              children: [
                SizedBox(height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            itemBuilder: (context, index) {
              var webtoon = snapshot.data![index];
              return Column(
                children: [
                  Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: Offset(10,10),
                          color: Colors.black.withOpacity(0.5)
                        ),
                      ],
                    ),
                    child: Image.network( webtoon.thumb,
                      headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",},),
                  ),
                  SizedBox(height: 10,),
                  Text(webtoon.title,
                  style: TextStyle(
                    fontSize: 22,
                  ),)
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          );
  }
}
