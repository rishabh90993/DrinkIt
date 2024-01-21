import 'package:flutter/cupertino.dart';

class LoginEvents {}

class GoogleLoginEvent extends LoginEvents {
  BuildContext context;
  GoogleLoginEvent(this.context);
}

