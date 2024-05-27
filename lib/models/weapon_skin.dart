class WeaponSkin {
  final String? uuid;
  final String? displayName;
  final String? category;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final String? fullRender;
  final String? killStreamIcon;
  final String? streamedVideo;
  final List<dynamic>? chromas;
  final List<dynamic>? levels;

  WeaponSkin({
    this.uuid,
    this.displayName,
    this.category,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.fullRender,
    this.killStreamIcon,
    this.streamedVideo,
    this.chromas,
    this.levels,
  });

  factory WeaponSkin.fromJson(Map<String, dynamic> json) {
    return WeaponSkin(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      themeUuid: json['themeUuid'],
      contentTierUuid: json['contentTierUuid'],
      displayIcon: json['displayIcon'],
      fullRender: json['fullRender'],
      killStreamIcon: json['killStreamIcon'],
      streamedVideo: json['streamedVideo'],
      chromas: json['chromas'],
      levels: json['levels'],
    );
  }
}
