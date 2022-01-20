//TODO: Step 6 - import the story.dart file into this file.
import 'story.dart';

//TODO: Step 5 - Create a new class called StoryBrain.
class StoryBrain {
//TODO: Step 7 - Uncomment the lines below to include storyData as a private property in StoryBrain. Hint: You might need to change something in story.dart to make this work.
  final List<Story> _storyData = [
    Story(
        storyTitle:
        'Ваш автомобиль проколол шину на извилистой дороге посреди пустыни, где нет связи с мобильным телефоном. Вы решили автостопом. Рядом с вами останавливается ржавый пикап. Мужчина в широкополой шляпе с бездушными глазами открывает вам пассажирскую дверь и спрашивает: «Подбросить, мальчик?»".',
        choice1: 'Я залезу внутрь. Спасибо за помощь!',
        choice2: 'Лучше сначала спросите его, убийца ли он.'),
    Story(
        storyTitle: 'Он медленно кивает, не обращая внимания на вопрос.',
        choice1: 'По крайней мере, он честный. Я залезу в.',
        choice2: 'Подожди, я знаю, как поменять шину.'),
    Story(
        storyTitle:
        'Когда вы начинаете водить машину, незнакомец начинает говорить о своих отношениях с матерью. С каждой минутой он становится все злее и злее. Он просит вас открыть бардачок. Внутри вы найдете окровавленный нож, два отрубленных пальца и кассету с Элтоном Джоном. Он тянется к бардачку.',
        choice1: 'Я люблю Элтона Джона! Дайте ему кассету.',
        choice2: 'Это он или я! Вы берете нож и наносите ему удар.'),
    Story(
        storyTitle:
        'Какие? Такая отговорка! Знаете ли вы, что дорожно-транспортные происшествия являются второй ведущей причиной несчастных случаев со смертельным исходом для большинства взрослых возрастных групп?',
        choice1: 'Рестарт',
        choice2: ''),
    Story(
        storyTitle:
        'Когда вы пробиваете ограждение и устремляетесь к зазубренным камням внизу, вы размышляете о сомнительной мудрости нанести удар ножом кому-то, когда они управляют автомобилем, в котором вы находитесь..',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'Вы сближаетесь с убийцей, напевая стихи из песни «Ты чувствуешь любовь сегодня вечером?». Он высадит вас в следующем городе. Перед тем, как уйти, он спрашивает, знаете ли вы, где можно сбрасывать трупы. Вы отвечаете: "Попробуйте пирс".',
        choice1: 'Restart',
        choice2: '')
  ];

  //TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//TODO: Step 8 - Create a method called getStory() that returns the first storyTitle from _storyData.
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

//TODO: Step 11 - Create a method called getChoice1() that returns the text for the first choice1 from _storyData.
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

//TODO: Step 12 - Create a method called getChoice2() that returns the text for the first choice2 from _storyData.
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

//TODO: Step 16 - Create a property called storyNumber which starts with a value of 0. This will be used to track which story the user is currently viewing.

  //TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.
  int _storyNumber = 0;

//TODO: Step 17 - Create a method called nextStory(), it should not have any outputs but it should have 1 input called choiceNumber which will be the choice number (int) made by the user.
  void nextStory(int choiceNumber) {
    //TODO: Step 21 - Using the story plan, update nextStory to change the storyNumber depending on the choice made by the user.
    //When user is on story0 and they chose choice1, the story should progress to story2.
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    }
    //TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyNumber to 0.
    else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

//TODO: Step 20 - Download the story plan here: https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}