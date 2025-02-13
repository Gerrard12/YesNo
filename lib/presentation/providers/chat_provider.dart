import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_asnwer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
// esto es un fix


//changenotifier se usa para cambiar los datos mediante una notificacion
class ChatProvider extends ChangeNotifier{

  final chatScrollController =ScrollController();
  final getYesNoAnswer = GetYesNoAsnwer;

  List<Message> messageList =[
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Yaa regresaste del trabajo?', fromWho: FromWho.me)
  ];

Future<void> sendMessage( String text ) async {
  if( text.isEmpty ) return;
  final newMessage = Message(text: text, fromWho: FromWho.me);
  messageList.add(newMessage);

  if( text.endsWith('?')){
    herReply();
  }
  notifyListeners();
  moveScrollToBottom();

}
Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
  notifyListeners();

  moveScrollToBottom();
}

  Future <void> moveScrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 100));
    chatScrollController.animateTo( 
    chatScrollController.position.maxScrollExtent,
    duration: Duration( milliseconds: 300),
    curve: Curves.easeOut);

  }

}

extension on Type {
  getAnswer() {}
}







