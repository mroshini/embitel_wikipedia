import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:wikipedia/core/api_db_models/searched_data_api_model.dart';
import 'package:wikipedia/core/api_helper/app_exception.dart';
import 'package:wikipedia/core/repositories/search_data_repository.dart';
import 'package:wikipedia/core/view_models/base/base_change_notifier_model.dart';

class SearchDataViewModel extends BaseChangeNotifierModel {
  SearchDataRepository _searchDataRepository;
  SearchedDataApiModel searchedDataApiModelResponse;
  int pageNo = 1;
  List<Pages> _searchedPages = [];
  TextEditingController searchEditController;
  FocusNode searchTextFocus;
  Timer searchOnStoppedTyping;
  bool isTextChanging = false;

  List<Pages> get searchedPages => _searchedPages;

  SearchDataViewModel({@required searchDataRepository})
      : _searchDataRepository = searchDataRepository;

  Future<void> getSearchedPagesFromApi(
      {int pageLimit, String searchKey}) async {
    setState(BaseViewState.Busy);
    try {
      final searchedPages =
          await _searchDataRepository.getSearchQueryApi(searchKey: searchKey);
      await setSearchedData(searchedPages.query.pages, searchKey);
    } on BadRequestException {
      setState(BaseViewState.Error);
    } finally {
      setState(BaseViewState.Idle);
    }
  }

  setSearchedData(List<Pages> pages, String searchQuery) async {
    _searchedPages = pages;
    notifyListeners();
  }

  onChangeHandler(String query, BuildContext mContext) async {
    await loadFromCache(query);
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping.cancel();
    }
    isTextChanging = true;
    searchOnStoppedTyping = Timer(
      duration,
      () => searchQuery(
        query ?? '',
        mContext,
        isChanged: true,
      ),
    );
    notifyListeners();
  }

  searchQuery(String query, BuildContext mContext,
      {bool isChanged = false}) async {
    await loadFromCache(query);
    if (searchEditController.text.isEmpty) {
      clearDataAndUnFocus(mContext);
    } else {}
    if (query.isNotEmpty && query != null && query.length > 2) {
      Future.delayed(Duration(milliseconds: 1000), () async {
        try {
          await getSearchedPagesFromApi(
              searchKey: query == null || query == '' ? '' : query);
        } catch (e) {
          setState(BaseViewState.Idle);
          await loadFromCache(query);
        }
      });
    } else {}
  }

  loadFromCache(String query) async {
    _searchedPages.clear();
    await _searchDataRepository.getCachedPages().then((value) {
      if (value.length > 0) {
        value.asMap().forEach((index, pageData) {
          if (pageData.title.toLowerCase().startsWith(query.toLowerCase())) {
            _searchedPages.add(pageData);
          } else {}
        });
      } else {
        //  setState(BaseViewState.Idle);
      }
    });
    notifyListeners();
  }

  clearDataAndUnFocus(BuildContext mContext) {
    _searchedPages.clear();
    searchTextFocus.unfocus();
    isTextChanging = false;
    setState(BaseViewState.Idle);
    FocusScope.of(mContext).requestFocus(null);
    notifyListeners();
  }

  @override
  void dispose() {
    Hive.close();
    searchEditController.dispose();
    searchTextFocus.dispose();
    super.dispose();
  }
}
