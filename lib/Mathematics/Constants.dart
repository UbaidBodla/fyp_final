//Data Model Class: make class for data models of object records.
class ObjectRecord {
  int number;
  String image;
  ObjectRecord({this.number, this.image});
}

//Object List:list of object which contains data as object record class model form.
List<ObjectRecord> objectList = [
  ObjectRecord(
      number: 0,
      image:
          "assets/mathematics/Banana.png"), //C:\Users\tariq\3D Objects\E-Learn\alphabetgame\assets\mathematics\Banana.png
  ObjectRecord(number: 1, image: "assets/mathematics/Banana.png"),
  ObjectRecord(number: 2, image: "assets/mathematics/Banana.png"),
  ObjectRecord(number: 3, image: "assets/mathematics/Banana.png"),
  ObjectRecord(number: 4, image: "assets/mathematics/Banana.png"),
];
