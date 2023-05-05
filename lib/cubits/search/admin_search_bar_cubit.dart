import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:purematch/cubits/search/admin_search_bar_state.dart';

class AdminSearchBarCubit extends HydratedCubit<AdminSearchBarState> {
  AdminSearchBarCubit() : super(const AdminSearchBarEmpty());

  void emitEmptyState() {
    emit(const AdminSearchBarEmpty());
  }

  void emitUpdateState(String newValue) {
    emit(AdminSearchBarUpdate(newValue));
  }

  @override
  AdminSearchBarState fromJson(Map<String, dynamic> json) {
    return json['adminSearchBarText'];
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return {'adminSearchBarText': state.searchText};
  }
}
