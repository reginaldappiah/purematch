import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:purematch/cubits/search/admin_search_bar_state.dart';

class AdminSearchBarCubit extends HydratedCubit<AdminSearchBarState> {
  AdminSearchBarCubit() : super(AdminSearchBarEmpty());

  void emitEmptyState() {
    emit(AdminSearchBarEmpty());
  }

  void emitUpdateState(TextEditingController value) {
    emit(AdminSearchBarUpdate(value));
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return json['adminSearchBarText'];
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return {'adminSearchBarText': state.controller.text};
  }
}
