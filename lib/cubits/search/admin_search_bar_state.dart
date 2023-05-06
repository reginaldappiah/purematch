import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminSearchBarState extends Equatable {
  final TextEditingController controller;

  const AdminSearchBarState(this.controller);

  @override
  List<Object?> get props => [controller];
}

class AdminSearchBarEmpty extends AdminSearchBarState {
  AdminSearchBarEmpty() : super(TextEditingController(text: ''));
}

class AdminSearchBarUpdate extends AdminSearchBarState {
  const AdminSearchBarUpdate(super.controller);
}
