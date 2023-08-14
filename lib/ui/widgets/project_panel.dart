import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'button_primary.dart';
import 'dart:html' as html;

class ProjectPanel extends StatefulWidget {
  const ProjectPanel({
   super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.githubLink,
});

  final String title;
  final String description;
  final int color;
  final String githubLink;


  @override
  State<ProjectPanel> createState() => _ProjectPanelState();
}

class _ProjectPanelState extends State<ProjectPanel> {
  bool isHover=false;
  bool isHoverButton=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [const Color(0xE6002327), Color(widget.color)],
            stops: isHover ? [1, 1] : [0.6, 1],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: InkWell(
          onTap: (){},
          mouseCursor: SystemMouseCursors.basic,
          onHover: (val) {
            setState(() {
              isHover = val;
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width*0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: isHover ? 1 : 0.4,
                    fit: BoxFit.fitHeight,
                    image: isHover ? AssetImage("assets/images/${widget.title}.gif") : AssetImage("assets/images/${widget.title}.jpeg"),
                  ),
                ),
              ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: isHover ? 0 : MediaQuery.of(context).size.width*0.8-5,
                        curve: Curves.linear,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 120,
                            ),
                            overflow: TextOverflow.ellipsis,
                            stepGranularity: 10,
                            minFontSize: 10,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: isHover ? MediaQuery.of(context).size.width*0.8-5 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: AutoSizeText(
                                widget.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                ),
                                overflow: TextOverflow.clip,
                                stepGranularity: 10,
                                minFontSize: 10,
                                maxLines: 1,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AutoSizeText.rich(
                                TextSpan(text: widget.description),
                                stepGranularity: 1,
                                minFontSize: 2,
                                maxLines: 4,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonPrimary(onPressed: () => html.window.open(widget.githubLink, widget.title),
                                    text: 'Github', height: MediaQuery.of(context).size.height/30, width: MediaQuery.of(context).size.width/10),
                                const SizedBox(width: 5,),
                                widget.title == 'Jumpy Jumper Jumps' ? ButtonPrimary(onPressed: () => html.window.open('https://play.google.com/store/apps/details?id=site.marksprojects.jumpy_jumper_jumps', widget.title),
                                    text: 'Play Store', height: MediaQuery.of(context).size.height/30, width: MediaQuery.of(context).size.width/10) : const SizedBox(),
                                const SizedBox(width: 5,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}