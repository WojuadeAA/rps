enum Sign {
  rock,
  paper,
  scissors,
}

extension SignProperty on Sign {
  String get emoji {
    switch (this) {
      case Sign.rock:
        return '👊';
      case Sign.paper:
        return '✋🏼';
      case Sign.scissors:
        return '✌🏼';
    }
  }
}
