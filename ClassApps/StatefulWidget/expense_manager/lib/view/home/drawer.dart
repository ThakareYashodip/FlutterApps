import 'package:expense_manager/view/categories/categories.dart';
import 'package:expense_manager/view/graph/graphs.dart';
import 'package:expense_manager/view/home/aboutUs.dart';
import 'package:expense_manager/view/home/dashBoard.dart';
import 'package:expense_manager/view/trash/trash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

int selectedIndex = 0;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Saves all your Transactions",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _buildDrawerButton(
            context,
            index: 0,
            icon: const Iconify(
              IconParkSolid.transaction,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            label: "Transactions",
            onTap: () {
              setState(() {
                selectedIndex = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const Dashboard();
                    },
                  ),
                );
              });
            },
          ),
          _buildDrawerButton(
            context,
            index: 1,
            icon: const Iconify(
              IconParkSolid.relational_graph,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            label: "Graphs",
            onTap: () {
              setState(() {
                selectedIndex = 1;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const MyGraph();
                    },
                  ),
                );
              });
            },
          ),
          _buildDrawerButton(
            context,
            index: 2,
            icon: const Iconify(
              IconParkSolid.category_management,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            label: "Category",
            onTap: () {
              setState(() {
                selectedIndex = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const MyCategoriesState();
                    },
                  ),
                );
              });
            },
          ),
          _buildDrawerButton(
            context,
            index: 3,
            icon: const Icon(
              Icons.delete,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            label: "Trash",
            onTap: () {
              setState(() {
                selectedIndex = 3;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const Trash();
                }));
              });
            },
          ),
          _buildDrawerButton(
            context,
            index: 4,
            icon: const Icon(
              Icons.person,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            label: "AboutUs",
            onTap: () {
              setState(() {
                selectedIndex = 4;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const Aboutus();
                  }),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerButton(
    BuildContext context, {
    required int index,
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 180,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 10, right: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(14, 161, 125, 0.15)
              : const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? const Color.fromRGBO(14, 161, 125, 1)
                    : const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
