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

List<String> cities = [];

List<Map<String, List<String>>> regions = [
  {
    "Addis Abeba": [
      "Addis Ketema",
      "Akaki Kaliti",
      "Bole",
      "Gulele",
      "Head Office",
      "Kirkos",
      "Kolfe",
      "Ledeta",
      "Nefas Selk Lafto",
      "yeka"
    ]
  },
  {
    "Afar": ["semera"]
  },
  {
    "Amhara": [
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
    ]
  },
  {
    "Benishangul Gumuz": ["Asosa", "Gilgel beles", "Kamashi"]
  },
  {
    "Deredewa": ["Deredewa"]
  },
  {
    "Harer": ["Chiro", "Harer"]
  },
  {
    "Oromia": [
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
    ]
  },
  {
    "Sidama": ["Hawasa"]
  },
  {
    "SNNPR": [
      "Arba Minch",
      "Dila",
      "Durame",
      "Hosanna",
      "Jinka",
      "Sawla",
      "Sodo",
      "Welkite",
      "Werabe"
    ]
  },
  {
    "Somalia": ["Jijiga", "Qebridahare"]
  },
  {
    "SWEP": ["Mizan", "Gambela", "Dawro", "Bongad"]
  },
  {
    "Tigray": [
      "Adigrat",
      "Mekele",
      "Aksum",
      "shire",
      "Maychew",
      "Humera",
      "Inda Slasse"
    ]
  }
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
