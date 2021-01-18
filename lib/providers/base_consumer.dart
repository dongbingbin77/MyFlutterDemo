
import 'package:provider/provider.dart';

class BaseConsumer<T> extends Consumer{

  BaseConsumer({
    key,
     builder,
     child,
  }):super(key: key,builder: builder, child: child);
}