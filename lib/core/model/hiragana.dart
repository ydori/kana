typedef KanaMap = Map<String, String>;

class Hiragana {
  const Hiragana._();

  // Basic characters.
  static const List<KanaMap> bases = [
    {"あ": "A", "い": "I", "う": "U", "え": "E", "お": "O"},
    {"か": "KA", "き": "KI", "く": "KU", "け": "KE", "こ": "KO"},
    {"さ": "SA", "し": "SHI", "す": "SU", "せ": "SE", "そ": "SO"},
    {"た": "TA", "ち": "CHI", "つ": "TSU", "て": "TE", "と": "TO"},
    {"な": "NA", "に": "NI", "ぬ": "NU", "ね": "NE", "の": "NO"},
    {"は": "HA", "ひ": "HI", "ふ": "FU", "へ": "HE", "ほ": "HO"},
    {"ま": "MA", "み": "MI", "む": "MU", "め": "ME", "も": "MO"},
    {"や": "YA", "ゆ": "YU", "よ": "YO"},
    {"ら": "RA", "り": "RI", "る": "RU", "れ": "RE", "ろ": "RO"},
    {"わ": "WA", "を": "WO", "ん": "N"},
  ];

  // Dakuten (゛) versions.
  static const List<KanaMap> dakutens = [
    {"が": "GA", "ぎ": "GI", "ぐ": "GU", "げ": "GE", "ご": "GO"},
    {"ざ": "ZA", "じ": "JI", "ず": "ZU", "ぜ": "ZE", "ぞ": "ZO"},
    {"だ": "DA", "ぢ": "JI", "づ": "ZU", "で": "DE", "ど": "DO"},
    {"ば": "BA", "び": "BI", "ぶ": "BU", "べ": "BE", "ぼ": "BO"},
  ];

  // Handakuten (゜) versions.
  static const List<KanaMap> handakutens = [
    {"ぱ": "PA", "ぴ": "PI", "ぷ": "PU", "ぺ": "PE", "ぽ": "PO"},
  ];

  // All characters.
  static List<KanaMap> all = bases + dakutens + handakutens;
}
