// enum PersonJob {
//   student,
//   developer,
// }

// abstract class Person {
//   String getName();
//   String getJobName();

//   factory Person(PersonJob job) {
//     switch (job) {
//       case PersonJob.student:
//         return Student();
//       case PersonJob.developer:
//         return Developer();
//     }
//   }
// }

// class Student implements Person {
//   final String name = 'Yeji';
//   final String jobName = 'high school student';

//   @override
//   String getName() {
//     return name;
//   }

//   @override
//   String getJobName() {
//     return jobName;
//   }
// }

// class Developer implements Person {
//   final String name = 'Yuna';
//   final String jobName = 'Frontend Developer';

//   @override
//   String getName() {
//     return name;
//   }

//   @override
//   String getJobName() {
//     return jobName;
//   }
// }

// void main() {
//   print('Person 1: ${Person(PersonJob.student).getJobName()}');
//   print('Person 2: ${Person(PersonJob.developer).getJobName()}');
// }

class Singleton {
  static final Map<String, dynamic> _data = <String, dynamic>{};

  static final Singleton _singletonData = Singleton._internal();

  factory Singleton() => _singletonData;

  Singleton._internal() {
    print('싱글톤 클래스의 인스턴스 생성');
  }

  set(String key, dynamic data) => _data[key] = data;
  get(String key) => _data[key];
}

void main() {
  Singleton dataList1 = Singleton();
  dataList1.set('Job1', 'Student');
  dataList1.set('Name1', 'minchan');

  Singleton dataList2 = Singleton();
  dataList2.set('Job2', 'Developer');
  dataList2.set('Name2', 'yeji');
  if (dataList1 == dataList2) {
    print("같은 인스턴스입니다.");
  }

  print("dataList1 정보");
  print("Job1: ${dataList1.get('Job1')}, Name1: ${dataList1.get('Name1')}");
  print("Job2: ${dataList1.get('Job2')}, Name2: ${dataList1.get('Name2')}");

  print("dataList2 정보");
  print("Job1: ${dataList2.get('Job1')}, Name1: ${dataList2.get('Name1')}");
  print("Job2: ${dataList2.get('Job2')}, Name2: ${dataList2.get('Name2')}");
}
