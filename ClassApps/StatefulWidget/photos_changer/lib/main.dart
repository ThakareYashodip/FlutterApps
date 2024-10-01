import 'package:flutter/material.dart';

void main() {
  runApp(const PhotosToggle());
}

class PhotosToggle extends StatefulWidget {
  const PhotosToggle({super.key});

  @override
  State createState() => _PhotosToggleState();
}

class _PhotosToggleState extends State {
//   List pics = ["https://i.pinimg.com/originals/9c/1c/cc/9c1ccc8bfd376eecd216bf88c4879c1a.jpg",
// "https://cdn.staticneo.com/w/naruto/Nprofile2.jpg",
// "https://i.pinimg.com/736x/22/de/8d/22de8dbda07ba5571a97736b12905a17.jpg",
// "https://cdn.pixabay.com/photo/2023/10/06/23/29/ai-generated-8299238_1280.jpg",
// "https://m.media-amazon.com/images/M/MV5BZTNjOWI0ZTAtOGY1OS00ZGU0LWEyOWYtMjhkYjdlYmVjMDk2XkEyXkFqcGc@._V1_.jpg"];

  // List pics = [
  //   "https://quotefancy.com/media/wallpaper/3840x2160/124276-Bill-Gates-Quote-We-re-changing-the-world-with-technology.jpg",
  //   "https://quotefancy.com/media/wallpaper/3840x2160/7389408-Amy-Shira-Teitel-Quote-The-difference-between-nations-lay-not-in.jpg",
  //   "https://quotefancy.com/media/wallpaper/3840x2160/1079903-Burt-Rutan-Quote-At-various-times-over-20-years-I-did-preliminary.jpg",
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8tNVgVl7tRvopv_XysRseKPTmgIR0tgl9goCqTxEYxMtkDzR1LElpJ7xjyd6ngM8L-bg&usqp=CAU",
  //   "https://quotefancy.com/media/wallpaper/3840x2160/5400886-Burt-Rutan-Quote-NASA-is-doing-nothing-but-development-They-re-not.jpg"
  // ];

  // Shradha Kapoor
List shraddhaKapoor = [
  "https://e0.pxfuel.com/wallpapers/372/322/desktop-wallpaper-shraddha-kapoor-beautiful-and-shradha-kapoor.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/268/875/desktop-wallpaper-shraddha-kapoor-shradha.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/448/753/desktop-wallpaper-shradha-kapoor-u-arjun-kapoor-and-shraddha-kapoor.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/597/314/desktop-wallpaper-shraddha-kapoor-shradha-kapoor-1920x1080.jpg",
  "https://e0.pxfuel.com/wallpapers/160/838/desktop-wallpaper-shraddha-kapoor-latest-shraddha-kapoor-shradha-kapoor.jpg",
  "https://e0.pxfuel.com/wallpapers/688/769/desktop-wallpaper-shraddha-kapoor-new-shraddha-kapoor-shradha-kapoor.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/363/597/desktop-wallpaper-shraddha-kapoor-full-posted-by-sarah-peltier-shradha-kapoor-1920x1080.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/455/122/desktop-wallpaper-saaho-movie-shradha-kapoor-close-up.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/222/232/desktop-wallpaper-shradha-kapoor-full.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/444/262/desktop-wallpaper-best-baaghi-shraddha-kapoor-1920x1080-shradha-kapoor-1920x1080.jpg"
];

// Ananya Panday
List ananyaPanday = [
  "https://www.filmibeat.com/wimg/desktop/2023/12/ananya-pandey_103.jpg",
  "https://wallpapercave.com/wp/wp4309419.jpg",
  "https://wallpapercave.com/wp/wp5006224.jpg",
  "https://www.koimoi.com/wp-content/new-galleries/2022/06/ananya-pandays-neon-mini-dress-costs-in-lakhs-will-blow-a-hole-in-your-pocket-pics-inside-001.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJU9iiGQSlovljQ3dzVQhC92MbFzDo-ZuSGzgGOpIo7sG59MZMFNflBxcW0nXKEjpXejA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwr1zPqtICOa-VW-jHLD13ceLsmsYFkPPcFXCadBVnJUGPgl-zMdusyRGgDaNIgc-FZDA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAxOed04wDp_PqmoX8b5fmOYHWmOi0pRLuN2WAY2LA6c0eD8ZiymD79FkWVidsffSfajM&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK1QgPAtKKjF5F36PmHVfQHexGPxQBc8p4F-NX-XGjI263DQXNi8olEaB76oGvE9ogjZs&usqp=CAU",
  "https://www.prabhatkhabar.com/wp-content/uploads/2024/01/ananya-panday-1.jpg",
  "https://img-cdn.thepublive.com/fit-in/640x430/filters:format(webp)/newsnation/media/media_files/I0ZfSYceoo1ZNtinA8ZJ.jpg"
];

// Disha Patani
List dishaPatani = [
  "https://c4.wallpaperflare.com/wallpaper/984/487/774/disha-patani-bollywood-hd-wallpaper-preview.jpg",
  "https://w0.peakpx.com/wallpaper/269/35/HD-wallpaper-disha-patani-indian-actress-bollywood-shoot-golden-beautiful-dress-fashion-model.jpg",
  "https://c4.wallpaperflare.com/wallpaper/531/566/432/disha-patani-wallpaper-preview.jpg",
  "https://www.filmibeat.com/wimg/desktop/2023/07/disha-patani_63.jpg",
  "https://c4.wallpaperflare.com/wallpaper/706/470/407/disha-patani-wallpaper-preview.jpg",
  "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202406/disha-082721575-16x9_1.jpg?VersionId=JDmL.1llQxeoW9NYxvjVh8ybBU7d3r3c&size=690:388",
  "https://www.koimoi.com/wp-content/new-galleries/2024/08/disha-patani.jpg",
  "https://english.cdn.zeenews.com/sites/default/files/2019/04/06/776008-disaha.jpg",
  "https://c4.wallpaperflare.com/wallpaper/187/948/1003/disha-patani-4k-high-resolution-mac-wallpaper-preview.jpg",
  "https://images.news18.com/ibnlive/uploads/2023/10/untitled-design-2023-10-13t160606.610-2023-10-e8f52762fbdaa6d93dd685a8206deea5-16x9.png"
];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Photos Toggle ',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 410,
                height: 250,
                child: Image.network(shraddhaKapoor[index], fit: BoxFit.cover,),
              ),
              SizedBox(
                width: 410,
                height: 250,
                child: Image.network(ananyaPanday[index], fit: BoxFit.fitHeight,),
              ),
              SizedBox(
                width: 410,
                height: 250,
                child: Image.network(dishaPatani[index], fit: BoxFit.fitHeight,),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (index > 0) {
                  index--;
                } else {
                  index = dishaPatani.length - 1;
                }
                setState(() {});
              },
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            const SizedBox(width: 30),
            FloatingActionButton(
              onPressed: () {
                if (index < dishaPatani.length - 1) {
                  index++;
                } else {
                  index = 0;
                }
                setState(() {});
              },
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
