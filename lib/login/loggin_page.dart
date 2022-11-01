import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/base/base_page.dart';
import 'package:sl_ui_kit/router.dart';
import 'package:sl_ui_kit/view_model/login_view_model.dart';
import 'package:sl_ui_kit/view_model/user_view_model.dart';

import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  late LoginViewModel loginViewModel;
  late UserViewModel userViewModel;

  @override
  String initAppBarText() => "登录";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget initChild() {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      builder: (ctx, _) => buildChild(ctx),
    );
  }

  Container buildChild(BuildContext context) {
    loginViewModel = context.watch<LoginViewModel>();
    userViewModel = context.watch<UserViewModel>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autofocus: false,
                onSaved: (s) {
                  loginViewModel.savePhone(s!);
                },
                controller: TextEditingController(
                    text: context.watch<LoginViewModel>().userName ?? ""),
                decoration: InputDecoration(hintText: "账号"),
              ),
              SizedBox(
                height: 20.w,
              ),
              TextFormField(
                onSaved: (s) {
                  loginViewModel.savePwd(s!);
                },
                autofocus: false,
                obscureText: true,
                controller: TextEditingController(
                    text: context.watch<LoginViewModel>().pwd ?? ""),
                maxLength: 6,
                decoration: InputDecoration(hintText: "密码", counterText: ""),
              ),
              SizedBox(
                height: 40.w,
              ),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.grey,
                    context.read<LoginViewModel>().canLoginClick
                        ? BlendMode.dst
                        : BlendMode.srcIn),
                child: TextButton(
                  onPressed: () async {
                    if (loginViewModel.canLoginClick) {
                      formKey.currentState?.save();
                      String jsonData = await DefaultAssetBundle.of(context)
                          .loadString("assets/json/login.json");
                      String userJson = await DefaultAssetBundle.of(context)
                          .loadString("assets/json/user.json");
                      userViewModel.getUserData(userJson);
                      loginViewModel.login(jsonData).then((success) {
                        if (success) {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHomePage()));
                          this.context.go(StaticPath.home);
                        }
                      });
                    }
                  },
                  child: Text("登录"),
                ),
              )
            ],
          )),
    );
  }
}
