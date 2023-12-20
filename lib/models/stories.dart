

class Stories{
  int _id;
  String _image;
  String _name;
  String dateTime;
  bool _shown;

  Stories(  this._id,
  this._image,
     this._name,
     this.dateTime,
      this._shown,
      );

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  bool get shown => _shown;

  set shown(bool value) {
    _shown = value;
  }
}