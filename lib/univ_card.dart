import 'package:flutter/material.dart';
import 'package:flutter_task_ubs/const/color_const.dart';
import 'package:flutter_task_ubs/const/style_const.dart';
import 'package:flutter_task_ubs/univ.dart';
import 'package:url_launcher/url_launcher.dart';

class UnivCard extends StatefulWidget {
  final Univ univ;

  const UnivCard({
    Key? key,
    required this.univ,
  }) : super(key: key);

  @override
  UnivCardState createState() => UnivCardState();
}

class UnivCardState extends State<UnivCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () async {
              if (!await launchUrl(Uri.parse((widget.univ.webpages)
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')))) {
                throw Exception('Could not launch');
              }
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black))),
            child: const Text('go to website'),
          ),
          const SizedBox(width: 15.0),
          Expanded(child: buildUnivDetails()),
          const SizedBox(width: 15.0),
        ],
      ),
    );
  }

  Column buildUnivDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'University Name:',
          style: TextStyle(color: kScampi),
        ),
        Text(
          widget.univ.name,
          style: univTitleStyle.copyWith(
            color: kMineShaft,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 11.0,
        ),
      ],
    );
  }
}
