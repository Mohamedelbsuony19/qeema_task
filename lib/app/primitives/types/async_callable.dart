import 'package:qeema_task/app/base_types/base_callable_class.dart';
import 'package:qeema_task/app/primitives/types/future_either_failure.dart';

typedef AsyncCallable<ReturnType, InputType>
    = BaseCallableClass<FutureEitherFailureOrType<ReturnType>, InputType>;
