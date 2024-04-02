import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/features/feature_one/data/model/restaurant.dart';
import 'package:hungro_food_delivery/features/feature_one/domain/location_service.dart';
import 'package:provider/provider.dart';

class LocationSearchScreen extends StatelessWidget {
  LocationSearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                Provider.of<LocationService>(context, listen: false)
                    .placeAutoComplete(value);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: 'Search for a location',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Consumer<LocationService>(
            builder: (context, locationService, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: locationService.placePredictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          locationService.placePredictions[index].description!),
                      onTap: () {
                        // on tapping the list logic
                        Provider.of<Restaurant>(context, listen: false)
                            .updateDeliveryAddress(locationService
                                .placePredictions[index].description!);
                        _searchController.clear();
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
