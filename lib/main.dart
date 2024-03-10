import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// Liste d'élément à afficher
var myList = [
  "élement 1",
  "élement 2",
  "élement 3",
  "élement 4",
  "élement 5",
];

// Widget App : pourrait être dans un fichier à part
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

// Ecran Home : pourrait être dans un fichier à part
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Simple ListView"),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) => _listElement(context, myList[index]),
      ),
    );
  }

  _listElement(BuildContext context, String element) {
    return ListTile(
      title: Text(element),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ElementDetails(element: element),
        ),
      ),
    );
  }
}

// Ecran "Détails" d'un élément : pourrait être dans un fichier à part
class ElementDetails extends StatelessWidget {
  final String element;
  const ElementDetails({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Element details"),
      ),
      // Notre élément centré à l'écran
      body: Center(
        child: Text(element),
      ),
    );
  }
}
