import 'package:flutter/material.dart';
import 'package:myfavmovie/models/favourites.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  static String routeName = "/fav-page";

  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Movie'),
      ),
      body: Consumer<Favourits>(
        builder: (context, value, child) => ListView.builder(
            itemCount: value.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) => FavouriteTile(value.items[index])),
      ),
    );
  }
}

class FavouriteTile extends StatelessWidget {
  final String itemName;
  FavouriteTile(this.itemName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
      ),
      title: Text(
        itemName,
        key: Key('favourites_text_$itemName'),
      ),
      trailing: IconButton(
        key: Key('remove_icon_$itemName'),
        icon: const Icon(Icons.close),
        onPressed: () {
          Provider.of<Favourits>(context, listen: false).remove(itemName);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Removed From Favourites'),
            duration: Duration(seconds: 1),
          ));
        },
      ),
    );
  }
}
