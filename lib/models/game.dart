class Game {
  List<int> _square = [-1, -1, -1, -1, -1, -1, -1, -1, -1];

  List<int> get square => _square;

  set square(List<int> sq) => {
        if (sq.length == 9) {this._square = sq}
  };

  void setSquare(int index, cross_zero) {
    _square[index] = cross_zero;
  }
}
