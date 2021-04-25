import 'package:projecto_carros/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(Carro(
      id: 12251,
      nome: "Chevrolet Corvette 78",
      descricao: "Desc Chevrolet Corvette",
      latitude: "-23.564224",
      longitude: "-46.653156",
      urlFoto:
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png",
      tipo: "classicos",
      urlVideo:
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/corvette.mp4",
    ));
    carros.add(
      Carro(
          id: 12261,
          nome: "Chevrolet Impala Coupe",
          tipo: "classicos",
          descricao: "Desc Chevrolet Impala Coupe",
          urlFoto:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png",
          urlVideo:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/chevrolet_impala.mp4",
          latitude: "-23.564224",
          longitude: "-46.653156"),
    );
    carros.add(
      Carro(
          id: 12271,
          nome: "Cadillac Deville Convertible",
          tipo: "classicos",
          descricao: "Desc Cadillac Deville Convertible",
          urlFoto:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Deville_Convertible.png",
          urlVideo:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/cadillac_deville.mp4",
          latitude: "-23.564224",
          longitude: "-46.653156"),
    );
    return carros;
  }
}
