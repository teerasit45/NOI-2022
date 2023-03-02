import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-item-feature/presentation/create-item-screen-2.dart';

var mainBlue = const Color.fromRGBO(10, 36, 99, 1);
var mainWhite = const Color.fromRGBO(234, 234, 234, 1);
var inventoryGreen = const Color.fromRGBO(55, 146, 55, 0.9);
var inventoryOrange = const Color.fromRGBO(255, 165, 0, 0.9);
var inventoryRed = const Color.fromRGBO(211, 47, 47, 0.9);
var statusTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    fontFamily: 'Sukhumvit');

var timeStampStyle = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.76),
    fontWeight: FontWeight.w600,
    fontSize: 12,
    fontFamily: 'Sukhumvit');

class Monitoring extends StatefulWidget {
  const Monitoring({Key? key}) : super(key: key);

  @override
  State<Monitoring> createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: mainWhite),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: PieChart()),
            StatusTemplate(
              name: 'จำนวนทั้งหมด',
              Quantity: '104',
              statusIcon: Icons.inventory_2_rounded,
              iconColor: mainBlue,
            ),
            StatusTemplate(
              name: 'สถานะ: จัดเก็บ',
              Quantity: '53',
              statusIcon: Icons.archive,
              iconColor: inventoryGreen,
            ),
            StatusTemplate(
              name: 'สถานะ: กำลังจัดวาง',
              Quantity: '21',
              statusIcon: Icons.trolley,
              iconColor: inventoryOrange,
            ),
            StatusTemplate(
              name: 'สถานะ: อยู่ระหว่างการจัดส่ง',
              Quantity: '21',
              statusIcon: Icons.local_shipping,
              iconColor: inventoryRed,
            ),
            SizedBox(height: 80,)
          ],
        ),
      )),
    );
  }
}

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 340,
      decoration: const BoxDecoration(color: Colors.white,
          boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            blurRadius: 5,
            offset: Offset(0, 4))
      ]),
    );
  }
}

class StatusTemplate extends StatefulWidget {
  IconData statusIcon;

  String name;
  String Quantity;
  Color iconColor;

  StatusTemplate(
      {Key? key,
      required this.name,
      required this.Quantity,
      required this.statusIcon,
      required this.iconColor})
      : super(key: key);

  @override
  State<StatusTemplate> createState() => _StatusTemplateState();
}

class _StatusTemplateState extends State<StatusTemplate> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          widget.statusIcon,
          color: widget.iconColor,
          size: 20,
        ),
        title: Text(widget.name, style: statusTextStyle),
        trailing: Text(
          '${widget.Quantity} ชิ้น',
          style: statusTextStyle,
        ),
        subtitle: Text('11/4/2565 - 09.00',style: timeStampStyle),
      ),
    );
  }
}
