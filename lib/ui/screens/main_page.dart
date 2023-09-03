import 'dart:ui';
import 'dart:html' as html;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/ui/widgets/button_primary.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/background image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 920,
                  ),
                  Positioned(
                    top: 25,
                    left: 25,
                    height: 200,
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset("assets/images/Me.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 200,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: AutoSizeText(
                              "Hi I'm Mark",
                              style: GoogleFonts.permanentMarker(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 120,
                                ),
                              ),
                              maxLines: 1,
                              stepGranularity: 5,
                              minFontSize: 40,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: SelectionArea(
                            child: AutoSizeText(
                              "   I completed my studies at Lublin University of Technology in the field of Computer Science with a GPA of 4.5, "
                              "thus obtaining a master's degree. However, initially, I had to earn a bachelor's degree, and for that purpose,"
                              " I, along with a colleague, developed a mobile application using Flutter. During my master's studies, "
                              "I used the cross-platform capabilities of Flutter, completing subjects by creating programs within this framework. "
                              "My master's thesis revolved around comparing Firebase and MySQL databases in mobile applications built with Flutter. "
                              "Altogether, I have been working with this framework for 2 years now, and over this period, I have acquired a lot of experience.",
                              style: GoogleFonts.righteous(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              maxLines: MediaQuery.of(context).size.width > 650
                                  ? 10
                                  : 13,
                              stepGranularity: 1,
                              minFontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 800,
                    height: 100,
                    //bottom: 5,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPrimary(
                            onPressed: () => context.go('/projects'),
                            text: 'Projects',
                            height: 100,
                            width: MediaQuery.of(context).size.width / 4),
                        ButtonPrimary(
                            onPressed: () => html.window
                                .open('https://github.com/Borokoro', 'Github'),
                            text: 'Github',
                            height: 100,
                            width: MediaQuery.of(context).size.width / 4),
                        ButtonPrimary(
                            onPressed: () =>
                                html.window.open('assets/pdf/CV.pdf', 'PDF'),
                            text: 'CV',
                            height: 100,
                            width: MediaQuery.of(context).size.width / 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
