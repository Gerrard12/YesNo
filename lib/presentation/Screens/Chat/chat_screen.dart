import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/Chat/Shared/message_field_box.dart';
import 'package:yes_no_app/presentation/widgets/Chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/Chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Comando para poder colocar un icono como el de un perfil
        //tmb se puede precisar los lados
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            //comando para color la imagen en la zona del icono
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/JenniferAniston08TIFF.jpg/200px-JenniferAniston08TIFF.jpg'),
          ),
            
        ),
        title: Text('Mi amor'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider> ();

    //se usa un wrap widget para la safe zona 
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message =chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message:message);
            },)

          ),
          //Caja de texto
          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          ),
        ],
        ),
      ),
    );
  }
}