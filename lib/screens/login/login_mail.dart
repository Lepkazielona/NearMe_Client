import 'package:flutter/material.dart';

class LoginMailScreen extends StatefulWidget {
  const LoginMailScreen({super.key, bool register = false});

  @override
  State<LoginMailScreen> createState() => _LoginMailScreenState();
}

class _LoginMailScreenState extends State<LoginMailScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Form(
          key: _formKey,
          child: IntrinsicWidth(
              child: SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Visibility(
                                visible: true,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      icon: const Icon(Icons.person),
                                      labelText: 'Username',
                                      filled: true,
                                      fillColor: Colors.white54,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelStyle:
                                          const TextStyle(color: Colors.white)),
                                  obscureText: true,
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                    print("USERNAME SAVED");
                                    print("USERNAME SAVED");
                                    print("USERNAME SAVED");
                                    print("USERNAME SAVED");
                                    print("USERNAME SAVED");
                                  },
                                  validator: (String? value) {
                                    return (value != null &&
                                            value.contains('@'))
                                        ? 'Do not use the @ char.'
                                        : null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.mail),
                                    labelText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white54,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    labelStyle: TextStyle(color: Colors.white)),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.password),
                                    labelText: 'Password',
                                    filled: true,
                                    fillColor: Colors.white54,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    labelStyle:
                                        const TextStyle(color: Colors.white)),
                                obscureText: true,
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Visibility(
                              visible: true,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.password),
                                    labelText: 'Repeat Password',
                                    filled: true,
                                    fillColor: Colors.white54,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2)),
                                    labelStyle:
                                        const TextStyle(color: Colors.white)),
                                obscureText: true,
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_formKey.currentState!.save()},
                          print("emaillogin")
                        },
                        icon: Icon(Icons.login),
                        label: Text("Log In"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                      ),
                    ],
                  ))),
        )));
  }
}
