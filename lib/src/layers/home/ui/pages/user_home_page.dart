import 'package:flutter/material.dart';
import 'package:marjosports/src/theme/theme_app.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SearchBar(
                  shadowColor:
                      WidgetStateProperty.all<Color?>(Colors.transparent),
                  shape: WidgetStateProperty.all<OutlinedBorder?>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  backgroundColor:
                      WidgetStateProperty.all<Color?>(ThemeApp.darkgrayColor),
                  hintText: 'Pesquisar doações',
                  hintStyle: WidgetStateProperty.all<TextStyle?>(
                    const TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ThemeApp.grayColor,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'APP NAME',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'R\$ 12,00',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ThemeApp.grayColor,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'APP NAME',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'R\$ 12,00',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
