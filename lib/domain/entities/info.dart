abstract class Info {
  int get number;
  String get infoName;
  String get infoText;

  String getConnectedInfoName() {
    var indexes = findSingleChars(infoName);
    String result = infoName;
    for (var index in indexes) {
      result = replaceAtIndex(index, result, '\u00A0');
    }
    return result;
  }

  List findSingleChars(String input) {
    var indexes = [];

    for (int i = 1; i < input.length - 1; i++) {
      if (input[i - 1] == ' ' && input[i + 1] == ' ') {
        indexes.add(i);
      }
    }

    return indexes;
  }

  String replaceAtIndex(int index, String input, String replace) {
    return input.substring(0, index+1) + replace + input.substring(index + 2);
  }
}
