import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:purematch/cubits/search/admin_search_bar_cubit.dart';
import 'package:purematch/pages/admin_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:purematch/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pure Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AdminSearchBarCubit()),
        ],
        child: const AdminPage(),
      ),
    );
  }
}
