class MoviesModel {
  final String id;
  final String categoryId;
  final String title;
  final List<String> imageUrls;
  final List<String> actors;
  final String director;
  final String description;
  final double rating;

  MoviesModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.imageUrls,
    required this.actors,
    required this.director,
    required this.description,
    required this.rating,
  });
}

class Movies {
  List<MoviesModel> _list = [
    MoviesModel(
      id: "m1",
      categoryId: "c1",
      title: "Zero",
      imageUrls: [
        "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/3c8f0854-cab4-40f7-8086-df7249ac903a/600x900",
        "https://m.media-amazon.com/images/M/MV5BMzg0NjU3MzgtZGFhMC00YjQ4LWE3YWUtNWRlNWJhYzhjNmQ1XkEyXkFqcGdeQXVyNTYwMzA0MTM@._V1_.jpg",
        "https://i.ytimg.com/vi/INlFMT09hlI/maxresdefault.jpg",
      ],
      actors: ["a1", "a2", "a3", "a4"],
      director: "Aanand L. Rai",
      description:
          "Zero is a 2018 Indian romantic comedy-drama film written by Himanshu Sharma, directed by Aanand L. Rai and produced by Colour Yellow Productions in collaboration with Red Chillies Entertainment. Starring Shah Rukh Khan, Katrina Kaif and Anushka Sharma in leading roles, Zero revolves around the most prominent character Bauua Singh, a short man from Meerut who after having difficulty finding a marriage partner, finds a companion in Aafia Bhinder, a NSAR (a fictional space research facility) scientist with cerebral palsy. However, film superstar Babita also gets close with him, testing his first relationship, before this love triangle takes them to far-off cities, thrusting Bauua into an adventure to discover both his true love and completeness in a life lived to the fullest.",
      rating: 4,
    ),
    MoviesModel(
      id: "m2",
      categoryId: "c1",
      title: "Barfi!",
      imageUrls: [
        "https://upload.wikimedia.org/wikipedia/en/thumb/2/2e/Barfi%21_poster.jpg/220px-Barfi%21_poster.jpg",
        "https://i.ytimg.com/vi/TcDmarWK68c/maxresdefault.jpg",
        "https://images.mygoodtimes.in/wp-content/uploads/2019/09/12130834/Barfi-e1568293729597.jpg",
      ],
      actors: ["a1", "a2", "a3", "a4"],
      director: "Anurag Basu",
      description:
          "Barfi! is a 2012 Indian Hindi-language romantic comedy-drama film written and directed by Anurag Basu and produced by Ronnie Screwvala and Siddharth Roy Kapur under UTV Motion Pictures. Set in the 1970s, the film depicts the story of Murphy 'Barfi' Johnson (a deaf-mute boy from Darjeeling) and his relationships with two women, Shruti and Jhilmil (who is autistic). The film stars Ranbir Kapoor, Priyanka Chopra, and Ileana D'Cruz in the lead roles, with Saurabh Shukla, Ashish Vidyarthi, Jisshu Sengupta and Roopa Ganguly in supporting roles.",
      rating: 5,
    ),
    MoviesModel(
      id: "m3",
      categoryId: "c1",
      title: "Devdas",
      imageUrls: [
        "https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/e574f6ae-4be2-4ab4-bdbc-89ff6c39c4b0/300x450",
        "https://avatars.mds.yandex.net/get-kinopoisk-image/1946459/f4776449-f5ff-43c4-8602-e60c80487b4d/x252",
        "https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/20ac3546-359b-44bd-85d6-27e9ce7ac3da/2560x",
      ],
      actors: ["a1", "a2", "a3", "a4"],
      director: "Sanjay Leela Bhansali",
      description:
          "Devdas is a Bengali-language film based on the Sharat Chandra Chattopadhyay novel Devdas. It is the first Bangladeshi version of the story and the first colour film version in Bangladesh. It was the first of two versions directed by Chashi Nazrul Islam.",
      rating: 45,
    ),
    MoviesModel(
      id: "m4",
      categoryId: "c1",
      title: "My Name Is Khan",
      imageUrls: [
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5Y36lCiNyyV71mjq6LavgiggbhT.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/xuqgovav0bbzwxzSg9K0RcEzLPj.jpg",
      ],
      actors: ["a1", "a2", "a3", "a4"],
      director: "Karan Johar",
      description:
          "Rizwan Khan, a Muslim from the Borivali section of Mumbai, has Asperger's syndrome. He marries a Hindu single mother, Mandira, in San Francisco. After 9/11, Rizwan is detained by authorities at LAX who treat him as a terrorist because of his condition and his race.",
      rating: 3,
    ),
    MoviesModel(
      id: "m5",
      categoryId: "c2",
      title: "Joker",
      imageUrls: [
        "https://www.themoviedb.org/t/p/w220_and_h330_face/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/f5F4cRhQdUbyVbB5lTNCwUzD6BP.jpg",
      ],
      actors: ["a5", "a6", "a7"],
      director: "Karan Johar",
      description:
          "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
      rating: 5,
    ),
    MoviesModel(
      id: "m6",
      categoryId: "c2",
      title: "Once Upon a Time…",
      imageUrls: [
        "https://www.themoviedb.org/t/p/w220_and_h330_face/8j58iEBw9pOXFD2L0nt0ZXeHviB.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/hj59t2wo5sYdPW3OSONMHYmAz09.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/oRiUKwDpcqDdoLwPoA4FIRh3hqY.jpg",
      ],
      actors: ["a5", "a6", "a7"],
      director: "Quentin Tarantino",
      description:
          "Los Angeles, 1969. TV star Rick Dalton, a struggling actor specializing in westerns, and stuntman Cliff Booth, his best friend, try to survive in a constantly changing movie industry. Dalton is the neighbor of the young and promising actress and model Sharon Tate, who has just married the prestigious Polish director Roman Polanski…",
      rating: 4,
    ),
    MoviesModel(
      id: "m7",
      categoryId: "c2",
      title: "Ad Astra",
      imageUrls: [
        "https://www.themoviedb.org/t/p/w220_and_h330_face/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/AeDS2MKGFy6QcjgWbJBde0Ga6Hd.jpg",
        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/cjytKnwXW8Gy1HA6Ejwso4FmPSv.jpg",
      ],
      actors: ["a5", "a6", "a7"],
      director: "James Gray",
      description:
          "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.",
      rating: 3,
    ),
    MoviesModel(
      id: "m8",
      categoryId: "c3",
      title: "Ilhaq",
      imageUrls: [
        "https://tasix.online/uploads/posts/2020-05/1588930442_bezymjannyj.png",
        "https://tasix.online/uploads/posts/2020-05/thumbs/1588930093_ikkinchi_zha_on_urushi_alabasining_75_yilligiga_ba_ishlangan1.jpg",
        "https://tasix.online/uploads/posts/2020-05/thumbs/1588930056_img_4702-xl1.jpg",
      ],
      actors: ["a8", "a9", "a10", "a11"],
      director: "Jahongir Ahmedov",
      description: "Uzbek film",
      rating: 5,
    ),
    MoviesModel(
      id: "m9",
      categoryId: "c3",
      title: "Temur",
      imageUrls: [
        "https://tasix.online/uploads/posts/2020-05/1588919386_12116u20453_t_v1.jpeg",
        "https://i.ytimg.com/vi/uCL9l0oeW04/maxresdefault.jpg",
      ],
      actors: ["a8", "a9", "a10", "a11"],
      director: "Nodir Muminov",
      description: "Uzbek film",
      rating: 4,
    ),
    MoviesModel(
      id: "m10",
      categoryId: "c3",
      title: "Panoh",
      imageUrls: [
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hd8dqOW7urnznHjjnvpaGMvlSJx.jpg",
        "https://i.ytimg.com/vi/8dxJb9RVJas/maxresdefault.jpg",
        "https://vdp.mycdn.me/getImage?id=343454583393&idx=14&thumbType=32",
      ],
      actors: ["a8", "a9", "a10", "a11"],
      director: "Rustam Sadiev",
      description: "Uzbek film",
      rating: 4,
    ),
  ];

  List<MoviesModel> _favorites = [];

  List<MoviesModel> get list {
    return _list;
  }

  List<MoviesModel> get favorites {
    return _favorites;
  }

  void toggleLike(String movieId) {
    final movieIndex = _favorites.indexWhere((movie) => movie.id == movieId);
    if (movieIndex < 0) {
      _favorites.add(list.firstWhere((movie) => movie.id == movieId));
    } else {
      _favorites.removeWhere((movies) => movies.id == movieId);
    }
  }

  void deleteMovie(String id) {
    _list.removeWhere((movie) => movie.id == id);
    print("movies_models $id");
  }
}
