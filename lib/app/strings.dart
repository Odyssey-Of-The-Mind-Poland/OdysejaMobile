abstract class AppStrings {
  static const String title = 'Łappka Omera';
  // Error messages
  static const String databaseFailureMessage = 'Pojawił się błąd przy ładowaniu danych';
  static const String databaseFavFailureMessage = 'Zapisanie przedstawienia nie powiodło się';
  static const String connectionFailureMessage = 'Brak dostępu do Internetu';
  static const String timeoutFailureMessage = 'Nie udało się nawiązać połączenia';
  static const String unknownFailureMessage = 'Wystapił nieznany błąd :(';
  static const String serverFailureMessage = 'Błąd serwera';
  // Age group labels
  static const String juniors = 'Juniorzy';
  static const String firstDivision = '> V klasa';
  static const String secondDivision = 'VI – VIII klasa';
  static const String thirdDivision = 'Liceum / technikum';
  static const String forthDivision = 'Uczelnie wyższe';

  static const String homeScreenTitle = 'Dziękujemy';
  static const String infoScreenTitle = 'Informacje';
  static const String scheduleScreenTitle = 'Harmonogram';
  static const String favScreenTitle = 'Ulubione';

  static const String welcomeScreenPage1Title = 'Cześć!';
  static const String welcomeScreenPage1Content =
      'Witaj na Finale Odysei Umysłu! Przed Tobą wielkie wyzwanie - aby je uprzyjemnić, oddajemy w Twoje łapki aplikację, która Ci pomoże.';
  static const String nextButtonLabel = 'DALEJ';

  static const String welcomeScreenPage2Title = 'Funkcje:';
  static const String welcomeScreenPage2Heading1 = 'Informacje o konkursie';
  static const String welcomeScreenPage2Content1 =
      'Wygodny dostęp do najważniejszych informacji w\u00A0zasięgu Twojej łapki!';
  static const String welcomeScreenPage2Heading2 = 'Harmonogram';
  static const String welcomeScreenPage2Content2 =
      'Szybko sprawdź godziny występów i\u00A0problemów spontanicznych swojej drużyny i\u00A0nie tylko!';
  static const String welcomeScreenPage2Heading3 = 'Ulubione występy';
  static const String welcomeScreenPage2Content3 =
      'Wszystkie występy, które chcesz obejrzeć, w\u00A0jednym miejscu!';
  static const String beginButtonLabel = 'ZACZYNAJMY!';

  static const String scheduleScreenStageHeading = 'Scena';
  static const String scheduleScreenProblemHeading = 'Problem długoterminowy';
  static const String scheduleScreenDivisionHeading = 'Grupa wiekowa';

  static const String problem = 'Problem';
  static const String stage = 'Scena';
  static const String age = 'Gr. wiekowa';

  static const String juniorProblem = 'Problem juniorski';
  static const String juniorGroup = 'Grupa juniorska';

  static const String soonImplemented = 'Funkcja będzie wkrótce dostępna :)';

  static const String performanceGroupButtonExpand = 'ZOBACZ WSZYSTKO';
  static const String performanceGroupButtonExpanded = 'ZWIŃ';

  static const String empty = '';

  static const Map<int, String> divisionSymbols = {
    0: 'J',
    1: 'I',
    2: 'II',
    3: 'III',
    4: 'IV',
  };

  static const String firstDay = 'Sobota';
  static const String secondDay = 'Niedziela';
  static const String partOne = '(cz. 1)';
  static const String partTwo = '(cz. 2)';

  static const String close = 'ZAMKNIJ';
  static const String removeFromFavsLabel = 'USUŃ Z ULUBIONYCH';
  static const String addToFavsLabel = 'DODAJ DO ULUBIONYCH';

  static const String performance = 'Występ';
  static const String spontan = 'Spontan';

  static const String performanceToolTip =
      'Drużyna powinna się\nzgłosić na 20-30 minut\nprzed występem!';
  static const String spontanToolTip = 'Drużyna powinna się\nzgłosić na 30 minut\nprzed czasem!';

  static const String click = 'Kliknij';
  static const String emptyFavouritesCaption = 'Wybrane przedstawienie,\naby go nie przegapić';
}
// \u200B
// \u00A0