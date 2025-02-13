
enum FromWho { me, hers }

class Message {
  late final String text;
  late final String? imageUrl;
  late final FromWho fromWho;



  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,

  });
}