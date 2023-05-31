import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/utils/utils.dart';
import 'package:untitled3/view/user_view_model.dart';
import 'package:untitled3/view_model/home_view_model.dart';

import '../data/response/status.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel   homeViewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMovieListApi();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                userPrefernece.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text('Logout'))),
          SizedBox(width: 20,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
            builder: (context, value, _){
              switch(value.movieList.status){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(child: Text(value.movieList.messege.toString()));
                case Status.COMPLETED:
                default:
                print('It is Null');
              return ListView.builder(
                      itemCount: value.movieList.data!.movies!.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: ListTile(

                            leading: Image.network(

                              value.movieList.data!.movies![index].posterurl.toString(),
                              errorBuilder: (context, error, stack){
                                return Icon(Icons.error, color: Colors.red,);
                              },
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            title: Text(value.movieList.data!.movies![index].title.toString()),
                            subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1)),
                                Icon(Icons.star , color: Colors.yellow,)
                              ],
                            ),
                          ),
                        );
                      });

              }
              return Container();
            }),
      ) ,
    );
  }
}