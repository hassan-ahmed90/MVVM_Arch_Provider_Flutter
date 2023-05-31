import 'package:flutter/material.dart';
import 'package:untitled3/data/response/response_api.dart';
import 'package:untitled3/models/movie_model.dart';
import 'package:untitled3/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _myRepo =HomeRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();
  setMovielist(ApiResponse<MovieListModel> response){
    movieList=response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi()async{
     setMovielist(ApiResponse.loading());
    _myRepo.fetchMovieList().then((value) {
      setMovielist(ApiResponse.completed(value));

    }).onError((error, stackTrace) {

      setMovielist(ApiResponse.error(error.toString()));
    });
  }

}