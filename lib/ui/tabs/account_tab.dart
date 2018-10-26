import 'package:flutter/material.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class AccountTab extends StatefulWidget{

  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> with TickerProviderStateMixin {

  var username = "Pedro Massango";
  var email = "pedro.dev@gmail.com";
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext){
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: double.infinity,
        height: screenHeight / 1.7,
        margin: EdgeInsets.only(right: 16.0, left: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0),
                blurRadius: 5.0,
              ),
            ]
        ),
        child: Column(
          children: <Widget>[
            UserProfileImage(),
            TabBar(
              controller: _tabController,
              indicatorWeight: 3.0,
              isScrollable: true,
              labelColor: Colors.black87,
              tabs: <Widget>[
                Tab(child: Text('Detalhes', style: RapidinhoTextStyle.normalText)),
                Tab(child: Text('Definicoes', style: RapidinhoTextStyle.normalText)),
                Tab(child: Text('Outros', style: RapidinhoTextStyle.normalText)),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              constraints: BoxConstraints.tight(Size(double.infinity, 150.0)),
              child: PageView(
                onPageChanged: (i)=> _tabController.animateTo(i),
                children: [
                  UserDetails(),
                  UserSettings(),
                  UserMoreDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage('assets/images/henrick.jpg'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('Henrick Kakutalwa', style: RapidinhoTextStyle.mediumText.copyWith(fontWeight: FontWeight.w600)),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.phone, size: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('+244 999 999 999', style: RapidinhoTextStyle.smallText),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return                   Column(
      children: [
        Row(
          children: <Widget>[
            Icon(Icons.location_on, size: 18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('Localizacao', style: RapidinhoTextStyle.normalText),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.credit_card, size: 18.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Pagamento', style: RapidinhoTextStyle.normalText),
            ),
          ],
        ),
      ],
    );
  }
}

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserMoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

