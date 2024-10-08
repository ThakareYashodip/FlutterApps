import "package:flutter/material.dart";
import '../Resourcess/CategoryEssential.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State createState() => _CategoriesList();
}

class _CategoriesList extends State {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics:const  BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: menu_items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          print("Pressed");
                        },
                        child: SizedBox(
                          height: 50,
                          child: Text(
                            menu_items[index],
                            style: const TextStyle(fontSize: 16, color: Colors.white ,fontFamily: "Montserrat" ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(
                      Icons.cancel_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}