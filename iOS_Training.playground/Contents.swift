import UIKit

/************** EXTENSIONS **************/
// Create date extension to show custom date string
extension Date {
    // Option 1 - Create a computed var to format this date
    // with default locale and default format
    var defaultFormatLocale: String {
        let subjectDateFormatted = DateFormatter()
        // Set locale to Spain
        subjectDateFormatted.locale = Locale(identifier: "es_ES")
        // Set date format style "DAY dayNumber 'de' MONTH 'de' YEAR"
        subjectDateFormatted.dateFormat = "eeee dd 'de' MMMM 'de' yyyy"
        
        return subjectDateFormatted.string(from: self)
    }
    
    // Option 2 - Create a function to format this date
    // with this format or default and this locale or default
    func toFormattedString(with format: String = "eeee dd 'de' MMMM 'de' yyyy", locale: String = "es_ES") -> String {
        let subjectDateFormatted = DateFormatter()
        // Set locale to Spain
        subjectDateFormatted.locale = Locale(identifier: locale)
        subjectDateFormatted.dateFormat = format
        
        return subjectDateFormatted.string(from: self)
    }
}


/************** TYPES **************/
// Enum for teacher type with two options 'intern' or 'extern'
enum TeacherType: CustomStringConvertible {
    case intern
    case extern
    
    // Use CustomStringConvertible and description
    // to print String representation of the enum
    // we can localize all strings with this method
    var description: String {
        switch self {
            case .intern:
                return "intern"
            
            case .extern:
                return "extern"
        }
    }
}

// Enum for teacher level with three options 'junior', 'medium' or 'senior'
// On each case have a parameter with level salary 'amount'
enum Salary: CustomStringConvertible {
    case junior(amount: Float)
    case medium(amount: Float)
    case senior(amount: Float)
    
    // Use CustomStringConvertible and description
    // to print String representation of the enum
    // we can localize all strings with this method
    var description: String {
        switch self {
            case .junior:
                return "junior"
            
            case .medium:
                return "medium"
            
            case .senior:
                return "senior"
        }
    }
    
    // Use amount computed var to print String representation
    // of the enum amount parameter
    var amount: String {
        var levelAmount: Float = 0.0
        switch self {
            case .junior(let amount):
                levelAmount = amount
            
            case .medium(let amount):
                levelAmount = amount

            case .senior(let amount):
                levelAmount = amount
        }
        
        return "\(levelAmount)"
    }
}


/************** CLASSES **************/
// Class Student
public class Student: CustomStringConvertible {
    //Properties whit optional '?' value can be nil
    var name: String?
    var surname: String?
    var age: Date?
    var phone: String?
    var address: String?
    var email: String?
    
    // Use description var of CustomStringConvertible
    // to print this class with custom String format
    public var description: String {
        var ageString = ""
        if let age = self.age {
            ageString = age.defaultFormatLocale
        }
        
        // With """ we can print a multiline String
        return """
        Student:
        name: \(String(describing: name))
        surname: \(String(describing: surname))
        age: \(String(describing: ageString))
        phone: \(String(describing: phone))
        address: \(String(describing: address))
        email: \(String(describing: email))
        """
    }
    
    // Custom init (Constructor) class with default values
    convenience init(name: String? = nil, surname: String? = nil, age: Date? = nil, phone: String? = nil, address: String? = nil, email: String? = nil) {
        self.init()
        
        // Always init all properties
        self.name = name
        self.surname = surname
        self.age = age
        self.phone = phone
        self.address = address
        self.email = email
    }
}

// Class Teacher
public class Teacher: CustomStringConvertible {
    //Properties whit optional '?' value can be nil
    var name: String?
    var surname: String?
    var age: Date?
    var email: String?
    var type: TeacherType?
    var salary: Salary?
    
    // Use description var of CustomStringConvertible
    // to print this class with custom String format
    public var description: String {
        var ageString = ""
        if let age = self.age {
            ageString = age.defaultFormatLocale
        }
        
        // With """ we can print a multiline String
        return """
        Teacher:
        name: \(String(describing: name))
        surname: \(String(describing: surname))
        age: \(String(describing: ageString))
        email: \(String(describing: email))
        type: \(String(describing: type))
        salary: \(String(describing: salary))
        """
    }
    
