import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget{

  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab>{

  var username = "Pedro Massango";
  var email = "pedro.dev@gmail.com";

  @override
  Widget build(BuildContext buildContext){
    return Container(
      margin: EdgeInsets.only( top: 20.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top: MediaQuery
                .of(context)
                .padding
                .top + 34.0,
            child: Column(
              children: <Widget>[
               Container(
                 padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 16.0),
                 color: Colors.red,
                 child:  Row(
                   children: <Widget>[
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(username,
                           style: TextStyle(
                               fontSize: 18.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         Text(email,
                           style: TextStyle(
                               fontSize: 14.0,
                               color: Colors.white
                           ),
                         )
                       ],
                     ),
                     Spacer(),
                     Icon(Icons.account_circle,
                       size: 50.0,
                       color: Colors.white,
                     )
                   ],
                 ),
               ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Detalhes Pessoais',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          )

        ],
      )
    );
  }
}