import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedButtons extends StatefulWidget {
  const AnimatedButtons({Key? key}) : super(key: key);

  @override
  _AnimatedButtonsState createState() => _AnimatedButtonsState();
}

class _AnimatedButtonsState extends State<AnimatedButtons>
    with TickerProviderStateMixin {
  AnimationController? githubController;
  AnimationController? instagramController;
  AnimationController? linkedinController;
  Animation? githubAnimation;
  Animation? instagramAnimation;
  Animation? linkedinAnimation;

  @override
  void initState() {
    githubController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    githubAnimation = Tween<double>(begin: 50, end: 55).animate(CurvedAnimation(
        parent: githubController as AnimationController, curve: Curves.linear));
    instagramController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    instagramAnimation = Tween<double>(begin: 50, end: 55).animate(
        CurvedAnimation(
            parent: instagramController as AnimationController,
            curve: Curves.linear));
    linkedinController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    linkedinAnimation = Tween<double>(begin: 50, end: 55).animate(
        CurvedAnimation(
            parent: linkedinController as AnimationController,
            curve: Curves.linear));

    githubController?.repeat(reverse: true);
    instagramController?.repeat(reverse: true);
    linkedinController?.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    githubController?.dispose();
    instagramController?.dispose();
    linkedinController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: Row(
        children: [
          const Spacer(),
          AnimatedBuilder(
            animation: githubAnimation as Animation,
            builder: (_, child) {
              return SizedBox(
                height: githubAnimation!.value,
                width: githubAnimation!.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      launch('https://github.com/samitkapoor');
                    },
                    child: const Icon(
                      FontAwesomeIcons.github,
                      size: 50,
                      color: Color(0xfff5f5f5),
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          AnimatedBuilder(
            animation: instagramAnimation as Animation,
            builder: (_, child) {
              return SizedBox(
                height: instagramAnimation!.value,
                width: instagramAnimation!.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      launch('https://www.instagram.com/im_samit/');
                    },
                    child: const Icon(
                      FontAwesomeIcons.instagram,
                      size: 50,
                      color: Colors.pink,
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          AnimatedBuilder(
            animation: linkedinAnimation as Animation,
            builder: (_, child) {
              return SizedBox(
                height: linkedinAnimation!.value,
                width: linkedinAnimation!.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      launch('https://www.linkedin.com/in/samit-kapoor/');
                    },
                    child: const Icon(
                      FontAwesomeIcons.linkedin,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
