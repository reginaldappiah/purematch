import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:purematch/cubits/search/search_state.dart';

class SearchCubit extends HydratedCubit<SearchState> {
  SearchCubit() : super(SearchState(''));

  @override
  SearchState fromJson(Map<String, dynamic> json) {
    return json['searchText'];
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return {'searchText': state.searchText};
  }
}
