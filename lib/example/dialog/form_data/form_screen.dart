import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String address = '';
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            renderTextFormField(
              label: '이름',
              onSaved: (val) {},
              validator: (val) {
                if(val == null) {
                  return '이름은 필수사항입니다.';
                }

                if(val.length < 2) {
                  return '이름은 두글자 이상 입력 해주셔야합니다.';
                }

                return null;
              },
            ),
            renderTextFormField(
              label: '이메일',
              onSaved: (val) {
              },
              validator: (val) {
                if(val.length < 1) {
                  return '이메일은 필수사항입니다.';
                }

                if(!RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(val)){
                  return '잘못된 이메일 형식입니다.';
                }

                return null;
              },
            ),
            renderTextFormField(
              label: '비밀번호',
              onSaved: (val) {},
              validator: (val) {
                if(val.length < 1) {
                  return '비밀번호는 필수사항입니다.';
                }

                if(val.length < 8){
                  return '8자 이상 입력해주세요!';
                }
                return null;
              },
            ),
            renderTextFormField(
              label: '주소',
              onSaved: (val) {},
              validator: (val) {
                if(val.length < 1) {
                  return '주소는 필수사항입니다.';
                }
                return null;
              },
            ),
            renderTextFormField(
              label: '닉네임',
              onSaved: (val) {},
              validator: (val) {
                if(val.length < 1) {
                  return '닉네임은 필수사항입니다.';
                }
                if(val.length < 8) {
                  return '닉네임은 8자 이상 입력해주세요!';
                }
                return null;
              },
            ),
            
            renderButton(),
          ],
        ),
      ),
    );
  }

   renderValues(){
    return Column(
      children: [
        Text(
          'name: $name'
        ),
        Text(
          'email: $email'
        ),
        Text(
          'password: $password',
        ),
        Text(
          'address: $address',
        ),
        Text(
          'nickname: $nickname',
        ),
      ],
    );
  }

  renderButton() {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          // validation 이 성공하면 true 가 리턴돼요!
          
          // validation 이 성공하면 폼 저장하기
          formKey.currentState!.save();
          
          print("저장 성공~!!!!!!");
        }
      },
      child: Text(
        '저장하기!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
        ),
        Container(height: 16.0),
      ],
    );
  }
}