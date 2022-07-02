
import 'package:arcore_flutter_plugin_example/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:arcore_flutter_plugin_example/widgets/text_form_field_widget/model/text_form_field_model.dart';
import 'package:arcore_flutter_plugin_example/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName='/loginScreen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius:BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                  child: Column(
                    children: [
                     TextFormFieldWidget(textFormFieldModel: TextFormFieldModel(
                       labelText: 'Email',
                       backgroundColor: Colors.white,
                       borderRadius:BorderRadius.circular(25)
                     )),
                      SizedBox(height: 20,),
                      TextFormFieldWidget(textFormFieldModel: TextFormFieldModel(
                          labelText: 'Password',
                          backgroundColor: Colors.white,
                          borderRadius:BorderRadius.circular(25)
                      )),
                    ],
                  ),
                ),
              ),
              AnimatedButtonWidget(onPressed: (){}, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
