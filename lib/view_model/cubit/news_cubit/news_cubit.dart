import 'package:cubit_data/model/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  TextEditingController searchController = TextEditingController(
    text: "flutter"
  );

  final dio = Dio();

  List<Article> news = [];

  void getNews() async {
    emit(GetNewsLoadingState());
    final response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'apiKey': '9f36529edcb444d38eba1d296f57e80f',
          'q': searchController.text,
        },
    );
    List responseArticles = response.data['articles'];
    news.clear();
    for(var i in responseArticles){
      news.add(Article.fromJson(i));
    }
    emit(GetNewsSuccessState());
  }
}
