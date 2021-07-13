class PetInfo {
  final String petname;

  const PetInfo(this.petname, {String text, String textdetail});

  static const pet = [PetInfo('POPPY'), PetInfo('PEEPO'), PetInfo('ABBY')];
}
