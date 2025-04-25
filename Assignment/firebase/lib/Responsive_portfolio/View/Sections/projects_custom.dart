import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsCustom extends StatelessWidget {
  const ProjectsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> projects = [
      {
        'title': 'Campus Cloud',
        'desc': 'User friendly Educational App.',
        'image':
            'https://cdn0.iconfinder.com/data/icons/social-flat-rounded-rects/512/cloudapp-512.png'
      },
      {
        'title': 'Netflix Clone',
        'desc': 'A UI clone with Firebase Auth and GetX.',
        'image':
            'https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg?w=940'
      },
      {
        'title': 'Todo App',
        'desc': 'Advanced UI with task filters and animations.',
        'image':
            'https://cdn.dribbble.com/userupload/23480349/file/original-ef389175dcd55caad45f56ac1e595c7d.png'
      },
      {
        'title': 'Podcast App',
        'desc': 'Flutter app using ListenNotes API.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmOPGeOc46jf8ToNzPrGQypN82jL6dP9qOFQ&s'
      },
      {
        'title': 'LinkedList App',
        'desc': 'Desktop app on Java using SinglyLinkedList Algo.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Q2lF4yebXBO682Fn9QvJuKaAr-Qb0eYWMQ&s'
      },

      ///
      {
        'title': 'Binary Search',
        'desc': 'Interactive Desktop App using BinarySearch Algo.',
        'image':
            'https://miro.medium.com/v2/resize:fit:693/1*FUCeyZXLc3wfSCx52LJNDA.jpeg'
      },
      {
        'title': '4Wheels',
        'desc': 'Car Rental & Booking Application using JavaFx',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEnKdCCoX66MtFd-5pPmfCiv3wROcelooKRzdX2Dz__ofvmVnUR0JPb36AXC4ojEN5ru4&usqp=CAU'
      },
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: getScreenHeight(context) * 0.05),
      child: Center(
        child: Wrap(
          spacing: screenWidth * 0.1,
          runSpacing: screenHeight * 0.05,
          children: projects.map((project) {
            return SizedBox(
              width: screenWidth * 0.20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: getScreenHeight(context) * 0.05),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      project['image']!,
                      height: getResponsiveHeight(context, 0.15),
                      width: getResponsiveWidth(context, 0.8),
                      fit: BoxFit.fill,
                    ),
                  ).increaseSizeOnHover(1.2),
                  SizedBox(height: getScreenHeight(context) * 0.01),
                  Text(
                    project['title']!,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.005),
                  Text(
                    project['desc']!,
                    style: GoogleFonts.dmSans(
                      color: Colors.white70,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
