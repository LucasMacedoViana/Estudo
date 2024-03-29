import 'package:flutter/material.dart';
import 'package:great_places/providers/greate_places.dart';
import 'package:great_places/utils/appRoutes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Lugares',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_fORM);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Nenhum local cadastrado'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          subtitle:Text(greatPlaces.itemByIndex(i).location.address!) ,
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.PLACE_DATAIL, arguments: greatPlaces.itemByIndex(i));
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
