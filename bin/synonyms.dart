import 'dart:io';

void main() {
  Map<String, String> englishToArabic = {
  'hello': 'مرحبا',
  'car': 'سيارة',
  'sit': 'جلس',
  'stop': 'قف',
  'write': 'كتب',
  'apple': 'تفاحة',
  'house': 'منزل',
  'friend': 'صديق',
  'book': 'كتاب',
  'computer': 'حاسوب',
  'cat': 'قطة',
  'dog': 'كلب',
  'flower': 'زهرة',
  'water': 'ماء',
  'sun': 'شمس',
  'moon': 'قمر',
  'food': 'طعام',
  'love': 'حب',
  'music': 'موسيقى',
  'time': 'وقت',
  'happy': 'سعيد',
  'sad': 'حزين',
  'goodbye': 'وداعاً',
  'school': 'مدرسة',
  'teacher': 'معلم',
  'student': 'طالب',
  'family': 'عائلة',
  'city': 'مدينة',
  'color': 'لون',
  };


  Map<String, List<String>> synonyms = {
  'hello': ['hi', 'greetings'],
  'car': ['automobile', 'vehicle'],
  'sit': ['lie', 'sleep'],
  'stop': ['halt', 'cease'],
  'write': ['record', 'scribe'],
  'apple': ['fruit', 'pomaceous'],
  'house': ['home', 'residence'],
  'friend': ['companion', 'pal'],
  'book': ['novel', 'publication'],
  'computer': ['PC', 'machine'],
  'cat': ['feline', 'kitty'],
  'dog': ['canine', 'pooch'],
  'flower': ['blossom', 'bloom'],
  'water': ['liquid', 'aquatic'],
  'sun': ['star', 'solar'],
  'moon': ['lunar', 'satellite'],
  'food': ['nourishment', 'cuisine'],
  'love': ['affection', 'passion'],
  'music': ['melody', 'tunes'],
  'time': ['duration', 'moment'],
  'happy': ['joyful', 'content'],
  'sad': ['unhappy', 'depressed'],
  'goodbye': ['farewell', 'adios'],
  'school': ['educational institution', 'academy'],
  'teacher': ['educator', 'instructor'],
  'student': ['pupil', 'learner'],
  'family': ['relatives', 'kin'],
  'city': ['metropolis', 'urban center'],
  'color': ['hue', 'shade'],
  };

  Map<String, List<String>> antonyms = {
  'hello': ['goodbye', 'farewell'],
  'car': ['bike', 'bicycle'],
  'sit': ['stand', 'rise'],
  'stop': ['go', 'continue'],
  'write': ['erase', 'delete'],
  'apple': ['orange', 'banana'],
  'house': ['apartment', 'condo'],
  'friend': ['enemy', 'foe'],
  'book': ['movie', 'film'],
  'computer': ['manual', 'analog'],
  'cat': ['dog', 'canine'],
  'dog': ['cat', 'feline'],
  'flower': ['weed', 'thorn'],
  'water': ['fire', 'dryness'],
  'sun': ['moon', 'night'],
  'moon': ['sun', 'day'],
  'food': ['hunger', 'starvation'],
  'love': ['hate', 'dislike'],
  'music': ['silence', 'quiet'],
  'time': ['eternity', 'infinity'],
  'happy': ['sad', 'unhappy'],
  'sad': ['happy', 'joyful'],
  'goodbye': ['hello', 'greetings'],
  'school': ['vacation', 'break'],
  'teacher': ['student', 'learner'],
  'student': ['teacher', 'instructor'],
  'family': ['stranger', 'outsider'],
  'city': ['village', 'countryside'],
  'color': ['black-and-white', 'monochrome'],
  };

  while (true) {
    print('Welcome to the translation system');
    print('To translate a single word, press 1');
    print('To translate a sentence, press 2');
    print('To exit, press 3');

    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        print('Enter a word in English: ');
        String userInput = stdin.readLineSync()!;
        String? wordTranslation = translateWord(userInput, englishToArabic);

        if (wordTranslation != null) {
          print('Translation: $wordTranslation');

          print("To get synonyms choose 1\nTo get antonymus choose 2\nNone choose 3 ");
          String choice = stdin.readLineSync()!;
          switch (choice) {
            case "1":
              print('Synonyms: ${synonyms[userInput]!.join(', ')}');
              break;
            case "2":
              print('Antonyms: ${antonyms[userInput]!.join(', ')}');
            case "3":
              continue;
            default:
            print('Invalid option. Please enter 1, 2 or 3.');
            continue;
          }
        } else {
          print('This word is not in the dictionary.');
        }
        break;

      case "2":
        print('Enter a sentence in English: ');
        String userInput = stdin.readLineSync()!;
        String sentenceTranslation = translateEnglishWords(userInput);
        print('Translation: $sentenceTranslation');
        break;

      case "3":
        exit(0);

      default:
        print('Invalid option. Please enter 1, 2, or 3.');
        continue;
    }
  }
}

String? translateWord(String word, Map<String, String> translationMap) {
  String? translatedWord = translationMap[word];
  return translatedWord;
}

String translateEnglishWords(String input) {
  const english = [
    "Hello", 
    "How are you", 
    "Welcome", 
    "Yes", 
    "Good morning", 
    "Thank you", 
    "Please", 
    "I need help",
    "What is your name?",
    "How is the weather today?"
  ];

  const arabic = [
    "أهلا وسهلا", 
    "كيف حالك", 
    "مرحبا", 
    "نعم", 
    "صباح الخير", 
    "شكراً", 
    "من فضلك", 
    "أحتاج مساعدة",
    "ما اسمك؟",
    "كيف حال الطقس اليوم؟"
  ];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }
  return input;
}

