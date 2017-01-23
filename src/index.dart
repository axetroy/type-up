import 'dart:core';
import 'dart:html';
import 'dart:math';
import 'dart:async';

final List keyboardMap = [
  "",
  "",
  "",
  "CANCEL",
  "",
  "",
  "HELP",
  "",
  "BACK SPACE",
  "TAB",
  "",
  "",
  "CLEAR",
  "ENTER",
  "ENTER SPECIAL",
  "",
  "SHIFT",
  "CONTROL",
  "ALT",
  "PAUSE",
  "CAPS LOCK",
  "KANA",
  "EISU",
  "JUNJA",
  "FINAL",
  "HANJA",
  "",
  "ESCAPE",
  "CONVERT",
  "NONCONVERT",
  "ACCEPT",
  "MODECHANGE",
  "SPACE",
  "PAGE UP",
  "PAGE DOWN",
  "END",
  "HOME",
  "LEFT",
  "UP",
  "RIGHT",
  "DOWN",
  "SELECT",
  "PRINT",
  "EXECUTE",
  "PRINTSCREEN",
  "INSERT",
  "DELETE",
  "",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "COLON",
  "SEMICOLON",
  "LESS THAN",
  "EQUALS",
  "GREATER THAN",
  "QUESTION MARK",
  "AT",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "OS KEY",
  "",
  "CONTEXT MENU",
  "",
  "SLEEP",
  "NUMPAD0",
  "NUMPAD1",
  "NUMPAD2",
  "NUMPAD3",
  "NUMPAD4",
  "NUMPAD5",
  "NUMPAD6",
  "NUMPAD7",
  "NUMPAD8",
  "NUMPAD9",
  "MULTIPLY",
  "ADD",
  "SEPARATOR",
  "SUBTRACT",
  "DECIMAL",
  "DIVIDE",
  "F1",
  "F2",
  "F3",
  "F4",
  "F5",
  "F6",
  "F7",
  "F8",
  "F9",
  "F10",
  "F11",
  "F12",
  "F13",
  "F14",
  "F15",
  "F16",
  "F17",
  "F18",
  "F19",
  "F20",
  "F21",
  "F22",
  "F23",
  "F24",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "NUM LOCK",
  "SCROLL LOCK",
  "WIN OEM FJ JISHO",
  "WIN OEM FJ MASSHOU",
  "WIN OEM FJ TOUROKU",
  "WIN OEM FJ LOYA",
  "WIN OEM FJ ROYA",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "CIRCUMFLEX",
  "EXCLAMATION",
  "DOUBLE QUOTE",
  "HASH",
  "DOLLAR",
  "PERCENT",
  "AMPERSAND",
  "UNDERSCORE",
  "OPEN PAREN",
  "CLOSE PAREN",
  "ASTERISK",
  "PLUS",
  "PIPE",
  "HYPHEN MINUS",
  "OPEN CURLY BRACKET",
  "CLOSE CURLY BRACKET",
  "TILDE",
  "",
  "",
  "",
  "",
  "VOLUME MUTE",
  "VOLUME DOWN",
  "VOLUME UP",
  "",
  "",
  "SEMICOLON",
  "EQUALS",
  "COMMA",
  "MINUS",
  "PERIOD",
  "SLASH",
  "BACK QUOTE",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "OPEN BRACKET",
  "BACK SLASH",
  "CLOSE BRACKET",
  "QUOTE",
  "",
  "META",
  "ALTGR",
  "",
  "WIN ICO HELP",
  "WIN ICO 00",
  "",
  "WIN ICO CLEAR",
  "",
  "",
  "WIN OEM RESET",
  "WIN OEM JUMP",
  "WIN OEM PA1",
  "WIN OEM PA2",
  "WIN OEM PA3",
  "WIN OEM WSCTRL",
  "WIN OEM CUSEL",
  "WIN OEM ATTN",
  "WIN OEM FINISH",
  "WIN OEM COPY",
  "WIN OEM AUTO",
  "WIN OEM ENLW",
  "WIN OEM BACKTAB",
  "ATTN",
  "CRSEL",
  "EXSEL",
  "EREOF",
  "PLAY",
  "ZOOM",
  "",
  "PA1",
  "WIN OEM CLEAR",
  ""
];

class Coordinate {
  int x = 0;
  int y = 0;
}

class RandomCoordinate extends Coordinate {}

var coordinate = new Coordinate();
var randomCoordinate = new RandomCoordinate();

var random = new Random();

void main() {
  window.onMouseMove.listen((MouseEvent event) =>
    recordCoordinate(event));

  window.onKeyUp.listen((KeyEvent event) => keyUpHandler(event));
}

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

void recordCoordinate(MouseEvent event) {
  coordinate.x = event.page.x;
  coordinate.y = event.page.y;
}

RandomCoordinate randomXY(int x, int y) {
  var radius = 50 + random.nextInt(50); // 随机的半径
  var angle = random.nextInt(360); // 随机的角度
  var width = 0;
  var height = 0;

  if (angle >= 0 && angle < 90) {
    height = radius * sin(angle * 2 * PI / 360);
    width = radius * cos(angle * 2 * PI / 360);
    x = x + width;
    y = y - height;
  }
  else if (angle >= 90 && angle < 180) {
    height = radius * sin((180 - angle) * 2 * PI / 360);
    width = radius * cos((180 * angle) * 2 * PI / 360);
    x = x - width;
    y = y - height;
  }
  else if (angle >= 180 && angle < 270) {
    height = radius * cos((270 - angle) * 2 * PI / 360);
    width = radius * sin((270 * angle) * 2 * PI / 360);
    x = x - width;
    y = y + height;
  }
  else if (angle >= 270 && angle <= 360) {
    height = radius * cos((angle - 270) * 2 * PI / 360);
    width = radius * sin((angle - 270) * 2 * PI / 360);
    x = x + width;
    y = y + height;
  }

  randomCoordinate.x = x;
  randomCoordinate.y = y;

  return randomCoordinate;
}

void keyUpHandler(KeyEvent event) {
  String key = event.keyCode.toString() + event.key;
  RandomCoordinate xy = randomXY(coordinate.x, coordinate.y);
  createElement(
    key: keyboardMap[event.keyCode],
    color: stringToColor('$key $key'),
    x: xy.x,
    y: xy.y
  );
}

const TIMEOUT = const Duration(seconds: 3);

void removeElement(Element element) {
  element.remove();
}

void createElement({String key, String color, num x, num y}) {
  Element ele = document.createElement('div');
  ele.style.position = 'absolute';
  ele.style.zIndex = "999999999";
  ele.style.top = '${y}px';
  ele.style.left = '${x}px';
  ele.style.display = 'inline-block';
  ele.style.padding = '3px 5px';
  ele.style.fontSize = '11px';
  ele.style.lineHeight = '10px';
  ele.style.color = color;
  ele.style.verticalAlign = 'middle';
  ele.style.backgroundColor = '#fcfcfc';
  ele.style.border = 'solid 1px #ccc';
  ele.style.borderBottomColor = '#bbb';
  ele.style.borderRadius = '3px';
  ele.style.boxShadow = 'inset 0 -1px 0 #bbb';

  ele.innerHtml = key;

  document.body.append(ele);

  new Timer(const Duration(milliseconds: 500), () {
    ele.remove();
  });
}