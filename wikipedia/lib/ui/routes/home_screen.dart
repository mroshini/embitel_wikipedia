import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia/core/view_models/search_data_view_model.dart';
import 'package:wikipedia/ui/routes/search_pages_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchDataViewModel searchDataViewModel;

  @override
  void initState() {
    searchDataViewModel =
        Provider.of<SearchDataViewModel>(context, listen: false);
    searchDataViewModel.searchEditController = TextEditingController();
    searchDataViewModel.searchTextFocus = FocusNode();
    searchDataViewModel.searchTextFocus.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDataViewModel>(builder: (context, model, child) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Wikipedia",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            controller: model.searchEditController,
                            focusNode: model.searchTextFocus,
                            textInputAction: TextInputAction.search,
                            onChanged: (value) async {
                              await model.onChangeHandler(
                                  model.searchEditController.text, context);
                            },
                            onEditingComplete: () async {
                              await model.searchQuery(
                                  model.searchEditController.text, context);
                            },
                            onFieldSubmitted: (term) async {
                              model.searchTextFocus.unfocus();
                              await model.searchQuery(
                                  model.searchEditController.text, context);
                            },
                            style: Theme.of(context).textTheme.headline4,
                            decoration: InputDecoration(
                              hintText: "Search here",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              suffixIcon: Visibility(
                                visible: model.isTextChanging,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    model.searchEditController.text = "";
                                    model.clearDataAndUnFocus(context);
                                  },
                                ),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  //  model.searchEditController.text = "";
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    model.searchedPages != null
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: SearchPagesListScreen(),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<bool> _onWillPop() {
    AlertDialog alert = AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      title: Text(
        'Are you sure you want to exit the app?',
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: [
        new TextButton(
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
          child: new Text(
            'Yes',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        new TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text(
            'No',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ],
    );

    return showDialog(
          context: context,
          builder: (context) => alert,
        ) ??
        false;
  }
}
