//
// Created by Muhammad Usman on 04/04/2023.
//usmanmushtaq848@gmail.com
//
import 'package:flutter/material.dart';
import 'package:network_client/get_it.dart';
import 'package:network_client/provider/auth_provider.dart';

import '../../constants/enums/network_status.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mProvider =locator<AuthProvider>();
  String? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed:() async{
            await mProvider.loginUserWithCredential();
            if(mProvider.login!.status == Status.COMPLETED){
           if(mProvider.login?.data?.code == 0){
              response = mProvider.login?.data.toString();
    }
    }


    }, child: const Text('Login')),
          Text(response.toString())

        ],
      ),

    );
  }
}
