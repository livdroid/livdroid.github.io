import 'package:altica_app/bloc/messages_bloc.dart';
import 'package:altica_app/entities/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  var selectedMessageIndex = 0;
  MessageModel selectedMessage = messageBloc.getSelectedConversation(0);

  void selectNewMessage(int index) {
    setState(() {
      selectedMessageIndex = index;
      selectedMessage = messageBloc.getSelectedConversation(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'Déconnexion',
            icon: Icon(Icons.cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        title: Text(
          'Messages',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Card(
        color: Colors.white70,
        child: Row(children: <Widget>[allMessages(), messageDetail()]),
      ),
    );
  }

  Widget messageDetail() {
    return Flexible(
        flex: 2,
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(selectedMessage.name),
                          ),
                          Container(
                            child: Text(selectedMessage.datetime),
                          ),
                          Container(
                            child: Text(selectedMessage.message),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget allMessages() {
    return Container(
      child: Flexible(
        flex: 1,
        child: Card(
            elevation: 20,
            child: Container(
              color: Colors.black12,
              child: ListView.builder(
                  itemCount: messageBloc.dummyData.length,
                  itemBuilder: (context, index) {
                    MessageModel _model = messageBloc.dummyData[index];
                    if (selectedMessageIndex == index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1),
                        color: Colors.lightBlue,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                _model.name,
                                style: TextStyle(color: Colors.black87),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                _model.message,
                                style: TextStyle(color: Colors.black87),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 1),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              _model.name,
                              style: TextStyle(color: Colors.black87),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              _model.message,
                              style: TextStyle(color: Colors.black87),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            onTap: () {
                              selectNewMessage(index);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
