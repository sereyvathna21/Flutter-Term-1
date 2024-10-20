enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city, $_zipCode';
}

class Employee {
  final String _name;
  final Address _address;
  final int _yearsOfExperience;
  final List<Skill> _skills;

  static const double _baseSalary = 40000;

  Employee(
    this._name,
    this._address,
    this._yearsOfExperience,
    this._skills,
  );

  Employee.mobileDeveloper(
    String name,
    Address address,
    int yearsOfExperience,
  )   : _name = name,
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _skills = [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  List<Skill> get skills => _skills;

  double calculateSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      salary += _getSkillBonus(skill);
    }

    return salary;
  }

  double _getSkillBonus(Skill skill) {
    switch (skill) {
      case Skill.FLUTTER:
        return 5000;
      case Skill.DART:
        return 3000;
      case Skill.OTHER:
        return 1000;
      default:
        return 0;
    }
  }

  void printDetails() {
    print('--- Employee Details ---');
    print('Name: $_name');
    print('Address: ${_address.toString()}');
    print('Years of Experience: $_yearsOfExperience');
    print(
        'Skills: ${_skills.map((s) => s.toString().split('.').last).join(', ')}');
    print('Calculated Salary: \$${calculateSalary()}');
    print('------------------------');
  }
}

void main() {
  var address = Address('123 Main St', 'Phnom Penh', '12000');

  var emp1 = Employee.mobileDeveloper('Vathna', address, 5);

  emp1.printDetails();
}
