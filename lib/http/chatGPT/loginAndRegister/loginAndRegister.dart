import 'dart:convert';

import 'package:butun_http_ornekleri/http/chatGPT/loginAndRegister/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAndResgisterGPT extends StatefulWidget {
  const LoginAndResgisterGPT({Key? key}) : super(key: key);

  @override
  State<LoginAndResgisterGPT> createState() => _LoginAndResgisterGPTState();
}

class _LoginAndResgisterGPTState extends State<LoginAndResgisterGPT> with Auth {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _username = '';
  String _password = '';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _isLoading
      ? Center(child: CircularProgressIndicator())
      : Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _username = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            Auth.login(
                                emailController.text, passwordController.text);
                          },
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('Submit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('Submit validateden'),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitWithCont,
                  child: Text('Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final url = 'https://your-domain.com/api/login';

      try {
        final response = await http.post(Uri.parse(url), body: {
          'email': _username,
          'password': _password,
        });
        final responseData = json.decode(response.body);
        if (responseData['success'] == true) {
          final token = responseData['token'];
          await Auth.saveToken(token);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _submitWithCont() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final token = await Auth.login(
          emailController.text,
          passwordController.text,
        );
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
            actions: [
              Text("Giriş yapılamadı tekrar deneyin"),
            ],
          ),
        );
      }
    }
  }
}
