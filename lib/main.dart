import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/data/order.dart';
import 'package:balirental_project1/pages/loginorregist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Catalog(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderHistoryProvider(),
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
      home: Loginorregist(),
    );
  }
}
