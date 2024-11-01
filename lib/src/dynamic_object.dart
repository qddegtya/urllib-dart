/// 使用 noSuchMethod 来拦截方法调用，从而实现动态对象
class DynamicObject {
  final Map<String, dynamic> _data = {};

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final name = invocation.memberName.toString().split('"')[1];

    if (invocation.isGetter) {
      if (_data.containsKey(name)) {
        var value = _data[name];
        if (value is Function) {
          // 必然是 getter
          return Function.apply(value, [], {});
        }
        return value;
      }
      var newObj = DynamicObject();
      _data[name] = newObj;
      return newObj;
    }

    if (invocation.isMethod && _data.containsKey(name)) {
      var method = _data[name];
      if (method is Function) {
        return Function.apply(
            method, invocation.positionalArguments, invocation.namedArguments);
      }
    }

    return null;
  }

  void addMethod(String name, Function method) {
    _data[name] = method;
  }
}
