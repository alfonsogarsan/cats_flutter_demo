import 'package:cats/domain/util/parenthesisProblem/parenthesis_problem.dart';
import 'package:cats/data/auth/token_auth.dart';

class CataasAuth extends TokenAuth {
  @override
  String getToken() {
    return generateValidParenthesisProblemString();
  }
}
