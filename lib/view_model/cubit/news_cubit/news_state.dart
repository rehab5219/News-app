sealed class NewsState {}

final class NewsInitialState extends NewsState {}

final class GetNewsLoadingState extends NewsState {}

final class GetNewsSuccessState extends NewsState {}
