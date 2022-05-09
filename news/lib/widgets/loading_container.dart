import "package:flutter/material.dart";

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: buildContainer(MediaQuery.of(context).size.width / 2),
          subtitle: buildContainer(MediaQuery.of(context).size.width),
        ),
        const Divider(thickness: 1.1, height: 10),
      ],
    );
  }

  Widget buildContainer(double width) {
    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
          height: 25,
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 5),
        ),
      ],
    );
  }
}
