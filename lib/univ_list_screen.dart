import 'package:flutter_task_ubs/cards_list.dart';
import 'package:flutter_task_ubs/repository/songs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_ubs/univ.dart';
import 'app_bar.dart';

class UnivListScreen extends StatefulWidget {
  const UnivListScreen({Key? key}) : super(key: key);

  @override
  State<UnivListScreen> createState() => _UnivListScreenState();
}

class _UnivListScreenState extends State<UnivListScreen> {
  final repository = SongsRepository();
  bool isTabOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isTabOpen: isTabOpen),
      body: FutureBuilder<List<Univ>>(
        future: repository.fetchUnivs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<Univ>? songList = snapshot.data;
            return CardsList(univList: songList);
          } else {
            return const Center(
              child: Text('No songs available'),
            );
          }
        },
      ),
    );
  }

}
