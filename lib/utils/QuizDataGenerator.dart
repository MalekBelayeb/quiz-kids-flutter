import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/utils/QuizImages.dart';

import '../model/QuizModels.dart';

List<NewQuizModel> getQuizData() {
  late List<NewQuizModel> list = [];
  NewQuizModel categorie1 = NewQuizModel();
  categorie1.quizName = "Sciences";
  categorie1.totalQuiz = "Gratuit";
  categorie1.quizImage = quiz_ic_science;

  NewQuizModel categorie2 = NewQuizModel();
  categorie2.quizName = "Geographie";
  categorie2.totalQuiz = "Payant";
  categorie2.quizImage = quiz_ic_geo;

  NewQuizModel categorie3 = NewQuizModel();
  categorie3.quizName = "Histoire";
  categorie3.totalQuiz = "Payant";
  categorie3.quizImage = quiz_ic_histoire;

  NewQuizModel categorie4 = NewQuizModel();
  categorie4.quizName = "Art";
  categorie4.totalQuiz = "Gratuit";
  categorie4.quizImage = "images/quiz/quiz_ic_art.png";

  NewQuizModel categorie5 = NewQuizModel();
  categorie5.quizName = " Sport";
  categorie5.totalQuiz = "Payant";
  categorie5.quizImage = quiz_ic_sport;

  NewQuizModel categorie6 = NewQuizModel();
  categorie6.quizName = "Divertissement";
  categorie6.totalQuiz = "Payant";
  categorie6.quizImage = quiz_ic_div;

  list.add(categorie4);
  list.add(categorie3);
  list.add(categorie6);
  list.add(categorie1);
  list.add(categorie5);
  list.add(categorie2);

  return list;
}

//if(QuizTestModel[index] ==0{}
List<QuizTestModel> quizGetData(int index) {
  List<QuizTestModel> list1 = [];
  List<NewQuizModel> list = [];
  NewQuizModel categorie1 = NewQuizModel();
  NewQuizModel categorie2 = NewQuizModel();
  NewQuizModel categorie3 = NewQuizModel();
  NewQuizModel categorie4 = NewQuizModel();
  NewQuizModel categorie5 = NewQuizModel();
  NewQuizModel categorie6 = NewQuizModel();
  if (NewQuizModel().quizName == categorie1.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = "Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expert";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  } else if (NewQuizModel().quizName == categorie2.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = " Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expers";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  } else if (NewQuizModel().quizName == categorie3.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = " Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expers";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  } else if (NewQuizModel().quizName == categorie4.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = "Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expers";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  } else if (NewQuizModel().quizName == categorie5.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = " Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expers";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  } else if (NewQuizModel().quizName == categorie6.quizName) {
    QuizTestModel model1 = QuizTestModel();
    model1.heading = " Niveau1: Facile";
    model1.image = quiz_ic_quiz1;
    model1.type = "Quiz 1";
    model1.status = "true";

    QuizTestModel model2 = QuizTestModel();
    model2.heading = "Niveau2: Moyen";
    model2.image = quiz_ic_quiz2;
    model2.type = "Quiz 2";
    model2.status = "true";

    QuizTestModel model3 = QuizTestModel();
    model3.heading = "Niveau3: Difficile";
    model3.image = quiz_ic_quiz1;
    model3.type = "Quiz 3";
    model3.status = "true";

    QuizTestModel model4 = QuizTestModel();
    model4.heading = "Niveau4: Expers";
    model4.image = quiz_ic_quiz2;
    model4.type = "Quiz 4";
    model4.status = "true";

    list1.add(model1);
    list1.add(model2);
    list1.add(model3);
    list1.add(model4);
  }
  return list1;
}

//work
List<QuizBadgesModel> quizBadgesData() {
  List<QuizBadgesModel> list = [];
  QuizBadgesModel model1 = QuizBadgesModel();
  model1.title = "Réalisatrice";
  model1.subtitle = "Finir un Quiz";
  model1.img = quiz_ic_list2;

  QuizBadgesModel model2 = QuizBadgesModel();
  model2.title = "Perectionist";
  model2.subtitle = "Finir tout les Quiz d'une catégorie";
  model2.img = quiz_ic_list5;

  QuizBadgesModel model3 = QuizBadgesModel();
  model3.title = "Savant";
  model3.subtitle = "Finir deux catégories";
  model3.img = quiz_ic_list3;

  QuizBadgesModel model4 = QuizBadgesModel();
  model4.title = "Champion";
  model4.subtitle = "#1 au Scoreboard";
  model4.img = quiz_ic_list4;

  QuizBadgesModel model5 = QuizBadgesModel();
  model5.title = "Persévérant";
  model5.subtitle = "Etudier un quiz chaque jour pendant 30 jours";
  model5.img = quiz_ic_list5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}

List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = [];
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "Art";
  model1.totalQuiz = "10 Quiz";
  model1.img = quiz_ic_course1;
  model1.scores = "30/100";

  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Science";
  model2.totalQuiz = "10 Quiz";
  model2.img = quiz_ic_course2;
  model2.scores = "30/100";

  QuizScoresModel model3 = QuizScoresModel();
  model3.title = "Histoire";
  model3.totalQuiz = "10 Quiz";
  model3.img = quiz_ic_course3;
  model3.scores = "10/100";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}
