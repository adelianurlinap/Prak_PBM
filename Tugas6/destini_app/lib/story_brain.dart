import 'story.dart';

class StoryBrain {
  final List<Story> _storyData = [
    Story(
      storyTitle:
      'You have won a backstage pass to an NCT 127 concert! As you walk in, you see Taeyong and Doyoung discussing their next song. They notice you and invite you to join them.',
      choice1: 'Join the conversation with Taeyong and Doyoung.',
      choice2: 'Excitedly ask for a photo with them.',
    ),
    Story(
      storyTitle: 'Taeyong and Doyoung smile and welcome you to their discussion. They ask for your opinion on their new song idea.',
      choice1: 'Give them a suggestion for their song.',
      choice2: 'Thank them and move on to explore the backstage.',
    ),
    Story(
      storyTitle:
      'You take a photo with Taeyong and Doyoung. Just then, Johnny walks by and asks if you want to join the rest of the members for a group photo.',
      choice1: 'Join the group photo.',
      choice2: 'Politely decline and explore the backstage.',
    ),
    Story(
      storyTitle:
      'They love your suggestion and decide to incorporate it into their song. You end up spending the whole evening with NCT 127, helping them and learning about their creative process.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle:
      'You explore the backstage and stumble upon a rehearsal session. You quietly watch as they practice, amazed by their talent and dedication.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle:
      'You join the group photo and the members thank you for being a great fan. The experience leaves you with unforgettable memories and a bunch of photos to cherish.',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  int _storyNumber = 0;

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 1;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber >= 3) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }
}