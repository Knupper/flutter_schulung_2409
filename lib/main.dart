import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:flutter_schulung/presentation/page/advice/advice_page.dart';
import 'package:http/http.dart';

// Aufgabe cubit
// Button: der immer advice 42 abruft
// Bonus: TextEditingField in das der Nutzer die Zahl eingeben kann und mit Button Klick wird der dazu entsprechende Advice abgerufen


void main() {
  final dataSourceA = AdviceRestApi(client: Client());

  runApp(RepositoryProvider<AdviceRepo>(
    create: (context) => AdviceRepoImpl(dataSource: dataSourceA),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AdvicePageProvider(),
    );
  }
}
