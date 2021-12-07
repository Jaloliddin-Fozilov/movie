class ActorsModel {
  final String id;
  final String name;
  final String image;

  ActorsModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

class Actors {
  List<ActorsModel> _list = [
    ActorsModel(
      id: "a1",
      name: "Shah Rukh Khan",
      image:
          "https://m.media-amazon.com/images/M/MV5BZDk1ZmU0NGYtMzQ2Yi00N2NjLTkyNWEtZWE2NTU4NTJiZGUzXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR4,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a2",
      name: "Anushka Sharma",
      image:
          "https://m.media-amazon.com/images/M/MV5BNGM5YmYwNjUtNzQyYS00OGY0LTljZDAtMDNiMjhiOTFiMzRiXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR3,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a3",
      name: "Katrina Kaif",
      image:
          "https://m.media-amazon.com/images/M/MV5BMjI0Nzc4OTE0NV5BMl5BanBnXkFtZTgwOTczODgyNDM@._V1_UY317_CR10,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a4",
      name: "Mohd. Zeeshan Ayyub",
      image:
          "https://m.media-amazon.com/images/M/MV5BODcyY2JlZTktYTU4ZS00MGY1LTgyY2MtODA4NWUyZDBlNjc5L2ltYWdlXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR12,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a5",
      name: "Joaquin Phoenix",
      image:
          "https://m.media-amazon.com/images/M/MV5BZGMyY2Q4NTEtMWVkZS00NzcwLTkzNmQtYzBlMWZhZGNhMDhkXkEyXkFqcGdeQXVyNjk1MjYyNTA@._V1_UX214_CR0,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a6",
      name: "Frances Conroy",
      image:
          "https://m.media-amazon.com/images/M/MV5BMTM4OTIzMTg5MF5BMl5BanBnXkFtZTYwNjA5OTIz._V1_UY317_CR1,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a7",
      name: "Robert De Niro",
      image:
          "https://m.media-amazon.com/images/M/MV5BMjAwNDU3MzcyOV5BMl5BanBnXkFtZTcwMjc0MTIxMw@@._V1_UY317_CR13,0,214,317_AL_.jpg",
    ),
    ActorsModel(
      id: "a8",
      name: "Dilorom Karimova",
      image: "https://www.kino-teatr.ru/acter/album/315683/pv_339514.jpg",
    ),
    ActorsModel(
      id: "a9",
      name: "Fotih Nasimov",
      image: "https://www.kino-teatr.ru/acter/foto/post/315699.jpg",
    ),
    ActorsModel(
      id: "a10",
      name: "Husan Rashidov",
      image: "https://i.imgur.com/Oc7mHjp.png",
    ),
    ActorsModel(
      id: "a11",
      name: "Rano Zakirova",
      image: "https://i.ytimg.com/vi/uCn7LX4X4RU/maxresdefault.jpg",
    ),
  ];

  List<ActorsModel> get list {
    return _list;
  }
}
