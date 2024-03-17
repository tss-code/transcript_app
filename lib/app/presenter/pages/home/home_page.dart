import 'package:flutter/material.dart';
import 'package:transcript/app/blocs/bloc_home_page.dart';
import 'package:transcript/app/core/hardware/device_screen_information.dart';
import 'package:transcript/app/core/modules/dependency_injector.dart';
import 'package:transcript/app/presenter/pages/home/widgets/transcript_selection_component.dart';
import 'package:transcript/app/presenter/pages/home/widgets/transcription_component.dart';

String transcription =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." +
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." +
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." +
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

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
            TranscriptSelectionComponent(
                blocHomePage: blocHomePage, perimeter: perimeter),
            TranscriptionComponent(
                transcription: transcription, perimeter: perimeter),
          ],
        ),
      ),
    );
  }
}