    // Custom init (Constructor) class with default values
    convenience init(name: String? = nil, surname: String? = nil, age: Date? = nil, email: String? = nil, type: TeacherType? = nil, salary: Salary? = nil) {
        self.init()
        
        // Always init all properties
        self.name = name
        self.surname = surname
        self.age = age
        self.email = email
        self.type = type
        self.salary = salary
    }
}

// Class Subject
public class Subject: CustomStringConvertible {
    //Properties whit optional '?' value
    var name: String?
    var year: Date?
    var teachers: [Teacher]?
    var students: [Student]?
    
    // Use description var of CustomStringConvertible
    // to print this class with custom String format
    public var description: String {
        // With """ we can print a multiline String
        return """
        Subject:
        name: \(String(describing: name))
        year: \(String(describing: year))
        teachers: \(String(describing: teachers))
        students: \(String(describing: students))
        """
    }
    
    // Custom init (Constructor) class with default values
    convenience init(name: String? = nil, year: Date? = nil, teachers: [Teacher]? = nil, students: [Student]? = nil) {
        self.init()
        
        // Always init all properties
        self.name = name
        self.year = year
        self.teachers = teachers
        self.students = students
    }
}

/************** DEFAULT DATA **************/
// Create list of Students

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
let students: [Student] = [Student(name: "Óliver",
                                   age: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                   month: 5)),
                                   email: "oliver@student.com"),
                           Student(name: "Ángel",
                                   age: Calendar.current.date(from: DateComponents(year: 2013,
                                                                                   month: 9)),
                                   email: "angel@student.com"),
                           Student(name: "Sara",
                                   age: Calendar.current.date(from: DateComponents(year: 1984,
                                                                                   month: 9)),
                                   email: "sara@student.com"),
                           Student(name: "Eduardo",
                                   age: Calendar.current.date(from: DateComponents(year: 1956,
                                                                                   month: 12)),
                                   email: "eduardo@student.com"),
                           Student(name: "María",
                                   age: Calendar.current.date(from: DateComponents(year: 1956,
                                                                                   month: 4)),
                                   email: "maria@student.com"),
                           Student(name: "Miguel",
                                   age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                   month: 6)),
                                   email: "miguel@student.com"),
                           Student(name: "Lucía",
                                   age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                   month: 2)),
                                   email: "lucia@student.com")]

// Create list of Teachers

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
// With .extern or .senior(amount) we represent the Enum value for this properties.
let teachers: [Teacher] = [Teacher(name: "David",
                                   age: Calendar.current.date(from: DateComponents(year: 1985,
                                                                                   month: 4)),
                                   email: "david@teacher.com",
                                   type: .extern,
                                   salary: .senior(amount: 50.0)),
                           Teacher(name: "Jaime",
                                   age: Calendar.current.date(from: DateComponents(year: 1974,
                                                                                   month: 6)),
                                   email: "jaime@teacher.com",
                                   type: .intern,
                                   salary: .medium(amount: 40.0)),
                           Teacher(name: "Pedro",
                                   age: Calendar.current.date(from: DateComponents(year: 1979,
                                                                                   month: 9)),
                                   email: "pedro@teacher.com",
                                   type: .intern,
                                   salary: .senior(amount: 50.0)),
                           Teacher(name: "Daniel",
                                   age: Calendar.current.date(from: DateComponents(year: 1981,
                                                                                   month: 2)),
                                   email: "daniel@teacher.com",
                                   type: .intern,
                                   salary: .senior(amount: 50.0)),
                           Teacher(name: "Laura",
                                   age: Calendar.current.date(from: DateComponents(year: 1980,
                                                                                   month: 10)),
                                   email: "laura@teacher.com",
                                   type: .extern,
                                   salary: .junior(amount: 20.0))]

