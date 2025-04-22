import 'package:firebase/GoogleMaps/Services/AutocompletePrediction.dart';
import 'package:firebase/GoogleMaps/Services/network_util.dart';
import 'package:firebase/GoogleMaps/Services/placeCompleteResponse.dart';
import 'package:firebase/GoogleMaps/View/location_listtile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPlacesGoogle extends StatefulWidget {
  const SearchPlacesGoogle({super.key});

  @override
  State<SearchPlacesGoogle> createState() => _SearchPlacesGoogleState();
}

class _SearchPlacesGoogleState extends State<SearchPlacesGoogle> {
  final search_controller = TextEditingController();

  final apikey = "AIzaSyCYS9gr6-u_UhBUIdNH15rx9tLFB8E48ps";
  List<Autocompleteprediction> placepredictions = [];

  void placeAutoComplete(String place) async {
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": place,
      "key": apikey,
    });

    String? response = await NetworkUtil().fetchUrl(uri);
    if (response != null) {
      Placecompleteresponse result =
          Placecompleteresponse.parseAutoCompleteResult(response);

      if (result.predictions != null) {
        setState(() {
          placepredictions = result.predictions!; // Just Prediction list
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Search Places Google',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Icon(
            CupertinoIcons.location,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Icon(Icons.close_rounded))
        ],
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: search_controller,
                textInputAction: TextInputAction.search,
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search your location',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 4,
            height: 4,
            color: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              //for testing purpose , lets call the place when press the button
              placeAutoComplete(search_controller.text);
              search_controller.clear();
              setState(() {});
            },
            icon: Icon(
              CupertinoIcons.location_fill,
              color: Colors.black,
            ),
            label: const Text(
              "Use my Current Location",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(350, 50),
              backgroundColor: Colors.grey.shade100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: placepredictions.length,
              itemBuilder: (context, index) {
                return LocationListtile(
                  press: () {},
                  locationName:
                      placepredictions[index].description ?? "Unknown",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
