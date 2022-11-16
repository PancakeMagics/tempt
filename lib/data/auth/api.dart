library auth;

import 'dart:async';
import 'dart:developer';
import 'dart:io' show Platform;
// import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:phone_number/phone_number.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:github/github.dart';
import 'package:tempt/bloc/_error_exception.dart';
import 'package:tempt/bloc/extension_iterable.dart';
import 'package:tempt/bloc/stream/stream_where.dart';
import 'package:tempt/data//README.dart' show Service;
import 'package:tempt/data/firebase_options.dart';
import 'package:tempt/data/store/api.dart' show Json;

part 'service/service.dart';
part 'model/auth_credential.dart';
part 'model/auth_provider.dart';
part 'model/auth_user.dart';
part 'model/idp/_phone.dart';
part 'model/idp/apple.dart';
part 'model/idp/facebook.dart';
part 'model/idp/github.dart';
part 'model/idp/google.dart';
part 'model/idp/microsoft.dart';
part 'model/idp/twitter.dart';
part 'model/idp/yahoo.dart';

part 'service/fireauth/fireauth.dart';
part 'service/fireauth/fireauth_login.dart';
part 'service/fireauth/fireauth_logined.dart';
part 'service/fireauth/fireauth_stream.dart';
part 'service/fireauth/extension/_fuc_from_fap.dart';
part 'service/fireauth/_email_action.dart';
part 'service/fireauth/extension/_fuc_from_fac.dart';
part 'service/fireauth/extension/login.dart';
part 'service/fireauth/extension/login_exception.dart';
part 'service/simpleauth/simpleauth.dart';
