import 'package:flutter/material.dart';
final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MountsApp() //SplashPage()
    )
  );
}
class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MountsApp()));
    });

    return Container(
      color: mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white, size: 90),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white)
              )
            )
          )
        ],
      )
    );
  }
}

class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors. white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors. transparent,
        title: Center(
          child: Icon(
            Icons. terrain,
            color: mainColor,
            size: 40
          )
        ), 
        actions: [
          SizedBox(width: 40, height: 40)
        ],
        iconTheme: IconThemeData(color: mainColor)
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment. bottomLeft,
          child: Icon(Icons. terrain, color: Colors. white, size: 80)
        )
      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment. start,
        children: [
          AppHeader()
        ]
      )
    ); 
  }
}


//-----WIDGETS-----


class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets. only(left: 30, top: 30, right: 30),
      child: Row(
        children:[
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/5081804?v=4', 
              width: 50,
              height: 50,
              fit: BoxFit.cover
            ),
          ),  
          SizedBox(width: 20),
          Column (
            crossAxisAlignment: CrossAxisAlignment. start,
            children: [
              Text('Привет, Рамиль',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold)    
              ),
              Text('Все ли хорошо?',
                style: TextStyle(
                  color: mainColor, 
                  fontSize: 12)    
              )
            ]
          ) 
        ]
      )
    );
  }
}
