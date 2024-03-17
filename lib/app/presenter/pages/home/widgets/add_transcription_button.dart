import 'package:flutter/material.dart';
import 'package:transcript/app/blocs/bloc_home_page.dart';

class AddTranscptionButton extends StatefulWidget {
  const AddTranscptionButton({
    super.key,
    required this.perimeter,
    required this.blocHomePage,
  });

  final double perimeter;
  final BlocHomePage blocHomePage;

  @override
  State<AddTranscptionButton> createState() => _AddTranscptionButtonState();
}

class _AddTranscptionButtonState extends State<AddTranscptionButton> {
  late bool showButtons;
  late List<Widget> optional;

  void updateChildren() {
    setState(() {
      showButtons = !showButtons;
      if (showButtons) {
        [
          {
            "position": widget.perimeter * 0.055,
            "icon": Icons.link,
            "color": const Color.fromARGB(255, 74, 74, 74),
            "function": () {
              widget.blocHomePage.setTranscriptType(TranscriptType.link);
            }
          },
          {
            "position": widget.perimeter * 0.08,
            "icon": Icons.storage,
            "color": const Color.fromARGB(255, 142, 142, 142),
            "function": () {
              widget.blocHomePage.setTranscriptType(TranscriptType.local);
            }
          }
        ].forEach((element) {
          optional.add(
            Positioned(
              top: element["position"] as double,
              child: AnimatedContainer(
                duration: const Duration(seconds: 15),
                curve: Curves.bounceInOut,
                child: GestureDetector(
                  onTap: element["function"] as void Function(),
                  child: Container(
                    height: widget.perimeter * 0.02,
                    width: widget.perimeter * 0.02,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: element["color"] as Color,
                    ),
                    child: Center(
                      child: Icon(
                        element["icon"] as IconData,
                        color: Colors.white,
                        size: widget.perimeter * 0.01,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
        return;
      }
      optional = [];
    });
  }

  @override
  void initState() {
    showButtons = false;
    optional = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
            Positioned(
              top: widget.perimeter * 0.025,
              child: GestureDetector(
                onTap: () {
                  updateChildren();
                },
                child: Container(
                  height: widget.perimeter * 0.025,
                  width: widget.perimeter * 0.025,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 26, 26, 26),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: widget.perimeter * 0.01,
                    ),
                  ),
                ),
              ),
            ),
          ] +
          optional,
    );
  }
}
