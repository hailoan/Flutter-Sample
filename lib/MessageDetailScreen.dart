import 'dart:math';

import 'package:fluter_sample_test/main.dart';
import 'package:fluter_sample_test/profile.dart';
import 'package:flutter/material.dart';

import 'AvatarView.dart';

class MessageDetailScreen extends StatelessWidget {
  const MessageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo IO'), actions: <Widget>[
        TextButton(
          onPressed: () {
            _navigateToProfile(context);
          },
          child: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
      body: MessageDetail(),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.pushNamed(context, routeProfile,
        arguments: ProfileArgument('title', 'message'));
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ProfileScreen()),
    // );
  }
}

class DemoGridView extends StatelessWidget {
  final items = List.generate(100, (index) => 'item$index');

  DemoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: items
          .map((e) => Center(
                child: Text(
                  e,
                ),
              ))
          .toList(),
    );
  }
}

// ignore: must_be_immutable
class MessageDetail extends StatelessWidget {
  List<Message> messageList = [];
  final Author author = Author(0, 'Nguyen Thi Hai Loan',
      'https://cache.giaohangtietkiem.vn/d/752361f052f74dcd80fa7fdce89b603a.png?width=130');

  MessageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    generateDataMesssage();
    return SingleChildScrollView(
      child: Column(
        children: [_buildMessageList(), _buildInputMessage()],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListMessage(messageList, author);
  }

  Widget _buildInputMessage() {
    return InputMessage();
  }

  void generateDataMesssage() {
    final Author receiver = Author(1, 'Truong Thi Hong Nhung',
        'https://cache.giaohangtietkiem.vn/d/7a7242670e4249c9a54d42b9b390fb05.png?width=88');
    for (int i = 0; i < 100; i++) {
      if (Random().nextBool()) {
        messageList
            .add(Message(author, 'hello', null, DateTime.now().microsecond));
      } else {
        messageList
            .add(Message(receiver, 'hi, hi', null, DateTime.now().microsecond));
      }
    }
  }
}

// ignore: must_be_immutable
class ListMessage extends StatelessWidget {
  ListMessage(this.messageList, this.author, {super.key});
  List<Message> messageList;
  Author? author;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var item = messageList[index];
          return _buildContentMessage(item);
        },
        itemCount: messageList.length,
      ),
    );
  }

  Widget _buildMessage(Message msg) {
    return _buildContentMessage(msg);
  }

  Widget _buildContentMessage(Message msg) {
    List<Widget> widgets = [];
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
    MainAxisAlignment mainAxisAlignment;

    if (msg.isSender(author?.id)) {
      var user = msg.author;
      widgets.add(AvatarOnline(
        name: user?.fullname,
        avatar: user?.avatar,
        size: 30.0,
      ));
      mainAxisAlignment = MainAxisAlignment.start;
      widgets.add(const SizedBox(
        width: 10.0,
      ));
    } else {
      mainAxisAlignment = MainAxisAlignment.end;
    }

    widgets.add(_buildContextText(
        msg.content, msg.isSender(author?.id) ? Colors.green : Colors.blue));

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: widgets,
    );
  }

  Widget _buildContextText(String? text, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Text(
          text ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class InputMessage extends StatelessWidget {
  InputMessage({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 160.0, left: 8.0, right: 8.0, top: 8.0),
        child: _buildEditText(),
      ),
    );
  }

  Widget _buildEditText() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration.collapsed(hintText: 'Input message'),
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
    );
  }
}

class Message {
  Author? author;
  String? content;
  List<Attachment>? attachmentList;
  int time = 0;
  Message(this.author, this.content, this.attachmentList, this.time);

  bool isSender(int? id) {
    return id == author?.id;
  }
}

class Attachment {
  String? url;
  String? name;
  String? id;
  Attachment(this.id, this.url, this.name);
}

class Author {
  int id = 0;
  String? fullname;
  String? avatar;
  Author(this.id, this.fullname, this.avatar);
}
