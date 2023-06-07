

import 'package:flutter/material.dart';


class OffersPage extends StatelessWidget {



  const OffersPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
        Offer(title: "My great offers Page", description: "Buy one, get 10 for free"),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  // Properties
  final String title;
  final String description;

  const Offer({Key? key, required this.title,
    required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 7,
          color: Colors.amber.shade50,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                     image: AssetImage("images/background.png"
                     )
                )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(title,
                  style: Theme.of(context).textTheme.headline5,
                  )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child:
                  Text(description,

                  style: Theme.of(context).textTheme.headline6,
                  )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

