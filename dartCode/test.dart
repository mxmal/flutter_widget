typedef Fly = void Function(int value);
void main() {
//  Bird bird = Bird((int a){print(a);});//如果实参函数的类型不是该类型的话 编译不通过
//  bird.fly(3);

  Function test = () {
    int i;
    for (i = 0; i < 10; i++) {
      i += i;
    }
    return i;
  };
  print(test());
}

class Bird {
  Fly fly;
  Bird(this.fly);
}
