import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purematch/cubits/search/search_cubit.dart';
import 'package:purematch/cubits/search/search_state.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  static List<String> dummyData = [
    "Joanne Robinson",
    "Joe Mike",
    "John Jameson",
    "John Johnson",
    "Joseph Smith",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add an Admin"),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchingState) {
                    return Row(
                      children: const [
                        CupertinoSearchTextField(),
                        Text("Cancel"),
                      ],
                    );
                  }
                  return CupertinoSearchTextField(onChanged: (value) {
                    print(value);
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(leading: Text(dummyData[index]));
                },
                itemCount: dummyData.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
