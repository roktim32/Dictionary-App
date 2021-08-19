import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse> words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0E2FB),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  "${index + 1} ${words[index].word}",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(words[index]),
                    ),
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: words.length),
    );
  }
}
