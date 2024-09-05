import 'package:flutter/material.dart';
import 'package:flutter_schulung/widget/page/page_a.dart';
import 'package:flutter_schulung/widget/page/page_b.dart';
import 'package:flutter_schulung/widget/page/page_c.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;
    switch (currentPageIndex) {
      case 0:
        child = Container(
          color: Colors.red,
        );
        break;
      case 1:
        child = Container(
          color: Colors.green,
        );
        break;
      case 2:
        child = Container(
          color: Colors.amber,
        );
        break;
      default:
        child = const Text('FEHLER');
        break;
    }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (value) => setState(() {
          currentPageIndex = value;
        }),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.animation), label: 'Animation'),
          NavigationDestination(icon: Icon(Icons.assistant_navigation), label: 'Navigation'),
        ],
      ),
      body: <Widget>[
        const PageA(),
        const PageB(),
        const PageC(),
      ][currentPageIndex],
    );
  }
}

class PersonCard extends StatefulWidget {
  const PersonCard({super.key, required this.text, required this.color, required this.size});

  final String text;
  final Color color;
  final double size;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  late Color _color;

  @override
  void initState() {
    _color = widget.color;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build PersonCard ${widget.text}');
    return GestureDetector(
      onTap: () {
        setState(() {
          _color = _color == Colors.green ? Colors.red : Colors.green;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: _color,
        child: Row(
          children: [
            Image.asset(
              'assets/IMG_1179.jpeg',
              height: 200,
              width: 200,
              fit: BoxFit.fitWidth,
            ),
            Center(child: Text(widget.text)),
          ],
        ),
      ),
    );
  }
}

class EdekaText extends StatelessWidget {
  const EdekaText({super.key, required this.text, required this.style});

  const EdekaText.headline({super.key, required this.text}) : style = TextArt.headline;

  final String text;
  final TextArt style;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).typography;

    return Text(
      text,
      maxLines: 1,
      style: _getStyle(),
    );
  }

  TextStyle _getStyle() {
    switch (style) {
      case TextArt.headline:
        return const TextStyle(
          fontSize: 20,
          letterSpacing: 4,
          height: 4,
          fontWeight: FontWeight.bold,
        );
      case TextArt.caption:
        return const TextStyle(
          fontSize: 20,
          letterSpacing: 4,
          height: 4,
          fontWeight: FontWeight.bold,
        );
      case TextArt.label:
        return const TextStyle(
          fontSize: 20,
          letterSpacing: 4,
          height: 4,
          fontWeight: FontWeight.bold,
        );
      case TextArt.body:
        return const TextStyle(
          fontSize: 20,
          letterSpacing: 4,
          height: 4,
          fontWeight: FontWeight.bold,
        );
    }
  }
}

enum TextArt {
  headline,
  caption,
  label,
  body,
}
