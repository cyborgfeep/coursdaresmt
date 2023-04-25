import 'package:coursdaresmt/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            title: const Text("781234567",style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            centerTitle: true,
            leading: InkWell(
              onTap: (){

              },
              child: const Icon(Icons.menu_rounded,color: Colors.black,),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: (){

                  },
                  child: const Icon(Icons.qr_code,color: Colors.black,),
                ),
              ),
            ],
            backgroundColor: Colors.white,
            expandedHeight: 120,
            pinned: true,
            floating: true,
            elevation: 0,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 90),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("Que souhaitez-vous?"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: defaultColor,
            ),
          )
        ],
      ),
    );
  }
}
