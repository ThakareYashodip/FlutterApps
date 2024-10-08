import "package:flutter/material.dart";
import '../Resourcess/SearchBoxResources.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State createState() => _SearchBox();
}

class _SearchBox extends State {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: menu_items.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    print("Pressed");
                  },
                  child: SizedBox(
                    height: 50,
                    child: Text(
                      menu_items[index],
                      style: const TextStyle(fontSize: 20, color: Colors.blue ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(onPressed: (){
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.cancel,size: 50,color: Colors.black,),
          ),
        ],
      ),
    );
  }
}