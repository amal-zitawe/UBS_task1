import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'const/color_const.dart';
import 'const/font_const.dart';
import 'const/image_const.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isTabOpen;
  const CustomAppBar({Key? key, required this.isTabOpen}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(215);
  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
TextEditingController searchController = TextEditingController();


    @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return appBar();
  }

  AppBar appBar() {
    return AppBar(
      title: Column(
        children: [
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                'Home',
                style: TextStyle(
                  fontFamily: muli,
                  color: kWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(width: 189),
            ],
          ),
          if (widget.isTabOpen)
            Container(
              width: 100,
              height: 100,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Tab Content',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      backgroundColor: kScampi,
      bottom: search(),
    );
  }

  PreferredSize search() {
    return PreferredSize(
      preferredSize: const Size(325, 46),
      child: Container(
        width: 325,
        height: 46,
        margin: const EdgeInsets.only(bottom: 58),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: SizedBox(
                width: 14,
                height: 14,
                child: SvgPicture.asset(
                  kSearch,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    // Filter items based on the entered value
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
