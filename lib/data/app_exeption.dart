class AppExeption implements Exception{
  final _messege;
  final _prefix;

  AppExeption([this._messege,this._prefix]);

  String toString(){
    return '$_prefix$_messege';
  }

}

class FetchDataException extends AppExeption{
  FetchDataException([String? messege]): super(messege,"Error during communication");
}
class BadRequestException extends AppExeption{
  BadRequestException([String? messege]): super(messege,"Invalid Requestn");
}

class UnauthorizedException extends AppExeption{
  UnauthorizedException([String? messege]): super(messege,"Unauthorized request");
}
class InvalidInputException extends AppExeption{
  InvalidInputException([String? messege]): super(messege,"Invalid Input");
}
