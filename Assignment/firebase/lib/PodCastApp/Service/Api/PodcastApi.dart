// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:firebase/PodCastApp/Service/PodcastModal.dart';
// import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Podcastapi {
//   final dio = Dio();
//   Future<List<PodcastModal>> getPodcast() async {
//     final sharedPrefernces = await SharedPreferences.getInstance();

//     const url = "https://listen-api-test.listennotes.com/api/v2/search";
//     const apikey = "dc387d3f77e74578878376797a8e36cb";

//     final headers = {
//       "X-ListenAPI-Key": apikey,
//       "Accept": "application/json",
//     };

//     if (await InternetConnectionChecker.createInstance().hasConnection) {
//       final response = await dio.get(
//         url,
//         options: Options(
//           headers: headers,
//         ),
//       );
//       final result = response.data["results"] as List;
//       final podcasts =
//           result.map((json) => PodcastModal.fromJson(json)).toList();
//       await sharedPrefernces.setString('podcasts', jsonEncode(podcasts));
//       log(podcasts.toString());
//       return podcasts;
//     } else {
//       final podcasts = sharedPrefernces.getString('podcasts');
//       if (podcasts == null) {
//         return [];
//       } else {
//         return jsonDecode(podcasts)
//             .asMap<PodcastModal>((json) => PodcastModal.fromJson(json))
//             .toList();
//       }
//     }
//   }

//   Future<void> downloadAudio(String url, String fileName,
//       {ProgressCallback? onReceiveProgress}) async {
//     try {
//       final appStorage = await getApplicationDocumentsDirectory();
//       final sharedPrefernces = await SharedPreferences.getInstance();
//       final path = '${appStorage.path}/$fileName';

//       if (await InternetConnectionChecker.createInstance().hasConnection) {
//         await dio.download(
//           url,
//           path,
//           onReceiveProgress: onReceiveProgress,
//         );
//         await sharedPrefernces.setString('path', path);
//         await OpenFile.open(path, type: 'audio/x-mpeg');
//       } else {
//         final savedPath = sharedPrefernces.getString('path');
//         if (savedPath == null) {
//           return;
//         } else {
//           await OpenFile.open(savedPath, type: 'audio/x-mpeg');
//         }
//       }
//     } catch (e) {
//       print(StackTrace);
//       print('Error downloading audio: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase/PodCastApp/Service/PodcastModal.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Podcastapi {
  final dio = Dio();

  Future<List<Result>> getPodcast() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    const url = "https://listen-api-test.listennotes.com/api/v2/search";
    // ?q=star%20wars";
    const apikey = "dc387d3f77e74578878376797a8e36cb";

    final headers = {
      "X-ListenAPI-Key": apikey,
      "Accept": "application/json",
    };

    if (await InternetConnectionChecker.createInstance().hasConnection) {
      final response = await dio.get(url, options: Options(headers: headers));
      final podcastModal = PodcastModal.fromJson(response.data);

      // Save full JSON string for offline
      await sharedPreferences.setString('podcasts', jsonEncode(response.data));

      return podcastModal.results;
    } else {
      final cachedData = sharedPreferences.getString('podcasts');
      if (cachedData == null) {
        return [];
      } else {
        final parsedJson = jsonDecode(cachedData);
        final podcastModal = PodcastModal.fromJson(parsedJson);
        return podcastModal.results;
      }
    }
  }

  Future<void> downloadAudio(
    String url,
    String fileName, {
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final sharedPreferences = await SharedPreferences.getInstance();
      final path = '${appStorage.path}/$fileName';

      if (await InternetConnectionChecker.createInstance().hasConnection) {
        await dio.download(
          url,
          path,
          onReceiveProgress: onReceiveProgress,
        );
        await sharedPreferences.setString('path', path);
        await OpenFile.open(path, type: 'audio/x-mpeg');
      } else {
        final savedPath = sharedPreferences.getString('path');
        if (savedPath != null) {
          await OpenFile.open(savedPath, type: 'audio/x-mpeg');
        }
      }
    } catch (e, stack) {
      print(stack);
      print('Error downloading audio: $e');
    }
  }
}
