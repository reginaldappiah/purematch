import 'package:equatable/equatable.dart';

class AdminSearchBarState extends Equatable {
  final String searchText;

  const AdminSearchBarState(this.searchText);

  @override
  List<Object?> get props => [searchText];
}

class AdminSearchBarEmpty extends AdminSearchBarState {
  const AdminSearchBarEmpty() : super('');
}

class AdminSearchBarUpdate extends AdminSearchBarState {
  const AdminSearchBarUpdate(super.name);
}
