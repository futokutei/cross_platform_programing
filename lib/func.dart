class Func {
  int x;

  Func(this.x);

  double y() {
     if( x == 0) {
      return 0;
    };
     return 16 / (x * x);
  }
}