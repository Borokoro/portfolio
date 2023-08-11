import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
          onTap: () {},
          mouseCursor: MouseCursor.uncontrolled,
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
                  //color: Color(0xff28f4f4).withOpacity(0.1),
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
                            //softWrap: false,
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
                                //softWrap: false,
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
                            Align(
                              alignment: const Alignment(0.9,0.9),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width/10,
                                height: MediaQuery.of(context).size.height/30,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    elevation: 1,
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: (){
                                    html.window.open(widget.githubLink, widget.title);
                                  },
                                  child: const AutoSizeText(
                                    'Github',
                                    overflow: TextOverflow.ellipsis,
                                    stepGranularity: 1,
                                    minFontSize: 10,
                                    maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.black,
                                      fontSize: 15,
                                ),),
                                ),
                              ),
                            ),
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