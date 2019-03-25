
abstract class ModelStore {
  bool isLoad = false;
  bool loadEver = false;
  List<Function> _suscribes = new List<Function>();

  bool needLoad () => !isLoad || loadEver;

  void loadData ();

  void loadFromJson(dynamic jsonObject);

  void callSuscribe() {
    _suscribes.forEach((f){
      try {
        f();
      }
      catch(Exection) {
        this.removeSubcribe(f);
      }
    }
     );
  }
  void removeSubcribe (Function removed) {
      _suscribes.remove(removed);
  }
  void addSusbcribe (Function add){
    _suscribes.add(add);
  }

}