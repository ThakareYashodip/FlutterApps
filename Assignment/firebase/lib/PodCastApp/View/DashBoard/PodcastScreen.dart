import 'dart:developer';

import 'package:firebase/PodCastApp/Service/Api/PodcastApi.dart';
import 'package:firebase/PodCastApp/Service/PodcastModal.dart';
import 'package:firebase/PodCastApp/View/LoginSignUp/podcastSplash.dart';
import 'package:firebase/PodCastApp/View/Widget/PodcastItem.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Podcastscreen extends StatefulWidget {
  const Podcastscreen({super.key});

  @override
  State<Podcastscreen> createState() => _PodcastscreenState();
}

class _PodcastscreenState extends State<Podcastscreen> {
  List<Result>? podcasts;
  final podcastApi = Podcastapi();
  bool _isLoading = true;

  @override
  void initState() {
    log('initState called');
    fetchPodcast();
    super.initState();
  }

  Future<void> fetchPodcast() async {
    podcasts = await podcastApi.getPodcast();
    log(podcasts.toString());
    setState(() {
      if (podcasts!.isNotEmpty) {
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => PodcastLogin()),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Podcasts (${podcasts?.length ?? 0})',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLoading || podcasts == null
          ? SkeletonWidget(isLoading: _isLoading)
          : ListView.separated(
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(10),
              itemCount: podcasts!.length,
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final podcast = podcasts![index];
                return PodcastItem(podcast: podcast);
              },
            ),
    );
  }
}

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({
    super.key,
    required bool isLoading,
  }) : _isLoading = isLoading;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _isLoading,
      child: ListView.separated(
        itemCount: 5, // Skeleton placeholders count
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              shadowColor: Colors.black.withOpacity(0.1),
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
                    // Placeholder for image
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Placeholder for content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 16,
                            width: 120,
                            color: Colors.grey.shade200,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 14,
                            width: 100,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      ),
                    ),

                    // Placeholder for button
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
