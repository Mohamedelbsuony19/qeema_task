import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'injection_container.dart';
import 'presentation/blocs/product/product_bloc.dart';

List<SingleChildWidget> providers = [
  BlocProvider(
    create: (context) => sl<ProductBloc>()
      ..add(
        const ProductEvent.getAllProducts(),
      ),
  ),
];
