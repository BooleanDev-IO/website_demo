import 'package:flutter/material.dart';

class JobDetailPage extends StatefulWidget {
  JobDetailPage();

  static Route<T> getJobDetail<T>() {
    return MaterialPageRoute(
      builder: (_) => JobDetailPage(),
    );
  }

  @override
  _JobDetailPageState createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.work, size: 40),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gitlab",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "UX Designer",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              _headerStatic("Salary", "\$85,000"),
              _headerStatic("Applicants", "45"),
              _headerStatic("Salary", "\$120,000"),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Icon(Icons.pages, size: 20, color: Colors.deepPurple.shade900),
              ),
              Expanded(
                child: Icon(Icons.museum, size: 20, color: Colors.blueGrey),
              ),
              Expanded(
                child: Icon(Icons.lock_clock, size: 20, color: Colors.blueGrey),
              ),
              Expanded(
                child: Icon(Icons.map, size: 20, color: Colors.blueGrey),
              ),
            ],
          ),
          Divider(
            color: Colors.blueGrey,
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _headerStatic(String title, String sub) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height: 5),
          Text(
            sub,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _jobDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Job Description",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "You will be Gitlab's dedicated UI/Ux designer, reporting to the chief Technology Officer. You will come up with the user experience for few product features, including developing conceptual design to test with clients and then. Share the...",
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: Text("Learn more", style: TextStyle(fontSize: 14, color: Colors.deepPurple.shade900)),
          )
        ],
      ),
    );
  }

  Widget _ourPeople(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Our People", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 12),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _people(context, img: Icons.person, name: "J. Smith"),
                _people(context, img: Icons.person_2, name: "L. James"),
                _people(context, img: Icons.person_3, name: "Emma"),
                _people(context, img: Icons.person_4, name: "Mattews"),
                _people(context, img: Icons.person_3, name: "Timothy"),
                _people(context, img: Icons.person_4, name: "Kyole"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _people(BuildContext context, {required IconData img, required String name}) {
    return Container(
      height: 100,
      width: 50,
      child: Column(
        children: [
          CircleAvatar(
            child: Icon(img),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 10, color: Colors.blueGrey)),
        ],
      ),
    );
  }

  Widget _apply(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 54),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade900), padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16))),
              onPressed: () {},
              child: Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 16)),
              side: MaterialStateProperty.all(
                BorderSide(color: Colors.deepPurple.shade900),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Save",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple.shade900),
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Colors.deepPurple.shade900,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_header(context), _jobDescription(context), _ourPeople(context), _apply(context)],
      ),
    );
  }
}
