import 'dart:async';

import 'package:altica_app/entities/login_status.dart';
import 'package:altica_app/entities/server_status.dart';
import 'package:altica_app/entities/user_credentials.dart';
import 'package:altica_app/usecase/login_use_case.dart';
import 'package:altica_app/usecase/server_status_use_case.dart';
import 'package:flutter/foundation.dart';

final loginBloc = LoginBloc();

class LoginBloc {
  String logo_altica = 'logo_altica.png';

  StreamController _loginStatusStreamColler = StreamController<LoginStatus>();
  StreamController _serverStatusStreamController =
      StreamController<ServerStatus>();

  Stream<LoginStatus> get loginStatusStream => _loginStatusStreamColler.stream;

  Stream<ServerStatus> get serverStatusStream =>
      _serverStatusStreamController.stream;

  LoginUseCase _loginUseCase = LoginUseCase();
  ServerStatusUseCase _serverStatusUseCase = ServerStatusUseCase();

  init() {
    getServerStatus();
  }

  Future<LoginStatus> connectUser(String name, String password) async {
    var credentials = UserCredentials(name, password);
    compute(isolatedUserConnection, credentials);
  }

  void getServerStatus() async {
    compute(isolatedServerStatus(), null);
  }

  // Isolated Functions //
  isolatedUserConnection(UserCredentials credentials) async {
    var connectionStatus = await _loginUseCase.connectUser();
    _serverStatusStreamController.sink.add(connectionStatus);
  }

  isolatedServerStatus() async {
    var serverStatus = await _serverStatusUseCase.getStatus();
    _serverStatusStreamController.sink.add(serverStatus);
  }

  //  Lifecycle //
  @override
  dispose() {
    _loginStatusStreamColler.close();
    _serverStatusStreamController.close();
  }
}