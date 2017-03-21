import 'dart:core';
import 'dart:html';
import 'dart:math';
import 'dart:async';

import 'keyBordMaps.dart';
import 'stringToColor.dart';
import 'randomcCoordinate.dart';

Point mousePoint = new Point(0, 0);


void main() {
  injectStyles();

  window.onMouseMove.listen((MouseEvent event) {
    mousePoint = new Point(event.page.x, event.page.y);
  });

  window.onKeyUp.listen((KeyEvent event) => keyUpHandler(event));

  window.onClick.listen((MouseEvent event) => clickHandler(event));
}

void clickHandler(MouseEvent event) {
  final num x = event.page.x;
  final num y = event.page.y;
  final num width = 200;
  final num height = 200;

  Element ele = new Element.html('<span class="ripple"></span>');
  ele.style.width = "${width}px";
  ele.style.height = "${height}px";
  ele.style.left = "${x - width / 2}px";
  ele.style.top = "${y - height / 2}px";
  document.body.append(ele);

  new Timer(const Duration(milliseconds: 750), () {
    ele.remove();
  });
}

void keyUpHandler(KeyEvent event) {
  String key = event.keyCode.toString() + event.key;
  Point point = randomXY(x: mousePoint.x, y: mousePoint.y);
  createElement(
    key: keyboardMap[event.keyCode],
    color: stringToColor('$key $key'),
    x: point.x,
    y: point.y
  );
}

void removeElement(Element element) {
  element.remove();
}

void createElement({String key, String color, num x, num y}) {
  Element ele = new Element.html('<div>$key</div>');
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

  final StyleElement styleElement = querySelector('style#type-up');

  if (styleElement == null) {
    injectStyles();
  }

  document.body.append(ele);

  new Timer(const Duration(milliseconds: 500), () {
    ele.remove();
  });
}

void injectStyles() {
  final String rule = """
@keyframes ripple {
  to {
    transform: scale(2);
    opacity: 0;
  }
}
  """;
  StyleElement styleElement = new StyleElement();

  styleElement.id = 'type-up';

  document.head.append(styleElement);

  CssStyleSheet sheet = styleElement.sheet;

  sheet.insertRule(rule, sheet.cssRules.length);

  final rule2 = """
.ripple {
  position: absolute;
  z-index:99999999;
  background: rgba(0,0,0,.15);
  border-radius: 100%;
  transform: scale(0);
  pointer-events: none;
  animation: ripple .75s ease-out;
}""";
  sheet.insertRule(rule2, sheet.cssRules.length);
}