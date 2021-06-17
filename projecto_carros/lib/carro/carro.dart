import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projecto_carros/helpers/event_bus.dart';
import 'package:projecto_carros/helpers/sql/entity.dart';
import 'dart:convert' as convert;

class CarroEvent extends Event {
  //salvar, deletar
  String acao;
//classicos, exportivos, luxo
  String tipo;

  CarroEvent(this.acao, this.tipo);

  @override
  String toString() {
    return "CarroEvent : acao $acao,tipo $tipo ";
  }
}

class Carro extends Entity {
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;
  latLng() {
    return LatLng(
      latitude == null || latitude.isEmpty ? 0.0 : double.parse(latitude),
      latitude == null || longitude.isEmpty ? 0.0 : double.parse(longitude),
    );
  }

  Carro({
    this.id,
    this.nome,
    this.tipo,
    this.descricao,
    this.urlFoto,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  Carro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  String toJsonC() {
    String json = convert.json.encode(toJson());
    return json;
  }

  @override
  String toString() {
    return 'Carro{id: $id, nome: $nome, tipo: $tipo, descricao: $descricao, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude}';
  }
}
