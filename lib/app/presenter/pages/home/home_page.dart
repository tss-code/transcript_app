import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transcript/app/blocs/bloc_home_page.dart';
import 'package:transcript/app/core/hardware/device_screen_information.dart';
import 'package:transcript/app/core/modules/dependency_injector.dart';

class HomePage extends StatefulWidget {
  final DependencyInjector dependencyInjector;

  const HomePage({
    required this.dependencyInjector,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BlocHomePage blocHomePage;

  @override
  void initState() {
    blocHomePage = widget.dependencyInjector.fetchDependency<BlocHomePage>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double perimeter = DeviceScreenInformation.perimeter(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: perimeter * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: blocHomePage.transcriptTypeStream,
                  initialData: TranscriptType.link,
                  builder: (context, snapshot) {
                    if (snapshot.data == TranscriptType.local) {
                      return const SizedBox(
                        child: Center(
                          child: Text("from file"),
                        ),
                      );
                    }

                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: -perimeter * 0.11, end: 0),
                      duration: const Duration(seconds: 15),
                      curve: Curves.bounceOut,
                      builder: (context, value, child) {
                        return SizedBox(
                          width: perimeter * 0.11,
                          height: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            children: [
                              Positioned(
                                height: perimeter * 0.03,
                                width: perimeter * 0.11,
                                left: value,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Insert the youtube link",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          perimeter * 0.01),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: perimeter * 0.09,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: AddTranscptionButton(
                    perimeter: perimeter,
                    blocHomePage: blocHomePage,
                  ),
                ),
                SizedBox(width: perimeter * 0.01),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
            "position": widget.perimeter * 0.03,
            "icon": Icons.link,
            "color": const Color.fromARGB(255, 74, 74, 74),
            "function": () {
              widget.blocHomePage.setTranscriptType(TranscriptType.link);
            }
          },
          {
            "position": widget.perimeter * 0.055,
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
              top: 0,
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
