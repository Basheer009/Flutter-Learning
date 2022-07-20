import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesAndSnackBar extends StatelessWidget {
  const ImagesAndSnackBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search for Anything',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: MyHomePageBody(
                url:
                    "https://static.moviecrow.com/marquee/etharkkum-thunindhavan-fdfs-plot-run-time-censor--more/194692_thumb_665.jpg"),
          ),
          const SnackBarPage(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage("images/diamond.png"),
            ),
          ),

        ],
      ),
    );
  }
}


class MyHomePageBody extends StatelessWidget {
  const MyHomePageBody({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        // image: NetworkImage(url),
        image: CachedNetworkImageProvider(url),
      ),
    );
    // return CachedNetworkImage(
    //   imageUrl: "http://via.placeholder.com/350x150",
    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //       CircularProgressIndicator(value: downloadProgress.progress),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );

    // CachedNetworkImage(
    //   imageUrl: "http://via.placeholder.com/200x150",
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: imageProvider,
    //           fit: BoxFit.cover,
    //           colorFilter:
    //           ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    //     ),
    //   ),
    //   placeholder: (context, url) => CircularProgressIndicator(),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    // );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
