import 'package:flutter/material.dart';
import 'package:chef_bytes/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
                // to show a placeholder image while the actual image is loading
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover, //to fit the image
                height: 200,
                width: double.infinity //to take the full width of the card

                ),
            Positioned(
              bottom: 0,
              left: 0, // start 0px from the left of the above widget
              right: 70, // ends 50 px before the above widget ends
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black54,
                ),
                // making the text more readable even if background image is light
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, //very long text
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
