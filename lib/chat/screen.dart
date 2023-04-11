import 'package:flutter/material.dart';
import 'package:projects/chat/response.dart';
import 'package:projects/chat/service.dart';
import 'package:projects/helper/auth_helper.dart';
import 'package:signalr_netcore/signalr_client.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.userName, required this.email, required this.phoneNumber}) : super(key: key);

  final String userName;
  final String email;
  final String phoneNumber;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final serverUrl = "https://10.0.2.2:7208/messagehub";

  late HubConnection _hubConnection;

  final List<Widget> widgets = [];

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSignalR();
  }

  Future<void> initSignalR() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl, options: HttpConnectionOptions(accessTokenFactory: () => AuthHelper.GetAccessToken()))
        .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000]).build();

    await _hubConnection.start();
    print(_hubConnection.state);

    _hubConnection.onclose(({error}) {
      print("Socket connection closed.");
    });

    _hubConnection.on("ReceiveMessage", (arguments) {
      for (var arg in arguments!) {
        setState(() {
          widgets.add(Text(arg.toString(), textAlign: TextAlign.left));
        });
      }
    });
  }

  @override
  void dispose() {
    _hubConnection.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FutureBuilder<GetMessagesResponse>(
                future: ChatService.GetMessages(widget.userName),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    for (Data data in (snapshot.data?.data as List<Data>)) {
                      if (data.receiverId == widget.userName) {
                        widgets.add(Text(
                          data.text.toString(),
                          textAlign: TextAlign.right,
                        ));
                      } else {
                        widgets.add(Text(
                          data.text.toString(),
                          textAlign: TextAlign.left,
                        ));
                      }
                    }
                    return ListView(
                      shrinkWrap: true,
                      reverse: false,
                      children: widgets,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      semanticsLabel: 'Mesajlar yükleniyor...',
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: messageController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mesaj',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FloatingActionButton(
                        child: const Icon(Icons.send),
                        onPressed: () async {
                          if (_hubConnection.state == HubConnectionState.Connected) {
                            await _hubConnection.invoke(
                              "SendMessage",
                              args: <Object>[
                                {"ReceiverId": widget.userName, "Text": messageController.text}
                              ],
                            );
                            setState(() {
                              messageController.text = "";
                              widgets.add(Text(messageController.text, textAlign: TextAlign.left));
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
