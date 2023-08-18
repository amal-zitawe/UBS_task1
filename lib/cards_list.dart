import 'package:flutter_task_ubs/univ.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_ubs/univ_card.dart';

class CardsList extends StatelessWidget {
  final List<Univ>? univList;
  const CardsList({Key? key, this.univList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (univList == null || univList!.isEmpty) {
      return const Center(child: Text('No university available'));
    }
    return ListView.builder(
      itemCount: univList!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
            top: 12.5, bottom: 12.5, left: 25.0, right: 25),
        child: UnivCard(univ: univList![index]),
      ),
    );
  }
}
