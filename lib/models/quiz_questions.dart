class QuizQuestion {
  const QuizQuestion(this.quest, this.answers);

  final String quest;
  final List<String> answers;

  List<String> getShuffleList() {
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
