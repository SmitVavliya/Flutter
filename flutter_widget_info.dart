// Text

body: Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      Text(
        "Smit Vavliya",
        maxLines: 3,
        style: TextStyle(
          backgroundColor: Colors.red,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
      )
    ],
  ),
),

// RichText

body: Center(
    child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    RichText(
      text: TextSpan(
        text: "Smit",
        style: TextStyle(
          color: Colors.cyan,
          fontSize: 18,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: "Himmatbhai",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "Vavliya",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 18,
            ),
          )
        ],
      ),
    )
  ],
)),

// ElevatedButton

ElevatedButton(
  onPressed: () => print("Button Pressed!!!"),
  child: Row(
    children: const <Widget>[
      Icon(Icons.add),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Add",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ],
  ),
  style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(100, 40),
    ),
    elevation: MaterialStateProperty.all<double>(10),
    backgroundColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.green;
        }
        return null;
      },
    ),
  ),
),

ElevatedButton.icon(
  onPressed: () => print("Button Pressed!!!"),
  icon: Icon(Icons.android),
  label: Text(
    "Press",
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(120, 50),
    ),
  ),
)

// OutlinedButton

OutlinedButton(
  onPressed: () => print("Button Pressed!!!"),
  child: Row(
    children: const <Widget>[
      Icon(Icons.add),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Press",
        ),
      )
    ],
  ),
  style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(110, 40),
    ),
    side: MaterialStateProperty.all<BorderSide>(BorderSide(
      color: Colors.blue,
      width: 1,
    )),
  ),
),

// TextButton

TextButton(
  onPressed: () => print("Button Pressed!!!"),
  child: Row(
    children: const <Widget>[
      Icon(Icons.add),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text("Press"),
      )
    ],
  ),
  style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(100, 40),
    ),
  ),
)

// IconButton

IconButton(
  onPressed: () => print("button Pressed!!!"),
  icon: Icon(Icons.add),
  color: Colors.blue,
  iconSize: 30,
  splashColor: Colors.green,
  tooltip: "This is the icon button", // Shown on long press
)

// Ink

Ink(
  decoration: ShapeDecoration(
    shape: CircleBorder(),
    color: Colors.blue,
  ),
  child: IconButton(
    icon: Icon(Icons.android),
    onPressed: () => print("Button Pressed!!!"),
  ),
)

// FloatingActionButton

floatingActionButton: FloatingActionButton(
  onPressed: () => print("Button Pressed!!!"),
  child: Icon(Icons.add),
  backgroundColor: Colors.red,
  tooltip: "Tooltip",
),

floatingActionButton: FloatingActionButton.extended(
  onPressed: () => print("Button Pressed!!!"),
  label: Text("Add"),
  icon: Icon(Icons.add),
  backgroundColor: Colors.red,
  tooltip: "Tooltip",
),

// Container

Container(
  child: Text(
    "Smit Vavliya",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  width: double.infinity,
  height: double.infinity,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
    shape: BoxShape.rectangle,
  ),
  constraints: BoxConstraints(
    minHeight: 100,
    maxHeight: 300,
  ),
),

// Image

Image.asset(
  "asset/smit_image.jpeg",
  height: 100,
  width: 100,
  frameBuilder: (
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return Container(
      child: child,
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  },
),

// InSide the Container
decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage("asset/smit_image.jpeg"),
  ),
),

Image.network(
  "https://picsum.photos/seed/picsum/200/300",
  frameBuilder: (BuildContext context, Widget child, int? frame,
      bool wasSynchronouslyLoaded) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: child,
    );
  },
  loadingBuilder: (BuildContext context, Widget child,
      ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
  errorBuilder: (BuildContext context, Object object, StackTrace? st) {
    return Center(
      child: Text("Error Occured !!!"),
    );
  },
),

// List

ListView(
  // scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.all(10),
  children: _listItems.map(
    (element) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: element,
      );
    },
  ).toList(),
),

ListView.builder(
  itemCount: _listItems.length,
  itemBuilder: (BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: _listItems[index],
    );
  },
),

ListView.builder(
  itemCount: _listItems.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: _listItems[index],
      subtitle: Text("Gujarati"),
      leading: Icon(Icons.done),
      trailing: Icon(Icons.close),
      onTap: () => print("Pressed index: $index"),
    );
  },
),

ListView.separated(
  padding: EdgeInsets.all(10),
  itemCount: _listItems.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: _listItems[index],
      subtitle: Text("Gujarati"),
      leading: Icon(Icons.done),
      trailing: Icon(Icons.close),
      onTap: () => print("Pressed index: $index"),
    );
  },
  separatorBuilder: (BuildContext context, int index) {
    return Divider(
      color: Colors.red,
    );
  },
),

