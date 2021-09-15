import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>();
  int _count = 0;

  void push(T element) {
    _stack.addLast(element);
    _count++;
  }

  T pop() {
    final T lastElement = _stack.last;
    _stack.removeLast();
    _count--;
    return lastElement;
  }

  T peek() {
    return _stack.last;
  }

  void clear() {
    _stack.clear();
    _count = 0;
  }

  bool get isEmpty => _stack.isEmpty;
  int get count => _count;
}
