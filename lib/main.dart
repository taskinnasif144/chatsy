import 'package:chatsy/components/auth/is_authorized.dart';
import 'package:chatsy/firebase/firebase_options.dart';
import 'package:chatsy/models/hive_models/user_hive_model.dart';
import 'package:chatsy/providers/get_user_provider.dart';
import 'package:chatsy/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(UserHiveModelAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetUserProvider>(
          create: (_) => GetUserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        darkTheme: darkMode,
        home: const IsAuthorized(),
      ),
    );
  }
}


