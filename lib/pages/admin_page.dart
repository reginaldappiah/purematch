import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purematch/cubits/search/admin_search_bar_state.dart';
import 'package:purematch/cubits/search/admin_search_bar_cubit.dart';

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
      //Rebuilds the admin page per state change {AdminSearchBarEmpty, AdminSearchBarUpdate}
      body: BlocBuilder<AdminSearchBarCubit, AdminSearchBarState>(builder: (context, snapshot) {
        return Column(
          children: [
            Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 15,
                  right: 15,
                ),
                child: CupertinoSearchTextField(
                    controller: TextEditingController(text: snapshot.searchText),
                    onChanged: (value) {
                      //Results in a bloc lookup each text field update.
                      final adminSearchBarCubit = context.read<AdminSearchBarCubit>();
                      if (value.isEmpty) {
                        //Emits Search Bar Empty State
                      } else {
                        //Emits Search Bar Filled State
                      }
                    })),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                      dummyData[index],
                    ),
                    subtitle: Text("Member since 11/25/2019"),
                  );
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
