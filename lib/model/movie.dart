class MovieModel {
  bool? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  MovieModel({this.status, this.statusCode, this.message, this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cardName;
  int? cardType;
  String? aspectRatio;
  List<ContentList>? contentList;

  Data({this.cardName, this.cardType, this.aspectRatio, this.contentList});

  Data.fromJson(Map<String, dynamic> json) {
    cardName = json['card_name'];
    cardType = json['card_type'];
    aspectRatio = json['aspect_ratio'];
    if (json['content_list'] != null) {
      contentList = <ContentList>[];
      json['content_list'].forEach((v) {
        contentList!.add(new ContentList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_name'] = this.cardName;
    data['card_type'] = this.cardType;
    data['aspect_ratio'] = this.aspectRatio;
    if (this.contentList != null) {
      data['content_list'] = this.contentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentList {
  String? imageUrl;
  String? name;
  String? contentId;
  String? aspectRatio;
  bool? isAvod;
  bool? isTvod;
  bool? isSvod;
  String? duration;
  bool? isResume;
  String? watchedDuration;

  ContentList(
      {this.imageUrl,
      this.name,
      this.contentId,
      this.aspectRatio,
      this.isAvod,
      this.isTvod,
      this.isSvod,
      this.duration,
      this.isResume,
      this.watchedDuration});

  ContentList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    name = json['name'];
    contentId = json['content_id'];
    aspectRatio = json['aspect_ratio'];
    isAvod = json['is_avod'];
    isTvod = json['is_tvod'];
    isSvod = json['is_svod'];
    duration = json['duration'];
    isResume = json['is_resume'];
    watchedDuration = json['watched_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['content_id'] = this.contentId;
    data['aspect_ratio'] = this.aspectRatio;
    data['is_avod'] = this.isAvod;
    data['is_tvod'] = this.isTvod;
    data['is_svod'] = this.isSvod;
    data['duration'] = this.duration;
    data['is_resume'] = this.isResume;
    data['watched_duration'] = this.watchedDuration;
    return data;
  }
}