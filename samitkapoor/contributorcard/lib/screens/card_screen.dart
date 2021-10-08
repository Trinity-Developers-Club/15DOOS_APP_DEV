import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:transparent_image/transparent_image.dart';

import '/widgets/animatedbuttons.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              // Colors.white,
              // Colors.grey,
              Color(0xff485563),
              Color(0xff29323c),
            ],
            center: Alignment.bottomCenter,
            radius: 1,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.memoryNetwork(
                      image: 'https://gcdn.pbrd.co/images/Vpi4p4SuptO2.jpg?o=1',
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 700),
                    ),
                  ),
                ),
              ),
              MultiSliver(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        colors: [
                          Color(0xfffc00ff),
                          Color(0xff00dbde),
                        ],
                      ).createShader(rect);
                    },
                    child: const Text(
                      'Samit Kapoor',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'FeatlyNote',
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          textSpan(
                              text: 'I am a ',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textSpan(
                              text: 'Btech CSE 2nd Year Student',
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textSpan(
                              text: ', currently exploring on the world of',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textSpan(
                              text: ' DEVELOPMENT',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textSpan(
                              text: ' with ',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textSpan(
                              text: 'FLUTTER & DART ',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textSpan(
                              text: 'and I am a ',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textSpan(
                              text: '15 Days of Open Source Contributor.',
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SliverToBoxAdapter(
                child: AnimatedButtons(),
              )
            ],
          ),
        ),
      ),
    );
  }

  textSpan(
      {required String text,
      required Color color,
      required FontWeight fontWeight,
      required double fontSize}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: 'RobotoMono',
      ),
    );
  }
}
