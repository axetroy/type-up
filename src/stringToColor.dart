String stringToColor(String str) {
  var hash = 0;
  for (int i = 0; i < str.length; i++) {
    hash = str.codeUnitAt(i) + ((hash << 5) - hash);
  }
  var colour = '#';
  for (int x = 0; x < 3; x++) {
    int value = (hash >> (x * 8)) & 0xFF;
    String str = ('00' + value.toRadixString(16));
    colour += str.substring(str.length - 2);
  }
  return colour;
}