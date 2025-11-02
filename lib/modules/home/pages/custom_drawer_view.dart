import 'package:flutter/material.dart';

class CustomDrawerView extends StatelessWidget {
  final Function() onTap;
  const CustomDrawerView({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.22,
            width: double.infinity,
            color: Colors.white,
            child: Text("News App",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),)
          ),
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                spacing: 10,
                children: [
                Icon(Icons.home_max,color: Colors.white,size: 40,),
                Text("Go To Home",style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),)

                ],
              ),
            ),
          ),
          Divider(color: Colors.white,thickness: 2,endIndent: 15,indent: 15)
        ],
      ),
    );
  }
}
