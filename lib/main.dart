import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/data/order.dart';
import 'package:balirental_project1/components/support/authgate.dart';
import 'package:balirental_project1/components/support/themeprovider.dart';
import 'package:balirental_project1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Catalog(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderHistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: TropicGo(),
    ),
  );
}

class TropicGo extends StatelessWidget {
  const TropicGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authgate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
