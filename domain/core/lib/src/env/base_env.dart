import 'env.dart';
import 'package:envied/envied.dart';

part 'base_env.g.dart';

@Envied(path: '.env')
class BaseEnv implements Env {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _BaseEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}
