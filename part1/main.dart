import 'package:flutter/material.dart';
final Color mainColor = Color(0xFFFF5656);

final List<MountModel> mountItems = [
  MountModel(
      path:
          'https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg',
      name: 'Гора Семеру',
      description:
          'Семеру — действующий вулкан в Восточной Яве, Индонезия. Он расположен в зоне субдукции, где Индо-Австралийская плита погружается под Евразийскую. Это самая высокая гора на острове Ява.',
      location: 'Восточная Ява'),
  MountModel(
      path:
          'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg',
      name: 'Гора Мербабу',
      description:
          'Мербабу — спящий стратовулкан в провинции Центральная Ява на индонезийском острове Ява. Название «Мербабу» можно перевести как «Гора пепла» (от яванских слов «меру» — гора и «абу» — пепел).',
      location: 'Центральная Ява'),
  MountModel(
      path: 'https://cdn.dlmag.com/wp-content/uploads/2019/07/maunaloa1.jpg',
      name: 'Мауна-Лоа',
      description:
          'Мауна-Лоа — один из пяти вулканов, образующих остров Гавайи в США в Тихом океане. Крупнейший надводный вулкан как по массе, так и по объёму, исторически считается крупнейшим вулканом на Земле, уступая лишь массиву Таму.',
      location: 'Гавайи'),
  MountModel(
      path:
          'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg',
      name: 'Везувий',
      description:
          'Везувий — сомма-стратовулкан, расположенный на берегу Неаполитанского залива в Кампании, Италия, примерно в 9 км к востоку от Неаполя и недалеко от побережья. Это один из нескольких вулканов, образующих Кампанийскую вулканическую дугу.',
      location: 'Италия'),
  MountModel(
      path:
          'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg',
      name: 'Попокатепетль',
      description:
          'Попокатепетль — действующий стратовулкан, расположенный в штатах Пуэбла, Морелос и Мехико в центральной Мексике. Он находится в восточной части Трансмексиканского вулканического пояса. Высота 5426 м делает его второй по высоте вершиной Мексики после Ситлальтепетля (5636 м).',
      location: 'Мексика')
];

final List<CategoryModel> categories = [
  CategoryModel(category: 'Горы', icon: Icons.terrain),
  CategoryModel(category: 'Леса', icon: Icons.park),
  CategoryModel(category: 'Пляжи', icon: Icons.beach_access),
  CategoryModel(category: 'Походы', icon: Icons.directions_walk)
];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: SplashPage()
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Icon(
            Icons.terrain, 
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
          alignment: Alignment.bottomLeft,
          child: Icon(Icons.terrain, color: Colors.white, size: 80)
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListView()
          ),
          AppCategoryList(),
          AppBottomBar()
        ],
      )
    );
  }
}



//-----WIDGETS-----

class AppHeader extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/5081804?v=4',
              width: 50,
              height: 50,
              fit: BoxFit.cover
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text('Привет, Рамиль',
                style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold
                )
              ),
              Text('Как прошел день',
                style: TextStyle(
                  color: mainColor, 
                  fontSize: 12
                )
              )
            ]
          )
        ],
      )
    );
  }
}

class AppSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Поиск',
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: 25 
            )
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text('Искать', style: TextStyle(color: Colors.grey))
                    ]
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.tune, color: Colors.white)
              )
            ],
          )
        ],
      )
    );
  }
}


class AppMountListView extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index) {

          MountModel currentMount = mountItems[index];

          return Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(currentMount.path),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentMount.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(currentMount.location,
                   style: TextStyle(
                    color: Colors.white
                  )
                )
              ]
            )
          );
        }
      )
    );
  }
}


class AppCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Категории',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
                Text('Смотреть больше',
                  style: TextStyle(color: mainColor,fontSize: 12, fontWeight: FontWeight.bold
                  )
                ),
              ]
            )
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,

              itemBuilder: (context, index) {

                CategoryModel currentCategory = categories[index];

                return Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withValues(alpha: 0.2), width: 2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentCategory.icon, color: mainColor),
                      Text(currentCategory.category,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                    ]
                  )
                );
              }

            )
          ),
        ],
      )
    );
  }
}

class AppBottomBar extends StatefulWidget {
  @override
  AppBottomBarState createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {

  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, label: 'Главное меню', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Обзор', isSelected: false), // было Explore
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Метки', isSelected: false), // было Tag
    AppBottomBarItem(icon: Icons.person_outline, label: 'Профиль', isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset.zero
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: 
        List.generate(barItems.length, (index) {
            AppBottomBarItem currentBarItem = barItems[index];

            Widget barItemWidget;

            if (currentBarItem.isSelected) {
              barItemWidget = Container(
                padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor
                ),
                child: Row(
                  children: [
                    Icon(currentBarItem.icon, color: Colors.white),
                    SizedBox(width: 5),
                    Text(currentBarItem.label, style: TextStyle(color: Colors.white))
                  ]
                )
              );
            }
            else {
              barItemWidget = IconButton(
                icon: Icon(currentBarItem.icon, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    barItems.forEach((AppBottomBarItem item) {
                      item.isSelected = item == currentBarItem;
                    });
                  });
                }
              );
            }

            return barItemWidget;
          }
        )
      )
    );
  }
}



//----MODELS----

class MountModel {
  String path;
  String name;
  String location;
  String description;

  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = ''
  });
}

class CategoryModel {
  String category;
  IconData? icon;

  CategoryModel({this.category = '', this.icon});
}

class AppBottomBarItem {
  IconData? icon;
  bool isSelected; 
  String label;

  AppBottomBarItem({
    this.icon,
    this.label = '',
    this.isSelected = false
  });
}
