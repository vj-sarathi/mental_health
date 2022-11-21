import 'answers.dart';

class QuestionsItemModel {
  final String question;
  final List<AnswersItemModel> answersItemModel;

  QuestionsItemModel({required this.question, required this.answersItemModel});
}

List<QuestionsItemModel> dummyList = [
  QuestionsItemModel(
      question: "1. Having little interest or pleasure in doing things?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all",),
        AnswersItemModel(answerText: "B. Several Days"),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day", isCorrectAnswer: true),
      ]),
  QuestionsItemModel(
      question: "2. Feeling down, depressed or hopeless?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question: "3. Trouble falling asleep, staying asleep, or sleeping too much?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question: "4. Poor Appetite or overeating?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question:
          "5. Feeling bad about yourself – or that you are a failure or have let yourself or your family down?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question:
          "6. Trouble concentrating on things, such as reading the newspaper or watching television?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question:
          "7. Moving or speaking so slowly that other people could notice, or the opposite – being so fidgety or restless that you could have been moving around much more than usual?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question:
          "8. Thoughts of being better off dead or of hurting yourself in some way?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. Not at all"),
        AnswersItemModel(answerText: "B. Several Days", isCorrectAnswer: true),
        AnswersItemModel(answerText: "C. More than half the days"),
        AnswersItemModel(answerText: "D. Nearly every day"),
      ]),
  QuestionsItemModel(
      question:
          "9. How much you like about yourself?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. 25"),
        AnswersItemModel(answerText: "B. 50"),
        AnswersItemModel(answerText: "C. 75"),
        AnswersItemModel(answerText: "D. 100", isCorrectAnswer: true),
      ]),
  QuestionsItemModel(
      question:
      "10.Rate your health percentage?",
      answersItemModel: [
        AnswersItemModel(answerText: "A. 25"),
        AnswersItemModel(answerText: "B. 50"),
        AnswersItemModel(answerText: "C. 75"),
        AnswersItemModel(answerText: "D. 100", isCorrectAnswer: true),
      ]),
];
