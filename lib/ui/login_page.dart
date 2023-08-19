import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/ic_hey.png",
                  fit: BoxFit.fill,
                ),
                /*SizedBox(
                  height: 10.0,
                )*/
                20.heightBox,
                Text(
                  "Welcome $name",
                  style: TextStyle(
                      color: context.theme.colorScheme.primary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Enter User name",
                            labelText: "User name",
                            labelStyle: TextStyle(
                                color: context.theme.colorScheme.primary),
                            hintStyle: TextStyle(
                                color: context.theme.colorScheme.primary)),
                        style:
                            TextStyle(color: context.theme.colorScheme.primary),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      12.heightBox,
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Enter password",
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: context.theme.colorScheme.primary),
                            hintStyle: TextStyle(
                                color: context.theme.colorScheme.primary)),
                        style:
                            TextStyle(color: context.theme.colorScheme.primary),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 4) {
                            return "Password should be at least 4 characters.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      /*ElevatedButton(
                          style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                          onPressed: () {
                            // showToast("CLICKED !!");
                            Navigator.pushNamed(context, AppRoutes.homeRoute);
                          },
                          child: Text(
                            "LOGIN",
                          ))*/

                      Material(
                        color: Colors.purple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 40 : 8),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              onButtonTap(context);
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton == true ? 40 : 120,
                            height: 40,
                            alignment: Alignment.center,
                            /*decoration: BoxDecoration(
                                color: Colors.purple,
                                */ /*shape: changeButton?BoxShape.circle: BoxShape.rectangle*/ /*
                                borderRadius:
                                    BorderRadius.circular(changeButton ? 40 : 8)),*/
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //ignore:avoid_void_async
  void onButtonTap(BuildContext context) async {
    setState(() {
      changeButton = true;
    });

    final capturedContext = context;
    await Future.delayed(Duration(seconds: 1));
    if (!capturedContext.mounted) return;
    context.pushNamed(AppRoutes.homeRoute);
    // await Navigator.of(capturedContext).pushNamed(AppRoutes.homeRoute);

    setState(() {
      changeButton = false;
    });
  }
}
