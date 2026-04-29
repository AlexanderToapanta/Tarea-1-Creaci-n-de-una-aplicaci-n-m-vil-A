import '../model/anio_model.dart';
class AniobBisiesto_controller{
  String procesar(String anio){
    try {
      final aniobis = int.parse(anio);
      final r = AniobBisiesto_model.esBisiesto(aniobis);
      if(r.aniobis==true){
        return 'El año ${anio} es bisiesto';
      }else{
        return 'El año ${anio} no es bisiesto';
      }
    }catch(e){


      return "Error: Ingresar otra vez el año";
    }
    }
}
