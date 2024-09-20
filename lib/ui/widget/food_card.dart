part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, this.food});

  final Food? food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 134,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(food?.picturePath ?? ''),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food?.name ?? 'Not Found',
                    style: blackFontStyle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  RatingStars(
                    rate: food?.rate,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
