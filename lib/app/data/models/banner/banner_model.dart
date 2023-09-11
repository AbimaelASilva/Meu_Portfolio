class BannerModel {
  final int id;
  final int idBannerGroup;
  final String idStore;
  String url;
  final List<String> showIn;
  final String expiresIn;
  final String createdAt;
  final String updatedAt;

  BannerModel({
    required this.id,
    required this.idBannerGroup,
    required this.idStore,
    required this.url,
    required this.showIn,
    required this.expiresIn,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'id_banner_group': idBannerGroup});
    result.addAll({'id_store': idStore});
    result.addAll({'url': url});
    result.addAll({'expires_in': expiresIn});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});

    return result;
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    List<String> _showIn = [];
    if (map['show_in'] != null) {
      for (var value in map['show_in']) {
        _showIn.add(value);
      }
    }

    return BannerModel(
      id: map['id']?.toInt() ?? 0,
      idBannerGroup: map['id_banner_group']?.toInt() ?? 0,
      idStore: map['id_store'] ?? '',
      url: map['url'] ?? '',
      showIn: _showIn,
      expiresIn: map['expires_in'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }
  factory BannerModel.empty() {
    return BannerModel(
      id: 0,
      idBannerGroup: 0,
      idStore: '',
      url: '',
      showIn: [],
      expiresIn: '',
      createdAt: '',
      updatedAt: '',
    );
  }
}
