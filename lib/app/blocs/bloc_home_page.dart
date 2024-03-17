import 'dart:async';

enum TranscriptType { link, local }

class BlocHomePage {
  BlocHomePage();

  final StreamController<TranscriptType> _transcriptTypeStreamController =
      StreamController<TranscriptType>.broadcast();
  Stream<TranscriptType> get transcriptTypeStream =>
      _transcriptTypeStreamController.stream;
  Sink<TranscriptType> get transcriptTypeSink =>
      _transcriptTypeStreamController.sink;

  void setTranscriptType(TranscriptType transcriptType) {
    transcriptTypeSink.add(transcriptType);
  }
}
