import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/provider/recipe_provider.dart';
import 'package:recipe_app/services/recipe_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food App'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            final recipeData = ref.watch(recipeProvider);
            return recipeData.when(
                data: (data) {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Text(data[index].name);
                      });
                },
                error: (err, stack) => Text('$err'),
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }),
        ));
  }
}
