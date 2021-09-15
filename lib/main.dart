import 'package:cats/presentation/providers/cats_provider.dart';
import 'package:cats/presentation/ui/pages/cats_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di/service_locator.dart';
import 'package:get_it/get_it.dart';

void main() {
  serviceLocatorSetUp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<CatsProvider>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: CatsPage(title: 'Cats Demo from Cataas API'),
    );
  }
}
