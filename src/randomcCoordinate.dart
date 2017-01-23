import 'dart:html';
import 'dart:math';

Point randomXY({int x, int y}) {
  num radius = 50 + new Random().nextInt(50); // 随机的半径
  num angle = new Random().nextInt(360); // 随机的角度
  num width = 0;
  num height = 0;

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
  return new Point(x, y);
}