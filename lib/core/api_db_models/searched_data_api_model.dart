import 'package:hive/hive.dart';

part 'searched_data_api_model.g.dart';

class SearchedDataApiModel {
  bool batchcomplete;
  Continue continueStatus;
  Query query;

  SearchedDataApiModel({this.batchcomplete, this.continueStatus, this.query});

  SearchedDataApiModel.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    continueStatus = json['continue'] != null
        ? new Continue.fromJson(json['continue'])
        : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this.batchcomplete;
    if (this.continueStatus != null) {
      data['continue'] = this.continueStatus.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query.toJson();
    }
    return data;
  }
}

class Continue {
  int gpsoffset;
  String continueStatus;

  Continue({this.gpsoffset, this.continueStatus});

  Continue.fromJson(Map<String, dynamic> json) {
    gpsoffset = json['gpsoffset'];
    continueStatus = json['continue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpsoffset'] = this.gpsoffset;
    data['continue'] = this.continueStatus;
    return data;
  }
}

@HiveType(typeId: 0)
class Query {
  List<Redirects> redirects;
  @HiveField(0)
  List<Pages> pages;

  Query({this.redirects, this.pages});

  Query.fromJson(Map<String, dynamic> json) {
    if (json['redirects'] != null) {
      redirects = new List<Redirects>();
      json['redirects'].forEach((v) {
        redirects.add(new Redirects.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = new List<Pages>();
      json['pages'].forEach((v) {
        pages.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.redirects != null) {
      data['redirects'] = this.redirects.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Redirects {
  int index;
  String from;
  String to;

  Redirects({this.index, this.from, this.to});

  Redirects.fromJson(Map<String, dynamic> json) {
    index = json['index'] ?? "";
    from = json['from'] ?? "";
    to = json['to'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

@HiveType(typeId: 0)
class Pages {
  @HiveField(0)
  int pageid;
  @HiveField(1)
  int ns;
  @HiveField(2)
  String title;
  @HiveField(3)
  int index;
  @HiveField(4)
  Thumbnail thumbnail;
  @HiveField(5)
  Terms terms;

  Pages(
      {this.pageid,
      this.ns,
      this.title,
      this.index,
      this.thumbnail,
      this.terms});

  Pages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    index = json['index'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this.pageid;
    data['ns'] = this.ns;
    data['title'] = this.title;
    data['index'] = this.index;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.terms != null) {
      data['terms'] = this.terms.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Thumbnail {
  @HiveField(0)
  String source;
  @HiveField(1)
  int width;
  @HiveField(2)
  int height;

  Thumbnail({this.source, this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

@HiveType(typeId: 2)
class Terms {
  @HiveField(0)
  List<String> description;

  Terms({this.description});

  Terms.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}
