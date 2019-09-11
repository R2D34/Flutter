import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../models/auth.dart';



class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _dataForm = {
    'emailValue': null,
    'passwordValue': null
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();

  AuthMode _authMode = AuthMode.Login;

  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage('assets/background1.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Emails is required.';
        }
      },
      onSaved: (String value) {
        _dataForm['emailValue'] = value;
      },
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: true,
      validator: (String value) {
        if (_passwordTextController.text != value) {
          return 'Password do not match';
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      controller: _passwordTextController,
      obscureText: true,
      onSaved: (String value) {
        _dataForm['passwordValue'] = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required.';
        }
      },
    );
  }

  SwitchListTile _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      print(_dataForm);
      Map<String, dynamic> successInformation;
        successInformation =
            await authenticate(_dataForm['emailValue'], _dataForm['passwordValue'], _authMode);
        if (!successInformation['success']) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('An error occured!'),
                  content: Text(successInformation['message']),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      }
    }
  

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    SizedBox(height: 10.0),
                    _authMode == AuthMode.Signup
                        ? _buildPasswordConfirmTextField()
                        : Container(),
                    _buildAcceptSwitch(),
                    SizedBox(height: 10.0),
                    FlatButton(
                      child: Text(
                          'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}'),
                      onPressed: () {
                        setState(() {
                          _authMode = _authMode == AuthMode.Login
                              ? AuthMode.Signup
                              : AuthMode.Login;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    ScopedModelDescendant<MainModel>(builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return model.isLoading
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Text(_authMode == AuthMode.Login
                                  ? 'LOGIN'
                                  : 'SIGN UP'),
                              onPressed: () =>
                                  _submitForm(model.authenticate),
                            );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
