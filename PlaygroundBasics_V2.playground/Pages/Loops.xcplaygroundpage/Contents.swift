import Foundation

/*:
# Управление потоком

В этом разределе ты узнаешь:
- что такое управление потоком
- для чего нужны циклы

  `while` _condition_ {\
    _statements_\
   }

  `repeat` {\
    _statements_\
    } _while_ condition


  `for` _value_ `in` _range_ {\
    _statements_\
    }

- что такое условные инструкции
- какие бывают операторы передачи управления
- как проверить доступность API

 Внимательно изучи:
- [Управление потоком](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Цикл For in](https://www.avanderlee.com/swift/loops-swift/)
- [Циклы for, while, repeat](https://www.avanderlee.com/swift/loops-swift/)
- [For each](https://developer.apple.com/documentation/swift/array/1689783-foreach)
- [Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html)
- [Conditional Statements](https://learnappmaking.com/swift-conditionals-if-statement-how-to/)
- [Доступность API](https://www.hackingwithswift.com/example-code/language/how-to-use-available-to-check-for-api-availability)

Закрепи пройденный материал:

#### Задание 1
 - Обьяви переменную `n` и проинициализируй ее  любым целочисленными значением.
*/
// Добавь код сюда:
var n = 10
/*:
 - Напиши код, который выведет в консоль фразу _I like Swift!_ `n` раз.
 
 - Note: 👆 _Для решения используй циклы_ `for` _или_ `while`
*/
/*:
 
 - Example: 😉
_Input:_\
var n = 3\
_Output:_\
 I like Swift!\
 I like Swift!\
 I like Swift!
 */

// Добавь код сюда:
var i = n
while i > 0 {
    print("I like Swift!")
    i = i - 1
}
/*:
---
#### Задание 2
 
 - Выведи в консоль первые `n` квадратов чисел (_квадрат - произведение числа на себя, например 4 = 2 * 2_).
 
 - Example: 😉
_Input:_\
n = 5\
 _Output_:\
 1\
 4\
 9\
 16\
 25
*/
// Добавь код сюда:
for i in 1...n {
    print(i*i)
}
/*:
 - Выведи в консоль степени числа `2`, которые меньше или равны `n`.
 
 - Example: 😉
 _Input:_\
n = 100\
 _Output:_\
 2\
 4\
 8\
 16\
 32\
 64
 */
 // Добавь код сюда:
var exponentialNumber = 2
while exponentialNumber < n {
    print(exponentialNumber)
    exponentialNumber *= 2
}
/*:
 - Нарисуй в консоли квадрат из `n` на `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐
 
 */
// Добавь код сюда:
let star = "\u{2B50}"
var cycle1 = 0
var cycle2 = 0
while cycle1 < n {
//    print("")
    cycle2 = 0
    while cycle2 < n {
        print(star, terminator: "")
        cycle2 += 1
    }
    print("")
    cycle1 += 1
}
/*:
 - Нарисуй в консоли треугольник из `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐\
 ⭐⭐\
 ⭐⭐⭐\
 ⭐⭐⭐⭐
 */
// Добавь код сюда:
cycle1 = 0
cycle2 = 0
while cycle1 < n {
    cycle2 = 0
    while cycle2 < cycle1 + 1 {
        print(star, terminator: "")
        cycle2 += 1
    }
      print("")
    cycle1 += 1
}

/*:
---
#### Задание 3:
 - Создай массив из 20-30 значений любого типа.
 - Сделай линейную сортировку (linear sort).
 - Сделайте сортировку пузырьком (bubble sort).
 - Сделайте быструю сортировку  (quick sort).
*/
// Добавь код сюда:
var someArray = [4, 15, 20, 67, 12, 54, 78, 14, 25, 38, 101, 77, 19, 23, 51, 99, 90, 1, 11, 61, 12, 39, 40, 42]

// linear sort
for index in 1..<someArray.count {
    var jIndex = index - 1
    let value = someArray[index]
    
    while jIndex >= 0 && value < someArray[jIndex] {
        someArray[jIndex + 1] = someArray[jIndex]
        jIndex -= 1
    }
    someArray[jIndex + 1] = value
}
print(someArray)

someArray = [4, 15, 20, 67, 12, 54, 78, 14, 25, 38, 101, 77, 19, 23, 51, 99, 90, 1, 11, 61, 12, 39, 40, 42]

// bubble sort
for i in 0..<someArray.count {
    let index = (someArray.count - 1) - i
    for j in 0..<index {
        let number = someArray[j]
        let nextNumber = someArray[j + 1]
        if number > nextNumber {
            someArray[j] = nextNumber
            someArray[j + 1] = number
        }
    }
}
print(someArray)

someArray = [4, 15, 20, 67, 12, 54, 78, 14, 25, 38, 101, 77, 19, 23, 51, 99, 90, 1, 11, 61, 12, 39, 40, 42]

// quick sort
func quickSort(_ list: [Int]) -> [Int] {
    if list.count <= 1 {
        return list
    }
    
    let middleValue = list[list.count/2];

    let down = list.filter{$0 < middleValue}
    let equel = list.filter{$0 ==  middleValue}
    let up = list.filter{$0 >  middleValue}
    
    let returnValue = quickSort(down) + equel + quickSort(up)
    
    return returnValue
}

let sorted = quickSort(someArray)

print(sorted)
/*:
---
### Продвинутый уровень:

#### Задание 4:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:


/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым словом.
 - Выведи в консоль True, если строка является изограммой и false, если нет
*/
/*:
- Note: 👆 _Изограмма - это слово или фраза, в которой нет повторяющихся букв_\
*/
/*:
- Example: 😉\
_Input:_\
let word ="Password"\
_Output:_\
false
*/
/*:
- Example: 😉\
_Input:_\
let word ="Algorism"\
_Output:_\
 True
*/
// Добавь код сюда:

/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым значением.
 - Повтори в новой строке каждую букву исходной по 3 раза.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let word ="Hello"\
_Output:_\
 "hhheeellllllooo"
*/
// Добавь код сюда:


/*:
---
#### Задание 6:
 - Обьяви массив, состояющий из строк и целых чисел.
 - Удали из массива все строки.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let array =[1, 2, "a", "b"] \
_Output:_\
 [1, 2]
*/
// Добавь код сюда:

//: [Назад: Коллекции. Массивы и множества](@previous)  |  Страница 5  |  [Вперед:  Функции](@next)
