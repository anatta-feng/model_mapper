abstract class Serializer<T> {
  Map<String, dynamic> serialize(T object);

  T deserialize(Map<String, dynamic> map);
}