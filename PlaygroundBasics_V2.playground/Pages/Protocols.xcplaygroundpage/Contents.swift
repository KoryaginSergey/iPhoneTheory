import Foundation
/*:
# Протоколы

В этом разделе ты узнаешь:
- что такое протокол
- какой у него синтакисис
- что значит фраза " класс (структура) удовлетворяет протокол".

Внимательно изучи:
- [Протокол](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви протокол _Employee_. Он должен содержать одно свойство _hours_ типа `Int` и один метод _work()_ без параметров и возвращаемого значения.
 */
// Добавь код сюда:
protocol Employee {
    var hours: Int { get set }
    
    func work()
}
/*:
 - Обьяви два класса _Painter_ и _Doctor_.
 - Укажи, что оба этих класса удовлетворяют протоколу.
 - Реализуй протокол в каждом из классов.
 */
// Добавь код сюда:
class Painter: Employee {
    var hours: Int = 0
    
    func work() {
        print("I'm drawing")
    }
}
class Doctor: Employee {
    var hours: Int = 0
    
    func work() {
        print("I'm heal people")
    }
}
/*:
 - Создай экземпляры каждого из классов.
 - Вызови метод _work_ для каждого из них.
 */
var painter = Painter()
painter.work()
var doctor = Doctor()
doctor.work()
/*:
---
#### Задание 2
 - Реализуй иерархию классов, представленную на рисунке:
 ![Telephone](Playground.Telephone.Protocols.png)
 - Note: 👆 _Обрати внимание, что классы iOS, androidOS  и windowsOS удовлетворяют протоколу Internetable_
 */
// Добавь код сюда:
protocol Telephone {
    func makeCall()
    func hangUp()
}
protocol Landline: Telephone {}

protocol Rotaryable {
    func rotaryInput()
}
protocol Cellular: Telephone {
    func sendSMS()
}
protocol PushButtonable {
    func buttonInput()
}
protocol Touchable {
    func touchInput()
}
protocol Internetable {
    func accessInternet()
}
class Rotary: Landline {
    func makeCall() {}
    func hangUp() {}
}
class PushButton: Landline, PushButtonable {
    func buttonInput() {}
    func makeCall() {}
    func hangUp() {}
}
class NonSmart: Cellular, PushButtonable {
    func sendSMS() {}
    func buttonInput() {}
    func makeCall() {}
    func hangUp() {}
}
class IPhone: Cellular, Touchable, Internetable {
    let iOS = true
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}
class AndroidPhone: Cellular, Touchable, Internetable {
    let androidOS = true
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}
class WindowsPhone: Cellular, Touchable, Internetable {
    let windowsOS = true
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}

//: [Назад: Структуры и классы](@previous)  |  Страница 11  |  [Вперед: Делегаты](@next)
