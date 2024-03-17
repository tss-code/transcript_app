import 'package:flutter/material.dart';

class TranscriptionComponent extends StatelessWidget {
  const TranscriptionComponent({
    super.key,
    required this.transcription,
    required this.perimeter,
  });

  final String transcription;
  final double perimeter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(perimeter * 0.01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(perimeter * 0.01),
            topLeft: Radius.circular(perimeter * 0.01),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 198, 198, 198),
              blurRadius: 2,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: SingleChildScrollView(child: Text(transcription)),
      ),
    );
  }
}
