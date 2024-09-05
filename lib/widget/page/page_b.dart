import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  bool isDay = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: 500,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isDay ? Colors.grey : Colors.black.withOpacity(0.7),
                offset: const Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: isDay
                  ? const [Color(0xDDFFFA66), Color(0xDDFFA057), Color(0xDD940B99)]
                  : const [
                      Color(0xFF94A9FF),
                      Color(0xFF6B66CC),
                      Color(0xFF200F75),
                    ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 70,
                right: 50,
                child: AnimatedOpacity(
                  opacity: isDay ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  child: const Star(),
                ),
              ),
              Positioned(
                top: 150,
                left: 60,
                child: AnimatedOpacity(
                  opacity: isDay ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  child: const Star(),
                ),
              ),
              Positioned(
                top: 40,
                left: 100,
                child: AnimatedOpacity(
                  opacity: isDay ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  child: const Star(),
                ),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: AnimatedOpacity(
                  opacity: isDay ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  child: const Star(),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: isDay ? 130 : 100,
                right: isDay ? -40 : 100,
                child: const Moon(),
              ),
              AnimatedPadding(
                padding: EdgeInsets.only(
                  top: isDay ? 50 : 500,
                ),
                duration: const Duration(milliseconds: 400),
                child: const Center(
                  child: Sun(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              isDay = !isDay;
            });
          },
          child: Text('button_animation_change'.tr()),
        ),
      ],
    );
  }
}

class Moon extends StatelessWidget {
  const Moon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF8983F7),
            Color(0xFFA3DAFB),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFC9E9FC),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFFC9E9FC).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0))
        ],
      ),
    );
  }
}

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return SunShine(
      radius: 160,
      child: SunShine(
        radius: 120,
        child: SunShine(
          radius: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.yellowAccent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SunShine extends StatelessWidget {
  const SunShine({super.key, required this.radius, required this.child});

  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
      ),
      child: child,
    );
  }
}
