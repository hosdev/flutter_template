import 'package:faker/faker.dart';

class FakerHelper {
  static final _faker = Faker();

  static String get randomStr => _faker.lorem.word();
  static List<String> randomWords(int numberOfWords) =>
      _faker.lorem.words(numberOfWords);
  static String get name => _faker.person.name();
  static String get company => _faker.company.name();
  static String get email => _faker.internet.email();
  static String get phone => _faker.phoneNumber.us();
  static DateTime get date => _faker.date.dateTime();
  static String get time => _faker.date.time();
  static String get address => _faker.address.country();
  static String get street => _faker.address.streetName();
  static String get city => _faker.address.city();
  static String get zipCode => _faker.address.zipCode();
  static String get image => _faker.image.image(random: false,keywords: ['Building','Apartment','Land','Real State']);
  static String imageByName(String name) => _faker.image.image(random: false,keywords: [name]);
  static String get desc => _faker.lorem.sentence();
}
