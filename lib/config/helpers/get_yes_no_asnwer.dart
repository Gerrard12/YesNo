import 'package:dio/dio.dart';
import 'package:yes_no_app/config/infraestructure/models/yes_mo_model.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAsnwer {
  final _dio = Dio();
  Future<Message>  getAnswer() async {
    
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap( response.data);

    return yesNoModel.toMessagentity();
  }
}