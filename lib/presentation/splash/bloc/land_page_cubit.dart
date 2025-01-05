import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/presentation/intro/pages/get_started.dart';

class LandPageCubit extends HydratedCubit<String> {
  LandPageCubit() : super(GetStartedPage.route);

  void updateLandPage(String route) => emit(route);

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['LandPage'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'LandPage': state};
  }
}
