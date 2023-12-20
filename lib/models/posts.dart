class Posts {
  int _id;
   String _profImage ;
   String _name;
   String _postImage;
   String _date;
   String _likedBy;
   String  _number;
   String dateTime;
   String image1;
  String image2;
  String image3;


  Posts(
       this._id,
       this._profImage,
       this._name,
       this._postImage,
       this._date,
       this._likedBy,
       this._number,
       this.dateTime,
      this.image1,
      this.image2,
      this.image3
       );


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

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get likedBy => _likedBy;

  set likedBy(String value) {
    _likedBy = value;
  }
}