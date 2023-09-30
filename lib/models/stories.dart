

class Stories{
  String _image;
  String _name;

  Stories(this._image, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}