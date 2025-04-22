// // ignore: file_names
// class PodcastModal {
//   final String audio;
//   final String title;
//   final String image;
//   final String id;

//   const PodcastModal(
//       {required this.audio,
//       required this.title,
//       required this.image,
//       required this.id});

//   factory PodcastModal.fromJson(Map<String, dynamic> json) => PodcastModal(
//       audio: json['audio'] ?? '',
//       title: json['title_original'] ?? '',
//       image: json['image'] ?? '',
//       id: json['id'] ?? '');

//   Map<String, dynamic> toJson() =>
//       {'audio': audio, 'title_original': title, 'image': image, 'id': id};
// }

// To parse this JSON data, do
//
//     final podcastModal = podcastModalFromJson(jsonString);

import 'dart:convert';

PodcastModal podcastModalFromJson(String str) =>
    PodcastModal.fromJson(json.decode(str));

String podcastModalToJson(PodcastModal data) => json.encode(data.toJson());

class PodcastModal {
  final double took;
  final int count;
  final int total;
  final List<Result> results;
  final int nextOffset;

  PodcastModal({
    required this.took,
    required this.count,
    required this.total,
    required this.results,
    required this.nextOffset,
  });

  factory PodcastModal.fromJson(Map<String, dynamic> json) => PodcastModal(
        took: json["took"]?.toDouble(),
        count: json["count"],
        total: json["total"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextOffset: json["next_offset"],
      );

  Map<String, dynamic> toJson() => {
        "took": took,
        "count": count,
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "next_offset": nextOffset,
      };
}

class Result {
  final String id;
  final String rss;
  final String link;
  final String audio;
  final String image;
  final Podcast podcast;
  final int itunesId;
  final String thumbnail;
  final int pubDateMs;
  final String guidFromRss;
  final String titleOriginal;
  final String listennotesUrl;
  final int audioLengthSec;
  final bool explicitContent;
  final String titleHighlighted;
  final String descriptionOriginal;
  final String descriptionHighlighted;
  final List<dynamic> transcriptsHighlighted;

  Result({
    required this.id,
    required this.rss,
    required this.link,
    required this.audio,
    required this.image,
    required this.podcast,
    required this.itunesId,
    required this.thumbnail,
    required this.pubDateMs,
    required this.guidFromRss,
    required this.titleOriginal,
    required this.listennotesUrl,
    required this.audioLengthSec,
    required this.explicitContent,
    required this.titleHighlighted,
    required this.descriptionOriginal,
    required this.descriptionHighlighted,
    required this.transcriptsHighlighted,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        rss: json["rss"],
        link: json["link"],
        audio: json["audio"],
        image: json["image"],
        podcast: Podcast.fromJson(json["podcast"]),
        itunesId: json["itunes_id"],
        thumbnail: json["thumbnail"],
        pubDateMs: json["pub_date_ms"],
        guidFromRss: json["guid_from_rss"],
        titleOriginal: json["title_original"],
        listennotesUrl: json["listennotes_url"],
        audioLengthSec: json["audio_length_sec"],
        explicitContent: json["explicit_content"],
        titleHighlighted: json["title_highlighted"],
        descriptionOriginal: json["description_original"],
        descriptionHighlighted: json["description_highlighted"],
        transcriptsHighlighted:
            List<dynamic>.from(json["transcripts_highlighted"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rss": rss,
        "link": link,
        "audio": audio,
        "image": image,
        "podcast": podcast.toJson(),
        "itunes_id": itunesId,
        "thumbnail": thumbnail,
        "pub_date_ms": pubDateMs,
        "guid_from_rss": guidFromRss,
        "title_original": titleOriginal,
        "listennotes_url": listennotesUrl,
        "audio_length_sec": audioLengthSec,
        "explicit_content": explicitContent,
        "title_highlighted": titleHighlighted,
        "description_original": descriptionOriginal,
        "description_highlighted": descriptionHighlighted,
        "transcripts_highlighted":
            List<dynamic>.from(transcriptsHighlighted.map((x) => x)),
      };
}

class Podcast {
  final String id;
  final String image;
  final List<int> genreIds;
  final String thumbnail;
  final int listenScore;
  final String titleOriginal;
  final String listennotesUrl;
  final String titleHighlighted;
  final String publisherOriginal;
  final String publisherHighlighted;
  final String listenScoreGlobalRank;

  Podcast({
    required this.id,
    required this.image,
    required this.genreIds,
    required this.thumbnail,
    required this.listenScore,
    required this.titleOriginal,
    required this.listennotesUrl,
    required this.titleHighlighted,
    required this.publisherOriginal,
    required this.publisherHighlighted,
    required this.listenScoreGlobalRank,
  });

  factory Podcast.fromJson(Map<String, dynamic> json) => Podcast(
        id: json["id"],
        image: json["image"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        thumbnail: json["thumbnail"],
        listenScore: json["listen_score"],
        titleOriginal: json["title_original"],
        listennotesUrl: json["listennotes_url"],
        titleHighlighted: json["title_highlighted"],
        publisherOriginal: json["publisher_original"],
        publisherHighlighted: json["publisher_highlighted"],
        listenScoreGlobalRank: json["listen_score_global_rank"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "thumbnail": thumbnail,
        "listen_score": listenScore,
        "title_original": titleOriginal,
        "listennotes_url": listennotesUrl,
        "title_highlighted": titleHighlighted,
        "publisher_original": publisherOriginal,
        "publisher_highlighted": publisherHighlighted,
        "listen_score_global_rank": listenScoreGlobalRank,
      };
}
