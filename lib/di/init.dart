import 'package:app_bloc/app_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:shop_app/di/init.config.dart';
import 'package:use_case/use_case.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(NetworkPackageModule),
  ],
  externalPackageModulesAfter: [
    ExternalModule(UseCasePackageModule),
    ExternalModule(RepositoryPackageModule),
    ExternalModule(AppBlocPackageModule),
  ],
)
Future<GetIt> configInjection() {
  return getIt.init();
}