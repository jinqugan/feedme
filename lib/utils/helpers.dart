String leadingNumber(int number, int width, {String padding = '0'}) {
  return number.toString().padLeft(width, padding);
}
