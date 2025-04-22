import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase/PodCastApp/Service/Api/PodcastApi.dart';
import 'package:firebase/PodCastApp/Service/PodcastModal.dart';
import 'package:firebase/PodCastApp/View/DashBoard/PodcastPlayerScreens.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastItem extends StatefulWidget {
  final Result podcast;

  const PodcastItem({super.key, required this.podcast});

  @override
  State<PodcastItem> createState() => _PodcastItemState();
}

class _PodcastItemState extends State<PodcastItem> {
  final podcastApi = Podcastapi();
  final _progressNotifier = ValueNotifier<double>(0.0);

  String? savedPath;

  Future<void> getSavedPath() async {
    _progressNotifier.value = 0;
    final prefs = await SharedPreferences.getInstance();
    savedPath = prefs.getString('path');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSavedPath();
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  String _formatDate(int millis) {
    return DateFormat('dd MMM yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(millis));
  }

  void _openListenNotesUrl() async {
    final url = widget.podcast.listennotesUrl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      log("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final podcast = widget.podcast;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PodcastPlayerScreen(podcast: podcast),
            ),
          );
        },
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          shadowColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade50, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: podcast.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const CircularProgressIndicator(),
                    errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          podcast.titleOriginal,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          podcast.podcast.publisherOriginal,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.schedule,
                                size: 16, color: Colors.grey),
                            Text(_formatDuration(podcast.audioLengthSec),
                                style: const TextStyle(fontSize: 12)),
                            const Icon(Icons.calendar_month,
                                size: 16, color: Colors.grey),
                            Text(_formatDate(podcast.pubDateMs),
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: _openListenNotesUrl,
                          child: Row(
                            children: const [
                              Icon(Icons.link,
                                  size: 16, color: Colors.blueAccent),
                              SizedBox(width: 4),
                              Text(
                                'ListenNotes',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tooltip(
                  message: savedPath == null ? 'Download' : 'Play',
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: _progressNotifier,
                        builder: (_, double value, __) {
                          return CircularProgressIndicator(
                            value: value,
                            strokeWidth: 2.5,
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          savedPath == null ? Icons.download : Icons.play_arrow,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () async {
                          final path =
                              '${podcast.titleOriginal}/${podcast.id}.mp3';
                          await podcastApi.downloadAudio(
                            podcast.audio,
                            path,
                            onReceiveProgress: (count, total) {
                              _progressNotifier.value = count / total;
                            },
                          );
                          await getSavedPath();
                          _progressNotifier.value = 0.0;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
