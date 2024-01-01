import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CafeInformationWidget extends StatelessWidget {
  final String cafeName;
  final String address;

  const CafeInformationWidget({
    Key? key,
    required this.cafeName,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            'Cafe Information'.text.bold.center.xl4.make().p(10),
            5.heightBox,
            'Cafe Name: $cafeName'.text.xl2.make().p(5),
            5.heightBox,
            'Address: $address'.text.xl2.make().p(5),
          ],
        ),
      
    );
  }
}

class CafeMenuWidget extends StatelessWidget {
  final String cafeName;

  const CafeMenuWidget({
    Key? key,
    required this.cafeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cafe Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Buraya cafe menüsü ile ilgili widget'ları ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
