class Posts {
   String _profImage ;
   String _name;
   String _postImage;
   String _date;
   String  _number;

   Posts(
      this._profImage,
       this._name,
       this._postImage,
       this._date,
       this._number);


   String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get date => _date;

   set date(String value) {
     _date = value;
   }

  String get postImage => _postImage;

  set postImage(String value) {
    _postImage = value;
  }


   String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get profImage => _profImage;

  set profImage(String value) {
    _profImage = value;
  }
}