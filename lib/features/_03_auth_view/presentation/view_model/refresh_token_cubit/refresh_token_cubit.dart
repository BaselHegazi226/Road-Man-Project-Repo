import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_state.dart';

import '../../../../../core/tokens_manager/tokens_manager.dart';
import '../../../data/repos/auth_repo.dart';

class RefreshTokenCubit extends Cubit<RefreshTokenStates> {
  final AuthRepo authRepo; // إضافة المتغير الخاص بالـ AuthRepo

  // Constructor with dependency injection
  RefreshTokenCubit({required this.authRepo}) : super(RefreshTokenInitial());

  // الدالة التي تقوم بتحديث التوكن
  Future<void> refreshTokenCubitFun() async {
    emit(RefreshTokenLoading()); // تغير الحالة إلى تحميل

    final userTokens = await SecureStorageHelper.getUserTokens();
    if (userTokens == null || userTokens.token.isEmpty) {
      emit(RefreshTokenFailure(errorMessage: 'No tokens found.'));
      return;
    }

    final result = await authRepo.refreshToken(
      accessToken: userTokens.token,
      refreshToken: userTokens.refreshToken,
    );

    result.fold(
      (failure) {
        emit(
          RefreshTokenFailure(
            errorMessage: failure.errorMessage ?? 'Bloc Error',
          ),
        ); // في حالة الفشل
      },
      (userToken) {
        emit(RefreshTokenSuccess(userToken: userToken)); // في حالة النجاح
      },
    );
  }
}
