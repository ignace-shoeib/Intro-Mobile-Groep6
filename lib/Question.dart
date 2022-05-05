enum questionType { multipleChoice, openVraag, codeCorrection }

class Vraag {
  final String vraagInhoud;
  const Vraag(this.vraagInhoud, questionType type);
}
