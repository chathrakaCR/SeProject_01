enum Gender { Male, Femail }

class UserModel {
  String id,
      name,
      email,
      address,
      telnum,
      birthday,
      nic,
      userType,
      docReg,
      pharmReg;
  Gender gender;

  UserModel();

  Map toMap() {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['telnum'] = telnum;
    map['birthday'] = birthday;
    map['nic'] = nic;
    map['gender'] = gender == Gender.Male ? 'Male' : 'Female';
    map['userType'] = userType;
    map['docReg'] = docReg;
    map['pharmReg'] = pharmReg;
    return map;
  }

  UserModel.fromMap(Map map) {
    name = map['name'];
    email = map['email'];
    address = map['address'];
    telnum = map['telnum'];
    birthday = map['birthday'];
    nic = map['nic'];
    gender = map['gender'] == 'Male' ? Gender.Male : Gender.Femail;
    userType = map['userType'];
    docReg = map['docReg'];
    pharmReg = map['pharmReg'];
  }
}
