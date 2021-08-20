import 'package:dictionary/bloc/dictionary_cub.dart';
import 'package:dictionary/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 40),
          Image.asset("assets/logo.png"),
          // Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
              color: Color(0xFF754898),
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search any word you want",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 32),
          TextField(
              controller: cubit.queryController,
              decoration: InputDecoration(
                hintText: "Search a word",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.grey),
              )),
          // Spacer(),
          SizedBox(height: 20),
          Container(
            width: 100,
            height: 50,
            child: ElevatedButton(
              child: Text("SEARCH"),
              onPressed: () {
                cubit.getWordSearched();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF754898),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  getErrorWidget(message) {
    return Center(
      child: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
        backgroundColor: Color(0xFFF0E2FB),
        body: cubit.state is WordSearchingState
            ? getLoadingWidget()
            : cubit.state is ErrorState
                ? getErrorWidget("Some Error")
                : cubit.state is NoWordSearchedState
                    ? getDictionaryFormWidget(context)
                    : Container(),
      ),
    );
  }
}
