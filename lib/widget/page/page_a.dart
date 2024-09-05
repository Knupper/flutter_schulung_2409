import 'package:flutter/material.dart';
import 'package:flutter_schulung/widget/home_page.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.car_crash),
              ),
              Tab(
                icon: Icon(Icons.flight),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const PersonCard(
                            text: 'text',
                            color: Colors.green,
                            size: 400,
                          ),
                        ),
                      ));
                    },
                    child: const Text('car')),
                const Text('Flight'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
