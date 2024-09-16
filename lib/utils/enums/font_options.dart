enum FontOptions {
  montserrat,
  noToSerif;

  String get key => switch (this) {
        FontOptions.montserrat => "Montserrat",
        FontOptions.noToSerif => "NotoSerif",
      };
}
