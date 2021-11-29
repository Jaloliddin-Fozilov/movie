class MoviesModel {
  final String id;
  final String categoryId;
  final String title;
  final List<String> imageUrls;
  final String description;
  final int star;

  MoviesModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.star,
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
        "https://i.ytimg.com/vi/INlFMT09hlI/maxresdefault.jpg"
      ],
      description:
          "Zero is a 2018 Indian romantic comedy-drama film written by Himanshu Sharma, directed by Aanand L. Rai and produced by Colour Yellow Productions in collaboration with Red Chillies Entertainment. Starring Shah Rukh Khan, Katrina Kaif and Anushka Sharma in leading roles, Zero revolves around the most prominent character Bauua Singh, a short man from Meerut who after having difficulty finding a marriage partner, finds a companion in Aafia Bhinder, a NSAR (a fictional space research facility) scientist with cerebral palsy. However, film superstar Babita also gets close with him, testing his first relationship, before this love triangle takes them to far-off cities, thrusting Bauua into an adventure to discover both his true love and completeness in a life lived to the fullest.",
      star: 4,
    ),
    MoviesModel(
      id: "m3",
      categoryId: "c1",
      title: "Barfi!",
      imageUrls: [
        "https://upload.wikimedia.org/wikipedia/en/thumb/2/2e/Barfi%21_poster.jpg/220px-Barfi%21_poster.jpg"
            "https://i.ytimg.com/vi/TcDmarWK68c/maxresdefault.jpg",
        "https://images.mygoodtimes.in/wp-content/uploads/2019/09/12130834/Barfi-e1568293729597.jpg",
      ],
      description:
          "Barfi! is a 2012 Indian Hindi-language romantic comedy-drama film written and directed by Anurag Basu and produced by Ronnie Screwvala and Siddharth Roy Kapur under UTV Motion Pictures. Set in the 1970s, the film depicts the story of Murphy 'Barfi' Johnson (a deaf-mute boy from Darjeeling) and his relationships with two women, Shruti and Jhilmil (who is autistic). The film stars Ranbir Kapoor, Priyanka Chopra, and Ileana D'Cruz in the lead roles, with Saurabh Shukla, Ashish Vidyarthi, Jisshu Sengupta and Roopa Ganguly in supporting roles.",
      star: 5,
    ),
  ];

  List<MoviesModel> get list {
    return _list;
  }
}
