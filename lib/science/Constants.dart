class Item {
  String title;
  String detail;
  String image;
  Item({this.title, this.detail, this.image});
}

List<Item> itemList = [
  Item(
      title: 'Sun & Earth',
      detail:
          'The Earth revolves around the Sun once each year and spins on its axis of rotation once each day.',
      image: 'assets/science/sun.gif'),
  Item(
      title: 'Earth & Moon',
      detail:
          'The Moon is smaller than the Earth and orbits around the Earth in 27.3 days as the Earth revolves around the Sun.',
      image: 'assets/science/moon.gif'),
  Item(
      title: 'Title 1', detail: 'Details 1', image: 'assets/science/space.gif'),
];

class BodyParts {
  int id;
  String name;
  BodyParts({this.id, this.name});
}

List<BodyParts> BodyPartsList = [
  BodyParts(id: 0, name: 'Hair'),
  BodyParts(id: 1, name: 'Eye'),
  BodyParts(id: 2, name: 'Arm'),
  BodyParts(id: 3, name: 'Leg'),
  BodyParts(id: 4, name: 'Foot'),
  BodyParts(id: 5, name: 'Neck'),
  BodyParts(id: 6, name: 'Stomach'),
  BodyParts(id: 7, name: 'Hand'),
  // BodyParts(id: 8, name: 'Head'),
  // BodyParts(id: 9, name: 'Body'),
];
