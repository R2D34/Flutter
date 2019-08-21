import 'package:first_app/scoped-models/connected_products.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import './connected_products.dart';

mixin UserModel on ConnectedProducts {

  void login(String email, String password) {
    authenticatedUser = User(id: 'faasksak', email: email, password: password);
  }
}