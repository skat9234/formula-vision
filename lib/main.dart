import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formulavision/pages/nav_page.dart';
import 'package:provider/provider.dart';
import 'data/models/live_data.model.dart';
import 'pages/test_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<F1DataModel>(
          create: (_) => F1DataModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Formula Vision',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const NavPage(),
      ),
    );
  }
}
