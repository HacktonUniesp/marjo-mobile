import 'package:flutter/material.dart';
import 'package:marjosports/src/layers/home/entities/user_entity.dart';
import 'package:marjosports/src/theme/theme_app.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final List<UserEntity> donations = [
    UserEntity(name: 'João Silva', appname: 'App1', donation: 'R\$ 12,00'),
    UserEntity(name: '  Silva', appname: 'App2', donation: 'R\$ 12,00'),
    UserEntity(name: 'eu Silva', appname: 'App4', donation: 'R\$ 122,00'),
  ];

  List<UserEntity> filteredDonations = [];

  @override
  void initState() {
    super.initState();
    filteredDonations = donations;
  }

  void _filterDonations(String query) {
    setState(() {
      filteredDonations = donations
          .where((donation) =>
              donation.name.toLowerCase().contains(query.toLowerCase()) ||
              donation.appname.toLowerCase().contains(query.toLowerCase()) ||
              donation.donation.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ThemeApp.redColor,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 40),
                    Text(
                      'Perfil da pessoa',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: _filterDonations,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ThemeApp.darkgrayColor,
                    hintText: 'Pesquisar doações',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ...filteredDonations.map((donation) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ThemeApp.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                donation.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                donation.appname,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            donation.donation,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
