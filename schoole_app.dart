

import 'dart:io';
List<Student> _student=[];
// ignore: unused_element
List<Subject> _subject=[];
List<studentmarks> _Marks=[];

void main(){
  var chooseoption;

loop :
while (true){
print ('Please Choose your option)');
print ('A.Add New Student )');
print ('C.Print Marks )');
print ('D.DeleteStudent )');
print ('F.PrintSpecificStudentData )');
print ('G.Addsubject )');
print ('B.Add  mark )');

chooseoption=stdin.readLineSync().toString();
 switch  (chooseoption){
   case 'A':
   print ('Please Input Student info as (id,name,age,address,email,phone)');
final student=Student(id:int.parse(stdin.readLineSync().toString()),Name: stdin.readLineSync().toString(),age:int.parse(stdin.readLineSync().toString()),Address: stdin.readLineSync().toString(),Email: stdin.readLineSync().toString(), Phone: stdin.readLineSync().toString() ,rate:0);
 _student.add(student);
  continue;
  case 'C':
 print(_student);
 continue;
 case 'D':
 print ('Enter Student id)');
 removestudent(int.parse(stdin.readLineSync().toString()));
 continue;
 case 'F':
 print ('Enter Student id)');
 StudentData(int.parse(stdin.readLineSync().toString()));
 continue;
 case 'G':
    print ('Please Input subject info as (id,subjetc_name,subject_grade)');
   addsubject( int.parse(stdin.readLineSync().toString()), stdin.readLineSync().toString());
;
print ('Subject added succefully)');
   continue;
   case 'B':
   int studentid_marks;
   int subjectid_marks;
   double subejctgrade_marks;
   var studentname;
   var subjectname;
   var subjectgradstring;
   
       print ('Enter Student id)');
       studentid_marks = int.parse(stdin.readLineSync().toString());
       print ('Enter subject id)');
       subjectid_marks = int.parse(stdin.readLineSync().toString());
       print ('Enter subjectgrade)');
       subejctgrade_marks=double.parse(stdin.readLineSync().toString());
       studentname=_student.firstWhere((element) => element.id == studentid_marks).Name;
        subjectname=_subject.firstWhere((element) => element.subject_id == subjectid_marks).subject_name;
      if (subejctgrade_marks >= 50 )
      {
        subjectgradstring = 'Succedded';
 
      }
      if (subejctgrade_marks < 50 )
      {
        subjectgradstring = 'Faild';
 
      }
       print ('the student :$studentname in the subjectname:$subjectname and he is :$subjectgradstring in this subject' );
       
continue;
 default:
 print('nothingchoose');
 continue;
 }}
}
class studentmarks{
studentmarks({required this.studentid,required this.subjectid,required this.subjectgrad});
int studentid;
int subjectid;
double subjectgrad;
}
void StudentData(int id ){
  print(_student.firstWhere((element) => element.id==id));
}
void removestudent(int id){
_student.removeWhere((element) => element.id ==id);
}

class operationstudent{

  void addstudent({
    required int id,
    required String Name,
    required int age,
    required String Address,
    required String Email,
    required String Phone,
    required int rate

  }){
    _student.add(Student(id: id,Name: Name,age: age,Address: Address,Email:Email,Phone: Phone,rate: rate));
  }

}
class Person {
  Person({required this.id, required this.Name, required this.age, required this.Address});
    int id;
    String Name;
    int age;
    String Address;
   @override
   String toString() => 'Hello,id:$id and  My Name is:$Name and my Age is :$age and my address is:$Address ';
   String descripn() =>
   'Hello, My Name is:$Name and my Age is :$age and my address is:$Address';
   void printdesc() => print("Hello , I 'am $Name");
}
class Subject {
   Subject({ required this.subject_id,required this.subject_name });
   int subject_id;
   String subject_name;
   
}
void updatemarkd(int studentid,int subjectid,double subjectgrade)
{
  final marks=studentmarks(studentid: studentid, subjectid: subjectid, subjectgrad: subjectgrade);
  _Marks.add(marks);
}
void addsubject(int id,String subject_name){
final subject=Subject(subject_id: id,subject_name: subject_name);
_subject.add(subject);
}
class Student extends Person {
  Student({required int id,required String Name,required int age,required String Address,required this.Email,required this.Phone,required rate})
   :super(id: id,Name: Name,age: age,Address: Address);
  final String Email;
  final String Phone;
  Map<int,int> rate ={
    1:0,
    2:0,
    3:0,
  };
 
@override
String toString() => '${super.toString()},email:$Email and Phone is :$Phone';
}

