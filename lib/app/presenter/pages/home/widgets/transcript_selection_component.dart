import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transcript/app/blocs/bloc_home_page.dart';
import 'package:transcript/app/presenter/pages/home/widgets/add_transcription_button.dart';

class TranscriptSelectionComponent extends StatelessWidget {
  const TranscriptSelectionComponent({
    super.key,
    required this.blocHomePage,
    required this.perimeter,
  });

  final BlocHomePage blocHomePage;
  final double perimeter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 1 / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: perimeter * 0.025),
                  StreamBuilder(
                    stream: blocHomePage.transcriptTypeStream,
                    initialData: TranscriptType.link,
                    builder: (context, snapshot) {
                      if (snapshot.data == TranscriptType.local) {
                        return SizedBox(
                          height: perimeter * 0.025,
                          width: perimeter * 0.11,
                          child: const Center(
                            child: Text("from file"),
                          ),
                        );
                      }

                      return SizedBox(
                        width: perimeter * 0.11,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Insert the youtube link",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(perimeter * 0.01),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: perimeter * 0.01),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: perimeter * 0.03,
                      width: perimeter * 0.11,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(perimeter * 0.01),
                      ),
                      child: Text(""),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: perimeter * 0.11,
                width: MediaQuery.of(context).size.width * 0.2,
                child: AddTranscptionButton(
                  perimeter: perimeter,
                  blocHomePage: blocHomePage,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
