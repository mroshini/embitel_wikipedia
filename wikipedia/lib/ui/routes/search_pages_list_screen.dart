import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia/core/utils/cached_network_image.dart';
import 'package:wikipedia/core/utils/routes_constants.dart';
import 'package:wikipedia/core/utils/search_shimmer.dart';
import 'package:wikipedia/core/utils/sized_box.dart';
import 'package:wikipedia/core/view_models/base/base_change_notifier_model.dart';
import 'package:wikipedia/core/view_models/search_data_view_model.dart';

class SearchPagesListScreen extends StatefulWidget {
  @override
  _SearchPagesListScreenState createState() => _SearchPagesListScreenState();
}

class _SearchPagesListScreenState extends State<SearchPagesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDataViewModel>(
      builder: (context, model, child) {
        return model.state == BaseViewState.Busy
            ? SearchShimmer()
            : model.searchedPages.length == 0 &&
                    model.searchEditController.text.length > 0
                ? Container(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Search Results Found",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.searchedPages.length ?? 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, respectiveWebPage,
                              arguments: model.searchedPages[index].title);
                          model.searchTextFocus.unfocus();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 15.0),
                          child: Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: model.searchedPages[index]
                                                    .thumbnail ==
                                                null
                                            ? loaderBeforeImage(
                                                image:
                                                    "assets/images/not_found.jpg",
                                                height: 50.0,
                                                width: 50.0)
                                            : networkImage(
                                                image: model
                                                            .searchedPages[
                                                                index]
                                                            .thumbnail !=
                                                        null
                                                    ? model.searchedPages[index]
                                                        .thumbnail.source
                                                    : "",
                                                height: 50.0,
                                                width: 50.0,
                                              )),
                                    SizedBox(
                                      width: 15,
                                      height: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            model.searchedPages[index].title ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                          ),
                                          verticalSizedBoxFive(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Visibility(
                                                visible: model
                                                        .searchedPages[index]
                                                        .terms !=
                                                    null,
                                                child: Flexible(
                                                  child: Wrap(
                                                    children: _generateChildren(
                                                        model
                                                                    .searchedPages[
                                                                        index]
                                                                    .terms !=
                                                                null
                                                            ? model
                                                                .searchedPages[
                                                                    index]
                                                                .terms
                                                                .description
                                                            : []),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }

  List<Widget> _generateChildren(List<String> description) {
    List<Widget> items = [];

    for (int i = 0; i < description.length; i++) {
      items.add(_generateItem(description[i]));
    }

    return items;
  }

  Widget _generateItem(String value) {
    return Text(
      "$value",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
