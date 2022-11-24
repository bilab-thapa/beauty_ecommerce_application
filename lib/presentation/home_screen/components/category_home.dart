import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    Widget buildTieIcon() {
      return const Icon(Icons.tiktok);
    }

    Widget buildTrieIcon() {
      return const Icon(Icons.tiktok);
    }

    Widget buildTeieIcon() {
      return const Icon(Icons.tiktok);
    }

    Widget buildCategory() {
      return Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight * 0.1 - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: null, child: Text('see more'))
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: const <Widget>[],
            ),
          ),
        ],
      );
    }

    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [buildCategory()],
        ),
      ),
    );
  }
}
