import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });
  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    // final url = Uri.parse('https://google.com');
    // await launchUrl(url);
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green.shade500,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  episode.title,
                  style: TextStyle(
                    color: Colors.green.shade500,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.green.shade500,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
