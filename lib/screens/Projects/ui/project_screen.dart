import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:website_demo/constants/strings.dart';
import 'package:website_demo/screens/Projects/utils/data_table_source.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<String> type = ["Highway Project", "Roads & Bridges", "Railways", "Hill Roads", "Tourist Place"];
  String selectedType = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(100.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Row(
                children: [
                  Container(
                    width: 345,
                    height: size.height,
                    color: Colors.deepPurple.shade900,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 26,
                        bottom: 26,
                        left: 26,
                        right: 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Projects",
                            style: GoogleFonts.comfortaa(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Divider(),
                          ...List.generate(
                            type.length,
                            (index) => ListTile(
                              splashColor: Colors.white12,
                              contentPadding: EdgeInsets.only(left: 16),
                              onTap: () {
                                selectedType = type[index];
                                setState(() {});
                              },
                              leading: Icon(
                                type[index] == selectedType ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: Colors.white,
                              ),
                              horizontalTitleGap: 40,
                              title: Text(
                                type[index],
                                style: GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        top: 0,
                        bottom: 12,
                        left: 16.0,
                        right: 16,
                      ),
                      child: selectedType.isEmpty
                          ? Center(
                              child: Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  LottieBuilder.asset(
                                    "assets/json/empty.json",
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Text("Please select a type of Project to view its content"),
                                ],
                              ),
                            )
                          : DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  TabBar(tabs: [
                                    Tab(
                                      text: "Completed Project",
                                    ),
                                    Tab(
                                      text: "Ongoing Project",
                                    )
                                  ]),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        PaginatedDataTable(
                                          header: Text(selectedType),
                                          rowsPerPage: 5,
                                          dataRowMaxHeight: 128,
                                          dataRowMinHeight: 50,
                                          columns: Strings.completedProjects.first.keys.map((e) => DataColumn(label: Text(e))).toList(),
                                          source: ProjectDataTableSource(
                                            data: Strings.completedProjects,
                                            onRowSelect: (index) {},
                                          ),
                                        ),
                                        PaginatedDataTable(
                                          header: Text(selectedType),
                                          rowsPerPage: 5,
                                          dataRowMaxHeight: 128,
                                          dataRowMinHeight: 50,
                                          columns: Strings.ongoingProjects.first.keys.map((e) => DataColumn(label: Text(e))).toList(),
                                          source: ProjectDataTableSource(
                                            data: Strings.ongoingProjects,
                                            onRowSelect: (index) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
