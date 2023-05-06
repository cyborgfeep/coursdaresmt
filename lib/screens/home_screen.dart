import 'package:coursdaresmt/models/option.dart';
import 'package:coursdaresmt/models/pub.dart';
import 'package:coursdaresmt/screens/camera_screen.dart';
import 'package:coursdaresmt/utils/constants.dart';
import 'package:coursdaresmt/widgets/carousel/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  final drawerKey=GlobalKey<ScaffoldState>();
  bool isExpanded = true;
  bool isSoldeVisible = true;
  List<Pub> pubList = [
    Pub(img: "${imgUri}fun.jpg", title: "Mobile"),
    Pub(img: "${imgUri}ob1.jpg", title: "Promo"),
    Pub(img: "${imgUri}ob2.jpg", title: "Promo")
  ];

  List<Option> optionList = [
    Option(img: "${imgUri}buy.jpg", title: "Acheter", desc: "Crédit,pass"),
    Option(
        img: "${imgUri}transfer.jpg",
        title: "Transférer",
        desc: "Argent,crédit"),
    Option(img: "${imgUri}pay.jpg", title: "Payer", desc: "Ma facture"),
    Option(img: "${imgUri}fun.jpg", title: "Gérer", desc: "Fibre,Adsl,Box"),
    Option(img: "${imgUri}sos.jpg", title: "Demander", desc: "un SOS"),
    Option(img: "${imgUri}fun.jpg", title: "Se divertir", desc: ""),
  ];

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        if (controller.hasClients &&
            controller.offset < (120 - kToolbarHeight)) {
          isExpanded = true;
        } else {
          isExpanded = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      key: drawerKey,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 16,right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      drawerKey.currentState!.closeDrawer();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(Icons.clear),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.withOpacity(.05),
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              title: const Text(
                "781234567",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  drawerKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
              ),
              actions: [
                isExpanded
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CameraScreen();
                      },));
                    },
                    child: const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              expandedHeight: 120,
              pinned: true,
              floating: true,
              elevation: 0,
              flexibleSpace: Container(
                margin: const EdgeInsets.only(top: 90),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    isExpanded
                        ? const Icon(Icons.search)
                        : const SizedBox.shrink(),
                    const Text("Que souhaitez-vous?"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 110,
                color: Colors.grey.shade200,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pubList.length,
                  itemBuilder: (context, index) {
                    Pub p = pubList[index];
                    return pubWidget(p);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Suivi conso",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Voir détails",
                            style: TextStyle(
                                color: defaultColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          consoWidget(
                              defaultColor,
                              "Orange Money",
                              "1000 Fcfa",
                              "Voir détails",
                              CupertinoIcons.arrow_right_arrow_left,
                              isOM: true),
                          consoWidget(
                              Colors.indigo,
                              "Crédit Global",
                              "1000 Fcfa",
                              "Valable jusqu'au 13/04/2024",
                              CupertinoIcons.phone_fill),
                          consoWidget(
                              Colors.green,
                              "Points Sargal",
                              "500 Pts",
                              "Mis à jour le 29/04/2023",
                              CupertinoIcons.gift_fill),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  Option o = optionList[index];
                  return optionWidget(o);
                }, childCount: optionList.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3)),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    dotColor: Colors.black,
                    dotSize: 5,
                    dotSpacing: 16.0,
                    dotPosition: DotPosition.bottomLeft,
                    dotIncreasedColor: Colors.white,
                    dotBgColor: Colors.transparent,
                    showIndicator: true,
                    overlayShadow: false,
                    overlayShadowColors: Colors.white.withOpacity(0.2),
                    overlayShadowSize: 0.9,
                    images: const [
                      NetworkImage(
                          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                      NetworkImage(
                          "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80"),
                      NetworkImage(
                          "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80"),
                      NetworkImage(
                          "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80"),
                    ],
                    onImageChange: (img, s) {},
                    onImageTap: (img) {},
                    radius: const Radius.circular(1.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pubWidget(Pub pub) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(color: defaultColor)),
            child: Image.asset(
              pub.img!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(pub.title!)
        ],
      ),
    );
  }

  Widget consoWidget(
      Color bg, String title, String value, String desc, IconData icon,
      {bool? isOM}) {
    bool isOMs = isOM ?? false;
    return InkWell(
      onTap: () {
        if (isOMs) {
          setState(() {
            isSoldeVisible = !isSoldeVisible;
          });
        }
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              bg.withOpacity(.9),
              bg.withOpacity(.7),
              bg.withOpacity(.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                isOMs
                    ? Text(isSoldeVisible ? value : "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))
                    : Text(value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                isOMs
                    ? Row(
                        children: [
                          isSoldeVisible
                              ? Text(desc,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                              : const Text("Voir Mon Solde",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      )
                    : Text(desc,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
              ],
            ),
            isOMs
                ? isSoldeVisible
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.5),
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.visibility_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    : Icon(
                        icon,
                        color: Colors.white.withOpacity(.6),
                        size: 50,
                      )
                : Icon(
                    icon,
                    color: Colors.white.withOpacity(.6),
                    size: 50,
                  )
          ],
        ),
      ),
    );
  }

  Widget optionWidget(Option o) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            o.img!,
            width: 50,
            height: 50,
          ),
          Text(o.title!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(o.desc!,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
