import Foundation
/*:
# Типы данных

В этом разделе ты узнаешь:
- что такое константы и переменные
- для чего нужны базовые оператор
- почему Swift считается строготипизированным языком программирования
- разберешься чем типы для целых чисел отчиличаются от типов для чисел с плавающей точкой
- что такое логический тип и как он представлен в Swift
- какие бывают строковые типы
- как делать преобразование типов
- что такое опциональны типы

Внимательно изучи:
- [Константы и переменные](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Простые типы данных](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Базовые операторы](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Строки и символы](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)
 - 

Закрепи пройденный материал:

#### Задание 1:
 - Объяви две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
 - Поменяй значения переменных местами.
 - Выведи получившиеся значения в консоль. При этом в каждом варианте выводимых данных текстом напиши, какую переменную ты выводишь.
*/

// Добавь код сюда:
var x = 12
var y: Int = 15

var z = x
x = y
y = z

print("Variable x = \(x)")
print("Variable y = \(y)")
/*:
---
### Задание 2:
 - Объяви три параметра. Первый из них должен быть константой типа `Float` с произвольным числовым значением, второй — пустой константой типа `Float`, третий — пустой переменной типа `Double`.
 - Установи новое произвольное значение всем параметрам, для которых эта операция возможна.
*/
// Добавь код сюда:
let parameter1: Float = 3.6
let parameter2: Float
var parameter3: Double

parameter2 = 4.6
parameter3 = 5.5456

/*:
---
#### Задание 3:
 - Объяви три пустые константы: одну типа `Int`, одну типа `Float` и одну типа `Double`.
 - Проинициализируй их следующими значениями: для `Int` значение 18, для `Float` — 16.4,  для `Double` — 5.7.
 - Найди сумму всех трех констант и запишите ее в переменную типа `Float`. Результат выведи в консоль.
*/
// Добавь код сюда:
let number1: Int
let number2: Float
let number3: Double

number1 = 18
number2 = 16.4
number3 = 5.7

let sum3: Float = Float(number1) + number2 + Float(number3)
print("sum3 = \(sum3)")
/*:
- Найди произведение всех трех констант и запиши его в переменную типа `Int`. Результат выведи в консоль.
 - Note: 👆 _Помни, что тебе необходимо получить результат с минимальной погрешностью._
*/
// Добавь код сюда:

let mult1: Double = Double(number1) * Double(number2) * Double(number3)
let mult2: Int = Int(mult1)
print("mult2 = \(mult2)")
/*:
- Найди остаток от деления константы типа `Float` на константу типа `Double` и запиши ее в переменную типа `Double`. Результат выведи в консоль.
*/
// Добавь код сюда:
let div: Double = Double(Int(number2) % Int(number3))

/*:
---
#### Задание 4:
 - Объяви переменную типа `String` и запиши в нее произвольный строковый литерал.
 - Объяви две переменные типа `Int` и запиши в них произвольные значения.
 - Одним выражением объедини в строковый литерал переменную типа `String` и сумму переменных типа `Int`, а результат запиши в новую константу.
 - Выведи в консоль результат.
 */
// Добавь код сюда:
var str4: String = "Hello"
var number4: Int = 6
var number5: Int = 8
var result: String = "\(str4) \(number4 + number5)"
print(result)
/*:
---
#### Задание 5:
 - Объяви две логические переменные. Значение первой должно быть равно _true_, второй — _false_.
 - Запиши в две константы результат использования их в качестве операндов для операторов логического `И` или `ИЛИ`.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
var log1: Bool = true
var log2: Bool = false

let log3 = log1 || log2
let log4 = log1 && log2

print(log3)
print(log4)


/*:
---
#### Задание 6:
 - Напиши при помощи строк свое имя, фамилию и дату рождения.
 - Собери эти строки в одну и выведи в консоль получившееся значение.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
let name = "Sergey Koryagin"
let dateOfBirth = "23.12.1983"

let result1 = "\(name) \(dateOfBirth)"
print(result1)

print(name, dateOfBirth)




/*:
---
## Продвинутый уровень:

#### Задание 7:
 - Создай 5 строк с названием стран.
 - Если в названии страны встречается буква А, выведи ее нзавание в консоль.
*/
// Добавь код сюда:

/*:
---
#### Задание 8:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

/*:
---
#### Задание 9:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

//: [Назад: Playground](@previous)  |  Страница 3  |  [Вперед: Коллекции. Массивы и множества](@next)
