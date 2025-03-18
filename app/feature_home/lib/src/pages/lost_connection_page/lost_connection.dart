import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LostConnectionPage extends StatefulWidget {
  const LostConnectionPage({required this.onResult, super.key});

  final void Function(bool) onResult;

  @override
  State<LostConnectionPage> createState() => _LostConnectionPageState();
}

class _LostConnectionPageState extends State<LostConnectionPage> {
  final networkLock = Lock();
  final loading = ValueNotifier(false);

  @override
  void dispose() {
    loading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.wifi_off,size: 150,),
                  26.verticalSpace,
                  const Text(
                    'No internet connection!',
                    style: AppTextConstants.style16W400,
                  ),
                ],
              ),
              25.verticalSpace,
              ValueListenableBuilder(
                valueListenable: loading,
                builder: (BuildContext context, bool value, Widget? child) {
                  return EcoElevatedButton.loading(
                    onPressed: retry.call,
                    loading: value,
                    maxHeight: 50.h,
                    child: Text('Try again',style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> retry() async {
    loading.value = true;
    await networkLock.synchronized(() async {
      if (!mounted) return;
      final value = await internetConnectionChecker.hasConnection;
      widget.onResult.call(value);
    });
    loading.value = false;
  }

  InternetConnectionChecker get internetConnectionChecker {
    return GetIt.I.get<InternetConnectionChecker>();
  }
}
