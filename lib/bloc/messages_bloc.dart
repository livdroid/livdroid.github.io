import 'package:altica_app/entities/message_model.dart';

final messageBloc = MessagesBloc();

class MessagesBloc {

  final List<MessageModel> dummyData = [
    MessageModel(
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    MessageModel(
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    MessageModel(
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    MessageModel(
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    MessageModel(
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
    ),
    MessageModel(
      name: "Williams",
      datetime: "08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
    ),
    MessageModel(
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    MessageModel(
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    MessageModel(
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    MessageModel(
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    MessageModel(
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
    )
  ];

  final List<MessageModel> dummyDataConv = [
    MessageModel(
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    MessageModel(
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    MessageModel(
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    MessageModel(
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    MessageModel(
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
    ),
    MessageModel(
      name: "Williams",
      datetime: "08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
    ),
    MessageModel(
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    MessageModel(
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    MessageModel(
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    MessageModel(
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    MessageModel(
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
    )
  ];

  void disconnectUser() {}

  MessageModel getSelectedConversation(int index) {
    return dummyDataConv[index];
  }

}
