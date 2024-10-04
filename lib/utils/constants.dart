import 'dart:ui';

String devAPI = "http://127.0.0.1:8000";
String prodAPI = "https://psssa-backend.onrender.com";

// Datas
List<String> categories = [
  "Civil",
  "Police",
  "Military",
  "Undertaking",
];

List<List<String>> cities = [
  [
    "Addis Ketema",
    "Akaki Kaliti",
    "Bole",
    "Gulele",
    "Head Office",
    "Kirkos",
    "Kolfe",
    "Ledeta",
    "Nefas Selk Lafto",
    "yeka",
  ],
  ["semera"],
  [
    "Bahir Dar",
    "Debarq",
    "Debre Berehan",
    "Debre Markos",
    "Debre Tabor",
    "Dessie",
    "Finote Selam",
    "Gonder",
    "Injibara",
    "kemse",
    "Woldia"
  ],
  ["Asosa", "Gilgel beles", "Kamashi"],
  ["Deredewa"],
  ["Chiro", "Harer"],
  [
    "Negele",
    "Asela",
    "Goba",
    "Shasemene",
    "Yabelo",
    "Ginir",
    "Bulehora",
    "batu",
    "Ambo",
    "Bishoftu",
    "Weliso",
    "fiche",
    "metu",
    "Bedele",
    "Gimbi",
    "Nekemt",
    "Dembi Dolo",
    "shambu"
  ],
  ["Hawasa"],
  [
    "Arba Minch",
    "Dila",
    "Durame",
    "Hosanna",
    "Jinka",
    "Sawla",
    "Sodo",
    "Welkite",
    "Werabe"
  ],
  ["Jijiga", "Qebridahare"],
  ["Mizan", "Gambela", "Dawro", "Bongad"],
  ["Adigrat", "Mekele", "Aksum", "shire", "Maychew", "Humera", "Inda Slasse"],
];

List<String> regions = [
  "Addis Abeba",
  "Afar",
  "Amhara",
  "Benishangul Gumuz",
  "Deredewa",
  "Harer",
  "Oromia",
  "Sidama",
  "SNNPR",
  "Somalia",
  "SWEP",
  "Tigray",
];

Color primary = const Color.fromARGB(255, 0, 122, 255);
Color background = const Color.fromARGB(255, 245, 245, 255);
Color black = const Color.fromARGB(255, 51, 51, 51);
Color grey = const Color.fromARGB(255, 102, 102, 102);
Color white = const Color.fromARGB(255, 248, 251, 255);
Color shadowColor = const Color.fromARGB(255, 187, 219, 255);

class SpacingSize {
  // between a group elements
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s28 = 28;
  static const double s32 = 32;
  static const double s36 = 36;
  static const double s40 = 40;
}
