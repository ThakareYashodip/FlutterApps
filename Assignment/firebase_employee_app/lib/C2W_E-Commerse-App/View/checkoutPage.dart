import 'package:firebase_employee_app/C2W_E-Commerse-App/View/Essentials.dart';
import 'package:flutter/material.dart';

class CheckoutEcommerse extends StatefulWidget {
  const CheckoutEcommerse({super.key});

  @override
  State<CheckoutEcommerse> createState() => _CheckoutEcommerseState();
}

class _CheckoutEcommerseState extends State<CheckoutEcommerse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
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
                      message: "Checkout",
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
                Essentials().textCustom(
                  message: "Delivery Address",
                  fontType: "Imprima",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/9312/28c4/a8f87dc546549155bf23037cf1b415fa?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OdrIgBJiFHjVr2gos9a9mJZtt-p8F~bBo0mF1rxy1vjYjgAbVeRZez-E2YA46~zw5mrBClrAn4bA1khN0mIL-C0eCkdcnC1AH2~NHunZkQuncV-dd-EsRcjg-uJT2XKseLiaTGHfprzt07jIaB2Ptf6vGItyvjnmCGgGPYd7dbtnCkBRjcSfXqdgfsNlFrQBCTqKrhwxz1kKXIgLLnGyTHaEgD~KWKBkzq5HZ69XtBKIXQR92s4GmBXMYBhX1J1gQLtxMu1wgIvYMjz5clkJMeogI~iXUGHvVl4-C57O2kVXnZcFGv51bwdXnnHHVVRI3-KV2e0V0SlIDlwWfFfX~w__",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Essentials().textCustom(
                        message: "25/3 Housing Estate, Sylhet",
                        fontType: "Imprima",
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Essentials().textCustom(
                        message: "Change",
                        fontType: "Imprima",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.timer_outlined,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Essentials().textCustom(
                      message: " Delivered in next ${7} days",
                      fontType: "Imprima",
                      size: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Essentials().textCustom(
                  message: "Payment Method",
                  fontType: "Imprima",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                Image.asset(
                  "assets/IconsPayment.png",
                  height: 20,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Gift Voucher")),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Note : ',
                    style: TextStyle(color: Colors.red),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Use your order id at the payment. Your Id ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(121, 119, 128, 1)),
                      ),
                      TextSpan(
                        text: '#154619',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                          text:
                              " if you forget to put your order id we can’t confirm the payment.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(121, 119, 128, 1))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Essentials().textCustom(
                      message: "Total Items (3)",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    Essentials().textCustom(
                      message: "RS 250",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Essentials().textCustom(
                      message: "Standard Delivery",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    Essentials().textCustom(
                      message: "RS 150",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Essentials().textCustom(
                      message: "Total Payment",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    Essentials().textCustom(
                      message: "RS 20",
                      fontType: "Imprima",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 122, 0, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Essentials().textCustom(
                            message: "Pay Now",
                            fontType: "Imprima",
                            size: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
