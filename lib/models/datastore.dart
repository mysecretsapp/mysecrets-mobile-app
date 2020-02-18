class Datastore {
  final int id;
  final String name;
  final String type;
  final Map<String, String> settings;


  Datastore({this.id, this.name, this.type, this.settings});
  factory Datastore.fromMap(Map<String, dynamic> json) => new Datastore(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        settings: json["settings"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": type,
        "settings": settings
      };
}