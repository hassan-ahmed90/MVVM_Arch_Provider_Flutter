import 'package:untitled3/models/movie_model.dart';
import 'package:untitled3/res/app_Url.dart';

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchMovieList()async{
    try{
      dynamic response = await _apiServices.getGetApiServices(AppUrl.moviesListEndPoint);
      return response= MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}