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
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [widget.title=='Portfolio' ? Colors.redAccent : const Color(0xE6002327), Color(widget.color)],
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
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Image(
                    opacity: isHover ? const AlwaysStoppedAnimation(1) : const AlwaysStoppedAnimation(0.4),

                    loadingBuilder: (BuildContext context, Widget child,  ImageChunkEvent? loadingProgress){
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    image: isHover ? AssetImage("assets/images/${widget.title}.gif") : AssetImage("assets/images/${widget.title}.jpeg"),
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
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
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
                              child: AutoSizeText(
                                widget.description,
                                stepGranularity: 1,
                                minFontSize: 2,
                                maxLines: MediaQuery.of(context).size.width > 650 ? 4 : 6,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 250,
                              width: MediaQuery.of(context).size.width*0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonPrimary(onPressed: () => html.window.open(widget.githubLink, widget.title),
                                      text: 'Github', height: 40, width: MediaQuery.of(context).size.width/5),
                                  const SizedBox(width: 10,),
                                  widget.title == 'Jumpy Jumper Jumps' ? ButtonPrimary(onPressed: () => html.window.open('https://play.google.com/store/apps/details?id=site.marksprojects.jumpy_jumper_jumps', widget.title),
                                      text: 'Play Store', height: 40, width: MediaQuery.of(context).size.width/5) : const SizedBox(),
                                  const SizedBox(width: 5,),
                                ],
                              ),
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