import 'package:milestone_2/domain/models/quiz.dart';
import 'package:milestone_2/domain/quiz_repository.dart';

class RepositoryQuizImpl extends RepositoryQuiz {

  RepositoryQuizImpl();

  @override
  Quiz getQuiz() {
    final questions = [
      Question(
        questionText: 'Какой столицей является Париж?',
        options: ['Лондон', 'Мадрид', 'Париж', 'Рим'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Сколько планет в Солнечной системе?',
        options: ['7', '9', '8', '6'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Что такое гравитация?',
        options: [
          'Свет',
          'Звук',
          'Сила, притягивающая объекты',
          'Электричество'
        ],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Какой химический элемент обозначается как "O"?',
        options: ['Оксиген', 'Оксид', 'Оцетин', 'Окраска'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Какая страна является самой большой по площади?',
        options: ['Россия', 'Канада', 'США', 'Китай'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Кто написал роман "Война и мир"?',
        options: [
          'Лев Толстой',
          'Фёдор Достоевский',
          'Александр Пушкин',
          'Марк Твен'
        ],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Какое животное является символом Австралии?',
        options: ['Кенгуру', 'Коала', 'Вомбат', 'Ему'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Сколько месяцев в году имеют 31 дней?',
        options: ['4', '5', '7', '8'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText:
            'Какая планета называется "Утренней Звездой" и "Вечерней Звездой"?',
        options: ['Венера', 'Марс', 'Юпитер', 'Меркурий'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Как называется самая высокая гора в мире?',
        options: ['Эльбрус', 'Килиманджаро', 'Альпы', 'Эверест'],
        correctOptionIndex: 3,
      ),
      Question(
        questionText: 'Кто написал пьесу "Гамлет"?',
        options: [
          'Уильям Шекспир',
          'Антон Чехов',
          'Фёдор Достоевский',
          'Марк Твен'
        ],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Какой элемент таблицы Менделеева обозначается как "Fe"?',
        options: ['Фосфор', 'Фтор', 'Железо', 'Франций'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Сколько игроков на поле в команде футбола?',
        options: ['8', '10', '11', '12'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Какая столица Японии?',
        options: ['Сеул', 'Пекин', 'Токио', 'Бангкок'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Какой химический элемент обозначается как "H"?',
        options: ['Гелий', 'Гидроген', 'Железо', 'Гафний'],
        correctOptionIndex: 1,
      )
    ];
    return Quiz(questions: questions, totalQuestions: 15, timeLimit: 300);
  }
}
