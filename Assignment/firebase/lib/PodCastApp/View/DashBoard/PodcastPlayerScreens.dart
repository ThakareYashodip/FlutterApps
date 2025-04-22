import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase/PodCastApp/Service/PodcastModal.dart';
import 'package:firebase/PodCastApp/View/DashBoard/podcastDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final Result podcast;

  const PodcastPlayerScreen({super.key, required this.podcast});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setUrl(widget.podcast.audio);
    _player.setVolume(0.8);
    _player.setSpeed(1.0);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
        _player.positionStream,
        _player.durationStream,
        (position, duration) => DurationState(
          position: position,
          total: duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Now Playing", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PodcastDetailsPage(podcast: widget.podcast),
                  ),
                );
              },
              icon: Icon(
                Icons.info,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.podcast.image),
              radius: 100,
            ),
            const SizedBox(height: 20),
            Text(
              widget.podcast.titleOriginal,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "by ${widget.podcast.podcast.publisherOriginal}",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),

            // Progress Bar with Time
            StreamBuilder<DurationState>(
              stream: _durationStateStream,
              builder: (context, snapshot) {
                final durationState = snapshot.data;
                final progress = durationState?.position ?? Duration.zero;
                final total = durationState?.total ?? Duration.zero;

                final progressValue = total.inMilliseconds > 0
                    ? progress.inMilliseconds / total.inMilliseconds
                    : 0.0;

                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 6,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(progress),
                            style: const TextStyle(fontSize: 12)),
                        Text(_formatDuration(total),
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            //Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.calendar_month, size: 16),
                const SizedBox(width: 4),
                Text(
                  DateFormat('dd MMM yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        widget.podcast.pubDateMs),
                  ),
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (widget.podcast.explicitContent)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Explicit",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () => _player
                      .seek(_player.position - const Duration(seconds: 10)),
                ),
                const SizedBox(width: 20),
                StreamBuilder<PlayerState>(
                  stream: _player.playerStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    final playing = state?.playing ?? false;
                    final processing = state?.processingState;

                    if (processing == ProcessingState.loading ||
                        processing == ProcessingState.buffering) {
                      return const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      );
                    }

                    return IconButton(
                      icon: Icon(
                        playing ? Icons.pause_circle : Icons.play_circle,
                        size: 60,
                        color: Colors.blueAccent,
                      ),
                      onPressed: playing ? _player.pause : _player.play,
                    );
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () => _player
                      .seek(_player.position + const Duration(seconds: 10)),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Speed and Volume
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Speed
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Speed"),
                        Expanded(
                          child: Slider(
                            value: _player.speed,
                            min: 0.5,
                            max: 2.0,
                            divisions: 6,
                            activeColor: Colors.blueAccent,
                            label: "${_player.speed.toStringAsFixed(1)}x",
                            onChanged: (value) {
                              setState(() {
                                _player.setSpeed(value);
                              });
                            },
                          ),
                        ),
                        Text("${_player.speed.toStringAsFixed(1)}x"),
                      ],
                    ),
                    // Volume
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Volume"),
                        Expanded(
                          child: Slider(
                            value: _player.volume,
                            min: 0.0,
                            max: 1.0,
                            divisions: 10,
                            activeColor: Colors.blueAccent,
                            onChanged: (value) {
                              setState(() {
                                _player.setVolume(value);
                              });
                            },
                          ),
                        ),
                        Text("${(_player.volume * 100).toInt()}%"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}

class DurationState {
  final Duration position;
  final Duration total;

  DurationState({required this.position, required this.total});
}
