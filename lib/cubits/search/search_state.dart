import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String searchText;

  const SearchState(this.searchText);

  @override
  List<Object?> get props => [searchText];
}

class SearchingState extends SearchState {
  const SearchingState(super.name);
}
