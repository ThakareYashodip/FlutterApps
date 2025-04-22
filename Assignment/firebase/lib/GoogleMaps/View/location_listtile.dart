import 'package:flutter/material.dart';

class LocationListtile extends StatelessWidget {
  final VoidCallback press;
  final String locationName;
  const LocationListtile(
      {super.key, required this.press, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: Icon(
            Icons.location_pin,
            color: Colors.black,
          ),
          title: Text(
            locationName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          thickness: 4,
          height: 4,
          color: Colors.grey.shade100,
        )
      ],
    );
  }
}
