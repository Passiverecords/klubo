import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klubo/realm/app_services.dart';
import 'package:klubo/realm/realm_models.dart';
import 'package:klubo/realm/realm_services.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool hasShownModal = false;

  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context, listen: false);
    final realmService = Provider.of<RealmServices?>(context, listen: false);
    RealmResults<Producer>? producer = realmService?.realm.all<Producer>();
    if (realmService != null) {
      producer;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(
                        text: 'Choisis ton',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(237, 105, 90, 1),
                            decoration: TextDecoration.none),
                      ),
                      TextSpan(
                        text: '\nproducteur',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(30, 45, 67, 1),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text('Vos producteurs favoris :')),
              _buildFavoriteProducerList(producer!),
              const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text('La liste de vos producteurs :')),
              Expanded(child: _buildProducerList(producer)),
              FilledButton(
                  onPressed: () {
                    appServices.currentUser?.logOut();
                    realmService?.app.currentUser?.logOut();
                  },
                  child: Text('deco'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteProducerList(RealmResults<Producer> producers) {
    double itemHeight = MediaQuery.of(context).size.height * 0.15;
    double itemWidth = MediaQuery.of(context).size.width * 0.3;
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: producers.length,
        itemBuilder: (context, index) {
          if (producers[index].images?.mini != null) {
            return SizedBox(
              height: itemHeight,
              width: itemWidth,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        producers[index].images!.mini!,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.error);
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      producers[index].name!,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildProducerList(RealmResults<Producer> producers) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: producers.map((producer) {
          if (producer.images?.mini != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: const Color.fromRGBO(255, 247, 243, 1),
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          producer.images!.mini!,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons.error);
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Via ton copain ${producer.admins.first.substring(0, 4)}'),
                              Text(
                                producer.name!,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }).toList(),
      ),
    );
  }
}
