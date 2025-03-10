class PaginationModel {
  int? page = 1;
  bool? hasNext = true, hasPrevious = false;
  List? previousData = [], currentData = [], nextData = [];
  PaginationModel(
      {this.page = 1,
      this.hasPrevious = false,
      this.hasNext = true,
      this.previousData = const [],
      this.currentData = const [],
      this.nextData = const []});
}
