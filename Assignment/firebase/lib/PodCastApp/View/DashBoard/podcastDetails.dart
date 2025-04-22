import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase/PodCastApp/Service/PodcastModal.dart';

class PodcastDetailsPage extends StatelessWidget {
  final Result podcast;

  const PodcastDetailsPage({super.key, required this.podcast});

  String formatDate(int millis) {
    final date = DateTime.fromMillisecondsSinceEpoch(millis);
    return DateFormat('dd MMM yyyy').format(date);
  }

  String cleanHtmlTags(String htmlString) {
    // Remove HTML tags
    final tagRegExp = RegExp(r'<[^>]+>', multiLine: true, caseSensitive: false);
    final cleaned = htmlString.replaceAll(tagRegExp, '');

    // Decode common HTML entities manually (optional)
    return cleaned
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'");
  }

  @override
  Widget build(BuildContext context) {
    final podcastInfo = podcast.podcast;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Podcast Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Thumbnail
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: podcast.thumbnail,
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            podcast.titleOriginal,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),
          Text(
            "Publisher: ${podcastInfo.publisherOriginal}",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 12),
          Text(
            "Description:\n${cleanHtmlTags(podcast.descriptionOriginal)}",
            style: const TextStyle(fontSize: 15),
          ),

          const Divider(height: 30),

          InfoTile(label: "Audio URL", value: podcast.audio),
          InfoTile(label: "RSS", value: podcast.rss),
          InfoTile(label: "Link", value: podcast.link),
          InfoTile(label: "iTunes ID", value: podcast.itunesId.toString()),
          InfoTile(label: "Published On", value: formatDate(podcast.pubDateMs)),
          InfoTile(
              label: "Audio Length",
              value: "${(podcast.audioLengthSec / 60).toStringAsFixed(1)} min"),
          InfoTile(
              label: "Explicit Content",
              value: podcast.explicitContent ? "Yes" : "No"),
          InfoTile(
              label: "Listen Score", value: podcastInfo.listenScore.toString()),
          InfoTile(
              label: "Global Rank", value: podcastInfo.listenScoreGlobalRank),
          InfoTile(label: "Genre IDs", value: podcastInfo.genreIds.join(', ')),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            label: const Text(
              "Play Podcast",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