// Create list of Subjects
// Use a list.filter for get different values for each subject

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
let subjects: [Subject] = [Subject(name: "Kotlin",
                                   year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                    month: 9)),
                                   teachers: teachers.filter{$0.name?.contains("u") ?? false},
                                   students: students.filter{$0.name?.contains("a") ?? false}),
                           Subject(name: "Swift",
                                   year: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                    month: 3)),
                                   teachers: teachers.filter{$0.name?.contains("o") ?? false},
                                   students: students.filter{$0.name?.contains("e") ?? false}),
                           Subject(name: "Dart",
                                   year: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                    month: 4)),
                                   teachers: teachers.filter{$0.name?.contains("i") ?? false},
                                   students: students.filter{$0.name?.contains("i") ?? false}),
                           Subject(name: "Python",
                                   year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                    month: 10)),
                                   teachers: teachers.filter{$0.name?.contains("e") ?? false},
                                   students: students.filter{$0.name?.contains("o") ?? false}),
                           Subject(name: "JavaScript",
                                   year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                    month: 9)),
                                   teachers: teachers.filter{$0.name?.contains("a") ?? false},
                                   students: students.filter{$0.name?.contains("u") ?? false})]


/************** TASKS **************/
// Task 1:
// Students Name
// Students subjects count
// Student subject name
print("************** TASK 1 **************")
students.forEach{ student in
    // Get only valid names, not nil
    guard let studentsName = student.name else {
        return
    }
    // Print student name
    print("Student name: \(studentsName)")
    
    // Filter subjects with students names
    // $0 is each subject
    let studentsSubjects = subjects.filter { $0.students?.contains( where: { studentsSubject in
        guard let studentsSubjectName = studentsSubject.name else{
            // If name is nil return false because no students found
            return false
        }
        
        // Compare actual subject student name with student name
        // return true if name are same
        return studentsSubjectName.compare(studentsName) == .orderedSame
    // If subject students list is nil, return false because
    // no students found
    }) ?? false}
    
    // Print result data
    print("Student subjects count: \(studentsSubjects.count)")
    print("Student subjects names: \(studentsSubjects.compactMap {$0.name})")
    print()
}


// Task 2:
// Students in more that one Subject

// Use compactMap to iterate over students data and discard nil results
let studentsSeveralSubjects: [String] = students.compactMap { student in
    // Filter subjects data if subject student list contains this Student
    let studentSubjects = subjects.filter { $0.students?.contains( where: { $0.name == student.name }) ?? false }
    
    // If this Student have more than one subject return it or nil
    return (studentSubjects.count > 1 ? student.name:nil)
}

// Print result data
print("************** TASK 2 **************")
print("Student several subjects count: \(studentsSeveralSubjects.count)")
print("Student several subjects names: \(studentsSeveralSubjects)")
print()


// Task 3:
// Teacher in more that one Subject

// Use compactMap to iterate over teachers data and discard nil results
let teachersSeveralSubjects: [String] = teachers.compactMap { teacher in
    // Filter subjects data if subject teachers list contains this Teacher
    let teacherSubjects = subjects.filter { $0.teachers?.contains( where: { $0.name == teacher.name }) ?? false }
    
    // If this Teacher have more than one subject return it or nil
    return (teacherSubjects.count > 1 ? teacher.name:nil)
}

// Print result data
print("************** TASK 3 **************")
print("Teachers several subjects count: \(teachersSeveralSubjects.count)")
print("Teachers several subjects names: \(teachersSeveralSubjects)")
print()


// Task 4:
// Print:
// Teachers intern count
// Teachers intern names
// Teachers extern count
// Teachers extern names

// Filter teachers intern type and extern type
let teachersIntern = teachers.filter{ $0.type == .intern }
let teachersExtern = teachers.filter{ $0.type == .extern }

// Print result data
print("************** TASK 4 **************")
print("Teachers intern count: \(teachersIntern.count)")
print("Teachers intern names: \(teachersIntern.compactMap{ $0.name })")
print()
print("Teachers extern count: \(teachersExtern.count)")
print("Teachers extern names: \(teachersExtern.compactMap{ $0.name })")
print()


// Task 4.1:
// Print differently:
// Teachers intern count
// Teachers intern names
// Teachers extern count
// Teachers extern names
var teachersIntern2: [Teacher] = []
var teachersExtern2: [Teacher] = []

