import 'dart:core';
import 'dart:html';
import 'dart:math';
import 'dart:async';

import 'keyBordMaps.dart';
import 'stringToColor.dart';
import 'randomcCoordinate.dart';

Point mousePoint = new Point(0, 0);


void main() {
  window.onMouseMove.listen((MouseEvent event) {
    mousePoint = new Point(event.page.x, event.page.y);
  });

  window.onKeyUp.listen((KeyEvent event) => keyUpHandler(event));
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

const TIMEOUT = const Duration(seconds: 3);

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

  document.body.append(ele);

  new Timer(const Duration(milliseconds: 500), () {
    ele.remove();
  });
}