import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon_app/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/webtoon_detail_model.dart';
import '../model/webtoon_episode_model.dart';
import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 2, //음영 제거
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
        widget.title, style: const TextStyle(
        fontSize: 24,
    ),
    ),
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
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
                      child: Image.network(widget.thumb,
                        headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",},),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context,snapshot){
                  if(snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 12,
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${snapshot.data!.genre} /'
                              '${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: episodes,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children: [
                          for(var episode in snapshot.data!)
                            Episode(episode: episode,webtoonId: widget.id),
                        ],
                      );
                    }
                    return Container();
              },)
            ],
          ),
        ),
      ),
    );
  }
}
//
// class Episode extends StatelessWidget {
//   const Episode({
//     Key? key,
//     required this.episode,
//   }) : super(key: key);
//
//   final WebtoonEpisodeModel episode;
//
//   onButtonTap() async{
//     //final url = Uri.parse("https://google.com");
//     await launchUrlString("https://google.com");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.green.shade400,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: 10,horizontal: 20,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(episode.title
//             ,style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),),
//             const Icon(Icons.chevron_right_rounded,
//             color: Colors.white,),
//           ],
//         ),
//       ),
//     );
//   }
// }