// We can use switch case with ? operator because teacher.type is optional
teachers.forEach{ teacher in
    switch teacher.type {
        case .intern?:
            teachersIntern2.append(teacher)
        
        case .extern?:
            teachersExtern2.append(teacher)
        
        case .none:
            break
    }
}

// Print result data
print("************** TASK 4.1 **************")
print("Teachers intern count: \(teachersIntern.count)")
print("Teachers intern names: \(teachersIntern.compactMap{ $0.name })")
print()
print("Teachers extern count: \(teachersExtern.count)")
print("Teachers extern names: \(teachersExtern.compactMap{ $0.name })")
print()


// Task 5:
// Students sorted by age
// Teachers sorted by age
let studentsSorted = students.sorted { age, otherAge in
    guard let age1 = age.age,
          let age2 = otherAge.age else {
        return false
    }
    
    return age1.compare(age2) == .orderedAscending
}

let teachersSorted = teachers.sorted { age, otherAge in
    guard let age1 = age.age,
        let age2 = otherAge.age else {
            return false
    }
    
    return age1.compare(age2) == .orderedAscending
}

// Print result data
print("************** TASK 5 **************")
print("Student age sorted: \(studentsSorted.compactMap{ $0.name })")
print()
print("Teachers age sorted: \(teachersSorted.compactMap{ $0.name })")
print()


// Task 6:
// Subjects sorted by date
let subjectsSorted = subjects.sorted { actual, next in
    guard let actualYear = actual.year,
          let nextYear = next.year else {
        return true
    }
    
    return actualYear.compare(nextYear) == .orderedAscending
}

// Print result data
print("************** TASK 6 **************")
print("Subjects date sorted: \(subjectsSorted.compactMap{ $0.name })")
print()


// Task 7:
// Subjects names and formatted date 'Martes 02 de abril de 2019'
let subjectDateFormatted = DateFormatter()
subjectDateFormatted.locale = Locale(identifier: "es_ES")
subjectDateFormatted.dateFormat = "eeee dd 'de' MMMM 'de' yyyy"

print("************** TASK 7 **************")
subjects.forEach{ subject in
    guard let subjectName = subject.name,
          let subjectDate = subject.year else {
        return
    }
    
    // Print result data
    print("Subject name: \(subjectName)")
    print("Subject date: \(subjectDateFormatted.string(from: subjectDate))")
    print()
}


// Task 8:
// Print each teacher name, salary level and amount
print("************** TASK 8 **************")
teachers.forEach{ teacher in
    guard let teacherSalary = teacher.salary,
          let teacherName = teacher.name else {
        return
    }
    
    print("Teacher name: \(teacherName)")
    print("Teacher level: \(teacherSalary)")
    print("Teacher salary: \(teacherSalary.amount)")
    print()
}


// Task 9:
// Print each subject name and formatted subject date
print("************** TASK 9 **************")
subjects.forEach{ subject in
    guard let subjectName = subject.name,
        let subjectDate = subject.year else {
            return
    }
    
    // Print result data
    print("Subject name: \(subjectName)")
    print("Subject date: \(subjectDate.toFormattedString())")
    print()
}


// Task 10:
// Print each student data, each teacher data and each subject data
print("************** TASK 10 **************")
print("Students data: \(students)")
print()
print("Teachers data: \(teachers)")
print()
print("Subjects data: \(subjects)")
print()


// Task 11:
// Calculate Students and Teachers age and
// print name - age
print("************** TASK 11 **************")
students.forEach{ student in
    guard let studentAge = student.age,
          let studentName = student.name else {
        return
    }
    
    print("Student name: \(studentName)")
    if let age = Calendar.current.dateComponents([.year],
                                                 from: studentAge,
                                                 to: Date()).year {
        print("Student age: \(age)")
    }
    print()
}

teachers.forEach{ teacher in
    guard let teacherAge = teacher.age,
          let teacherName = teacher.name else {
        return
    }

    print("Teacher name: \(teacherName)")
    if let age = Calendar.current.dateComponents([.year],
                                                 from: teacherAge,
                                                 to: Date()).year {
        print("Teacher age: \(age)")
    }
    print()
}
