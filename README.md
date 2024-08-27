## API Requests with Flutter BLoC

### Draft

Make a request, first step will be make a request, after I make a request, I am going to get some data (GET Request), I am not going to send any data to the server, I am just expecting some data from the server, which is in the format of JSON, now I will need to convert this JSON into a Dart Model, and then update the UI.

1. Make a Request ->
2. JSON -> 
3. Dart Model -> 
4. Update UI

If talking about BLoC

First of all when app will open I want to call the API

1. First Event -> Make a GET Request
2. --- Loading ---- State
3. GET the data (Mapping - means convert that JSON into a dart model) 
4. Emit a State -> Update the UI

Since we are going to listen and build both, then we will be using BlocConsumer

Post is a feature, inside that we are going to have a Bloc and UI


repositories are like intermediate stage between bloc and ui, it is going to make the request, repos are going to talk to the network

mappers folder:
it is going to take a network model or json model and convert it into a dart model 

in the UI, I want to create a Post page, i dont want home page, i wish to fetch post from the APIs

PostsInitialFetchEvent, means as soon as the app is opened, the intiial event is going to be the fetching of API

Bloc is going to take an event, event goes inside the bloc, and bloc emits a state

event -> bloc -> state

after making the get reqeust
```
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {});
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  // Function has been created
  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    var client = Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}

```

now convert it into a dart model

Model:

```
class PostsDataUiModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostsDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}
```

This complete list is small small maps, list of jsons , list of dictionaries: 

```
 {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  },
```

now the above PostsDataUiModel is a dart model, i want to convert my json into a dart, my json is a list of maps, now if im goingg to say, i am going to get a list of dart models, i am satisfying the condition, 


use quicktype.io to convert to json serialization 

Repository is a file that actually calls the API, we need to remove the API calls from the Bloc because bloc should only have the business logic not network logics.


 
