import 'package:covidtrack/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;
   DetailScreen({
     required this.image ,
     required this.name ,
     required this.totalCases,
     required this.totalDeaths,
     required this.totalRecovered,
     required this.active,
     required this.critical,
     required this.todayRecovered,
     required this.test,
});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.10),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height:MediaQuery.of(context).size.height * .06),
                        ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                        ReusableRow(title: "Total Recovered", value: widget.todayRecovered.toString()),
                        ReusableRow(title: "Total Deaths", value: widget.totalDeaths.toString()),
                        ReusableRow(title: "Today Recovered", value: widget.todayRecovered.toString()),
                        ReusableRow(title: "Active", value: widget.active.toString()),
                        ReusableRow(title: "Critical", value: widget.critical.toString()),
                        ReusableRow(title: "Test", value: widget.test.toString()),


                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image.toString()),
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
