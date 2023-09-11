class GitResponseModel {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final Owner owner;
  final String htmlUrl;
  final String description;
  final bool fork;
  final String url;

  GitResponseModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'node_id': nodeId});
    result.addAll({'name': name});
    result.addAll({'full_name': fullName});
    result.addAll({'private': private});
    result.addAll({'owner': owner.toMap()});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'description': description});
    result.addAll({'fork': fork});
    result.addAll({'url': url});

    return result;
  }

  factory GitResponseModel.fromMap(Map<String, dynamic> map) {
    return GitResponseModel(
      id: map['id']?.toInt() ?? 0,
      nodeId: map['node_id'] ?? '',
      name: map['name'] ?? '',
      fullName: map['full_name'] ?? '',
      private: map['private'] ?? false,
      owner: Owner.fromMap(map['owner']),
      htmlUrl: map['html_url'] ?? '',
      description: map['description'] ?? '',
      fork: map['fork'] ?? false,
      url: map['url'] ?? '',
    );
  }
}

class Owner {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'login': login});
    result.addAll({'id': id});
    result.addAll({'node_id': nodeId});
    result.addAll({'avatar_url': avatarUrl});
    result.addAll({'gravatar_id': gravatarId});
    result.addAll({'url': url});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'followers_url': followersUrl});
    result.addAll({'following_url': followingUrl});
    result.addAll({'gists_url': gistsUrl});
    result.addAll({'starred_url': starredUrl});
    result.addAll({'subscriptions_url': subscriptionsUrl});
    result.addAll({'organizations_url': organizationsUrl});
    result.addAll({'repos_url': reposUrl});
    result.addAll({'events_url': eventsUrl});
    result.addAll({'received_events_url': receivedEventsUrl});
    result.addAll({'type': type});
    result.addAll({'site_admin': siteAdmin});

    return result;
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      nodeId: map['node_id'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      gravatarId: map['gravatar_id'] ?? '',
      url: map['url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      followersUrl: map['followers_url'] ?? '',
      followingUrl: map['following_url'] ?? '',
      gistsUrl: map['gists_url'] ?? '',
      starredUrl: map['starred_url'] ?? '',
      subscriptionsUrl: map['subscriptions_url'] ?? '',
      organizationsUrl: map['organizations_url'] ?? '',
      reposUrl: map['repos_url'] ?? '',
      eventsUrl: map['events_url'] ?? '',
      receivedEventsUrl: map['received_events_url'] ?? '',
      type: map['type'] ?? '',
      siteAdmin: map['site_admin'] ?? false,
    );
  }
}
