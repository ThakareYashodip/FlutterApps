import 'package:firebase_employee_app/C2W_E-Commerse-App/View/Essentials.dart';
import 'package:firebase_employee_app/C2W_E-Commerse-App/View/checkoutPage.dart';
import 'package:flutter/material.dart';

class DetailsPageE_Commerse extends StatefulWidget {
  const DetailsPageE_Commerse({super.key});

  @override
  State<DetailsPageE_Commerse> createState() => _DetailsPageE_CommerseState();
}

class _DetailsPageE_CommerseState extends State<DetailsPageE_Commerse> {
  List<String> sizes = ["S", 'M', 'L', 'XL', 'XXL'];
  int selectedIndex = -1;
  double price = 200.9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Essentials().textCustom(
                    message: "Details",
                    fontType: "Imprima",
                    size: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_outline_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: Essentials().getHeight(context) * .5,
                // width: Essentials().getWidth(context) * .9,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/MARTIN898.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Essentials().textCustom(
                        message: "Premium Tagerine Shirt",
                        fontType: "Imprima",
                        size: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Essentials().textCustom(
                  message: "Size",
                  fontType: "Imprima",
                  size: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          color: (selectedIndex != index)
                              ? Colors.white
                              : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Essentials().textCustom(
                            message: sizes[index],
                            fontType: "Imprima",
                            size: 24,
                            fontWeight: FontWeight.w800,
                            color: (selectedIndex != index)
                                ? Color.fromRGBO(121, 119, 128, 1)
                                : Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Essentials().textCustom(
                    message: "Rs. $price",
                    fontType: "Imprima",
                    size: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CheckoutEcommerse()));
                    },
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 122, 0, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Essentials().textCustom(
                            message: "Add To Cart",
                            fontType: "Imprima",
                            size: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
