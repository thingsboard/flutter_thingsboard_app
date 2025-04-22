part of 'entities.dart';

@freezed
class Oauth2Entity with _$Oauth2Entity {
  const factory Oauth2Entity({
    required String name,
    required String? icon,
    required String url,
  }) = _Oauth2Entity;

  factory Oauth2Entity.fromModel(OAuth2ClientInfo model) => Oauth2Entity(
        name: model.name,
        icon: model.icon,
        url: model.url,
      );
}