ListView.builder(
  itemCount: _listItems.length,
  itemBuilder: (BuildContext context, int index) {
    return Dismissible(
      key: ValueKey(index),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListTile(
          title: _listItems[index],
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print(direction);
      },
      // confirmDismiss: (dismiss) {},
      background: Container(
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  },
),

// Text Field

TextField(
    autofocus: true,
    controller: _textController,
    enabled: true,
    enableInteractiveSelection: true,
    enableSuggestions: true,
    keyboardType: TextInputType.emailAddress,
    // obscureText: true, // For password
  ),
),

TextField(
  // autofocus: true,
  controller: _textController,
  enabled: true,
  enableInteractiveSelection: true,
  enableSuggestions: true,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    contentPadding: const EdgeInsets.all(15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.blue),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.green),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red),
    ),
    // fillColor: Colors.green[50],
    // filled: true,
    hintText: "First Name",
    // hintStyle: TextStyle(),
    icon: Icon(Icons.person),
    labelText: "First Name",
    // labelStyle: TextStyle(),
    // prefixIcon: Icon(Icons.person),
    // suffixIcon: Icon(Icons.person),
  ),
  onChanged: (value) {
    print(value);
  },
  textAlignVertical: TextAlignVertical.center,
),

// SizedBox

SizedBox(
  height: 300,
  child: ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(
            "${(index + 1) * int.parse(_textController.text)}"),
      );
    },
  ),
)

// Expanded

Expanded(
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(
            "${(index + 1) * int.parse(_textController.text)}"),
      );
    },
  ),
)

// GridView

GridView(
  scrollDirection: Axis.vertical,
  reverse: false,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 1,
    crossAxisSpacing: 10,
    mainAxisSpacing: 20,
  ),
  controller: ScrollController(
      // initialScrollOffset: 10,
      // keepScrollOffset: true
      ),
  physics: ScrollPhysics(),
  padding: const EdgeInsets.all(10),
  children: dummy
      .map(
        (e) => Container(
          width: 100,
          height: 100,
          child: Text("$e"),
          color: Colors.red,
          alignment: Alignment.center,
        ),
      )
      .toList(),
),

// MediaQuery && Navigator

Scaffold(
  appBar: AppBar(
    title: Text("Flutter Demo"),
    backgroundColor: Colors.amber,
  ),
  body: Center(
    child: Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      color: Colors.red,
    ),
  ),
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.ac_unit),
    // popAndPushedNamed method is used when we don't want to navigate back to the previous screen
    // onPressed: () => Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => Screen2(),
    //   ),
    // ),
    onPressed: () => Navigator.of(context).pushNamed(
      Screen2.routeName,
      arguments: {"message": "Navigation is Working!!!"},
    ),
  ),
);

// http request

class _MyHomeAppState extends State<MyHomeApp> {
  var _textController;
  String _quote = "";
  bool _quoteController = false;

  @override
  void initState() {
    super.initState();
    // All the initializations that we wanna do
    _textController = TextEditingController();
    _textController.text = "2";
  }

  @override
  void dispose() {
    // Write code here
    _textController.dispose();
    super.dispose();
  }

  Future<dynamic> getKanye() async {
    try {
      var url = Uri.parse("https://api.kanye.rest");
      var res = await http.get(url);
      var result = json.decode(res.body);

      return result['quote'];
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    if (!_quoteController) {
      getKanye().then(
        (value) => setState(() {
          _quoteController = true;
          _quote = value;
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
        backgroundColor: Colors.amber,
      ),
      body: (_quote.isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Text(_quote),
            ),
    );
  }
}

// showModalBottomSheet

body: Center( 
  child: ElevatedButton(
    child: Text("Show Bottom Sheet"),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            color: Colors.red,
          );
        },
      );
    },
  ),
),

// showBottomSheet

class _FABState extends State<FAB> {
  bool isOpen = false;

  var bottomSheetController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isOpen = !isOpen;
        });
        print('tapped on the bottom sheet');
        if(isOpen) {
          bottomSheetController = showBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (ctx) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    height: 150,
                    color: Colors.black,
                    child: TextField()
                  ),
                );
              });
          bottomSheetController.closed.then((value) {
            setState(() {
              isOpen = !isOpen;
            });
          });
        } else {
          Navigator.of(context).pop();
          setState(() {
            isOpen = !isOpen;
          });
        }
      },
      child: isOpen?Icon(Icons.arrow_downward):Icon(Icons.arrow_upward),
    );
  }
}

@override
Widget build(BuildContext context) {
  ToastContext().init(context);

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  return Scaffold(
    key: _scaffoldKey,
    appBar: AppBar(
      title: Text("Flutter Demo"),
      backgroundColor: Colors.amber,
    ),
    body: Center(
      child: ElevatedButton(
        child: Text("Show Bottom Sheet"),
        onPressed: () {
          _scaffoldKey.currentState?.showBottomSheet(
            (BuildContext context) {
              return Container(
                height: 400,
                color: Colors.red,
              );
            },
          );
        },
      ),
    ),
  );
}
}
