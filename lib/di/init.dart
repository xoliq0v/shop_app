import 'package:app_bloc/app_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:core/core.dart';
import 'package:shop_app/di/init.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
    ExternalModule(NavigationPackageModule),
    // ExternalModule(DatabasePackageModule),
    // ExternalModule(NetworkPackageModule),
    // ExternalModule(MapServicePackageModule),
    // ExternalModule(FirebaseEcoPackageModule),
  ],
  externalPackageModulesAfter: [
    // ExternalModule(RepositoryPackageModule),
    // ExternalModule(UseCasePackageModule),
    ExternalModule(AppBlocPackageModule),
  ],
)
Future<GetIt> configInjection() {
  return getIt.init();
}
