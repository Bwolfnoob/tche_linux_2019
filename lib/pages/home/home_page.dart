import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tche_linux_caxias_do_sul/pages/model/palestra.dart';
import 'package:tche_linux_caxias_do_sul/service/palestras_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PalestraService service;
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    service = PalestraService();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Tchelinux 2019")),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(
                text: "Sala 1",
              ),
              Tab(
                text: "Sala 2",
              ),
              Tab(
                text: "Sala 3",
              ),
            ],
          ),
        ),
        body: StreamBuilder<List<Palestra>>(
          stream: service.palestras,
          builder: (context, snapshot) {
            if (snapshot == null || snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return TabBarView(
              children: [
                Container(
                  child: PalestrasWidget(
                      palestrasSala: snapshot.data
                          .where((palestra) => palestra.sala == "1")
                          .toList()),
                ),
                Container(
                  child: PalestrasWidget(
                      palestrasSala: snapshot.data
                          .where((palestra) => palestra.sala == "2")
                          .toList()),
                ),
                Container(
                  child: PalestrasWidget(
                      palestrasSala: snapshot.data
                          .where((palestra) => palestra.sala == "3")
                          .toList()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PalestrasWidget extends StatelessWidget {
  const PalestrasWidget({
    Key key,
    @required this.palestrasSala,
  }) : super(key: key);

  final List<Palestra> palestrasSala;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: palestrasSala.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Navigator.of(context)
            //     .push(CupertinoPageRoute(builder: (BuildContext context) {,}));
          },
          child: ListTile(
            leading: new Material(
              color: Colors.transparent,
              child: Text(
                palestrasSala[index].hora,
              ),
            ),
            title: Text(palestrasSala[index].titulo),
            subtitle: Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 230,
                    ),
                    child: Text(
                      palestrasSala[index].palestrante,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  NivelWidget(palestrasSala[index].nivel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NivelWidget extends StatelessWidget {
  final String nivel;

  const NivelWidget(
    this.nivel, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (nivel == "0" || nivel == "3") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: Color(0xff5bc0de),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "Todo o público",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (nivel == "1") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: Color(0xff5cb85c),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "Principiante",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (nivel == "2") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: Color(0xfff0ad4e),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "Intermediário",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}
