class AniobBisiesto_model{
  final aniobis;

  AniobBisiesto_model({required this.aniobis});

  static AniobBisiesto_model esBisiesto(int anio){
    final multiploa = 4;
    final exepcion = 100;
    final multiplob = 400;
    bool aniobis = false;
    if(anio % multiploa == 0){
      if(anio % exepcion==0){
        if(anio % multiplob ==0){
          aniobis=true;
        }else{
          aniobis=false;
        }
      }else{
        aniobis=true;
      }
    }else{
      aniobis=false;
    }
    return AniobBisiesto_model(
        aniobis: aniobis
    );
  }
}