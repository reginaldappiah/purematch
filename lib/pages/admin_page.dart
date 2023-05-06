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
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSearchTextField(
                        controller: snapshot.controller,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          //Results in a bloc lookup each text field update.

                          final adminSearchBarCubit = context.read<AdminSearchBarCubit>();
                          if (value.isEmpty) {
                            adminSearchBarCubit.emitEmptyState();
                          } else {
                            adminSearchBarCubit.emitUpdateState(snapshot.controller);
                          }
                        }),
                  ),
                  snapshot is AdminSearchBarUpdate
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: InkWell(
                            onTap: () {
                              //Results in a bloc lookup each text field cancel.
                              final adminSearchBarCubit = context.read<AdminSearchBarCubit>();
                              adminSearchBarCubit.emitEmptyState();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              child: snapshot is AdminSearchBarEmpty
                  ? Container()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(),
                          title: RichText(
                            text: TextSpan(
                              text: dummyData[index],
                            ),
                          ),
                          subtitle: const Text("Member since 11/25/2019"),
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
