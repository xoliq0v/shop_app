import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(
      this.fetchBanner
      ):super(const BannerState()){
    _fetch();
  }

  final FetchBanner fetchBanner;


  Future<void> _fetch()async{

    final res = await fetchBanner.fetch(
        state.next ?? 'https://sale.newagroinvitro.uz/api/v1/banners/'
    );

    if(res.status == Status.completed){
      emit(
        state.copyWith(
            banners: res.data?.result ?? [],
            isLoading: false,
            isLoadingPagination: false,
            next: res.data?.pagination.next, // Update the next page URL
            error: null, // Clear any previous errors
            errorPagination: null
        )
      );
    }else if(res.status == Status.error){
      emit(state.copyWith(
          isLoadingPagination: false,
          errorPagination: res.error?.message ?? ''
      ));
    }else{
      emit(state.copyWith(
          isLoading: false,
          error: res.error?.message ?? ''
      ));
    }

  }

}