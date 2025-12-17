import 'dart:math';
class Tab {

  double res1 = 0; // зміна поточного результату табуляції
  double valueFrom = -5; //мінімальне значення за замовчуванням
  double valueTo = 5;// максимальне значення за замовчуванням
  late double step; // крок табуляції
  double _min = 0; // мінімальний результат
  double _max = 0; // максимальний результат

  Tab(this.step); //конструктор класу

  //getter мінімального та максимального результатів
  double get min => _min;
  double get max => _max;
  // метод setRange, який змінює проміжок даних табуляції
  setRange(double x, double y){
    valueFrom = x;
    valueTo = y;
  }
  // основна програма
  runTab(){
    var x = valueFrom;
    while (x <= valueTo){
      if(x == 0){ // перевірка поточного значення. При значенні х=0 програма видає нескінченне число, що спричиняє помилку в обчисленні
        print("Error. Division by 0");
      }
      else{
        res1 = 16/pow(x, 2);// функція
      }
      
      //print(res1); // виведення поточного результату
      // порівняння значень
      if(x == valueFrom){
        _min = res1;
        _max = res1;
      }
      if(res1 < _min){
        _min = res1;
      }
      if(res1 > _max){
        _max = res1;
      }
      x += step;
    }
  }
}