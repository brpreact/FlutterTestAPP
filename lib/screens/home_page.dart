import 'package:flutter/material.dart';
import 'package:myfavmovie/models/favourites.dart';
import 'package:myfavmovie/screens/fav_page.dart';
import 'package:provider/provider.dart';

List<String> names = ['Hacked', 'Her', 'A Mero Hajur 4'];

class HomePage extends StatelessWidget {
  static String routeName = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, FavouritePage.routeName);
              },
              icon: const Icon(Icons.favorite_border),
              label: const Text('Fav'))
        ],
      ),
      body: ListView.builder(
          cacheExtent: 20,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: names.length,
          itemBuilder: (ctx, i) {
            return ItemTile(names[i]);
          }),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String itemName;
  const ItemTile(this.itemName);

  @override
  Widget build(BuildContext context) {
    var favouritesList = Provider.of<Favourits>(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
        ),
        title: Text(
          itemName,
          key: Key(itemName),
        ),
        trailing: IconButton(
            onPressed: () {
              !favouritesList.items.contains(itemName)
                  ? favouritesList.add(itemName)
                  : favouritesList.remove(itemName);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(favouritesList.items.contains(itemName)
                      ? 'Added to favorites.'
                      : 'Removed from favorites.'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: favouritesList.items.contains(itemName)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border)),
      ),
    );
  }
}
