import Foundation
/*:
# Паттерны проектирования

В этом разделе ты узнаешь:
- что такое паттерны, какие проблемы они решают
- какие бывают их виды и как их реализовать на языке Swift

Паттерн проектирования — это часто встречающееся решение определённой проблемы при проектировании архитектуры программ.
В отличие от готовых функций или библиотек, паттерн нельзя просто взять и скопировать в программу. Паттерн представляет собой не какой-то конкретный код, а общую концепцию решения той или иной проблемы, которую нужно будет ещё подстроить под нужды каждой программы.

Паттерны отличаются по уровню сложности, детализации и охвата проектируемой системы.

Самые низкоуровневые и простые паттерны — идиомы. Они не универсальны, поскольку применимы только в рамках одного языка программирования. Самые универсальные — архитектурные паттерны, которые можно реализовать практически на любом языке. Они нужны для проектирования всей программы, а не отдельных её элементов.
Кроме того, паттерны отличаются и предназначением.  Можно выделить три основные группы:
- порождающие (фабричный метод, абстрактная фабрика, строитель, прототип, одиночка) - беспокоятся о гибком создании объектов без внесения в программу лишних зависимостей
- стуктурные (адаптер, мост, компоновщик, декоратор, фасад, легковес, заместитель) - показывают различные способы построения связей между объектами
- поведенческие (цепочка обязанностей, команда, итератор, посредник, снимок, наблюдатель, состояние, стратегия, шаблонный метод, посетитель) - заботятся об эффективной коммуникации между объектами.

 Внимательно изучи некоторые виды паттернов:
- [Фабричный метод](https://refactoring.guru/ru/design-patterns/factory-method)
- [Абстрактная фабрика](https://refactoring.guru/ru/design-patterns/abstract-factory)
- [Строитель](https://refactoring.guru/ru/design-patterns/builder)
- [Прототип](https://refactoring.guru/ru/design-patterns/prototype)
- [Декоратор](https://refactoring.guru/ru/design-patterns/decorator)
- [Адаптер](https://refactoring.guru/ru/design-patterns/adapter)
- [Мост](https://refactoring.guru/ru/design-patterns/bridge)
- [Цепочка обязанностей](https://refactoring.guru/ru/design-patterns/chain-of-responsibility)
- [Команда](https://refactoring.guru/ru/design-patterns/command)

Закрепи пройденный материал:
#### Задание 1
- Предположим, твой модуль отвечает за производство пиццы. Напиши код, который будет реализовывать обьект создания пиццы во время выполнения программы. Например, если пользователь хочет пиццу с сыром, то твой модуль создаст обьект CheesePizza,  а если пользователь хочет пиццу с пепперони - обьект PepperoniPizza
 - Note: 👆 _Используй фабричный метод_
*/

// Добавь код сюда:

protocol Pizza {
    var ingredient: String {get}
    var size: Int {get}
    func pizzaDescription() -> String
}
class CheesePizza: Pizza {
    let ingredient: String = "cheese"
    let size: Int
    init(size: Int) {
        self.size = size
    }
    func pizzaDescription() -> String {
        return "\(size)cm \(ingredient) pizza"
    }
}
class PepperoniPizza: Pizza {
    let ingredient: String = "pepperoni"
    let size: Int
    init(size: Int) {
        self.size = size
    }
    func pizzaDescription() -> String {
        return "\(size)cm \(ingredient) pizza"
    }
}
protocol Pizzeria {
    func createSmallPizza() -> Pizza
    func createBigPizza() -> Pizza
}

class CheesePizzeria: Pizzeria {
    func createSmallPizza() -> Pizza {
        return CheesePizza(size: 30)
    }
    func createBigPizza() -> Pizza {
        return CheesePizza(size: 50)
    }
}
class PepperPizzeria: Pizzeria {
    func createSmallPizza() -> Pizza {
        return PepperoniPizza(size: 30)
    }
    func createBigPizza() -> Pizza {
        return PepperoniPizza(size: 50)
    }
}
let cheesePizzeria: Pizzeria = CheesePizzeria()
let pepperoniPizzeria: Pizzeria = PepperPizzeria()

let smallCheesePizza: Pizza = cheesePizzeria.createSmallPizza()
let bigPepperoniPizza: Pizza = pepperoniPizzeria.createBigPizza()

print(smallCheesePizza.pizzaDescription())

/*:
---
#### Задание 2
- Предположим, твой модуль связан с продажей средств передвижения.  От типа (велосипед, автомобиль,  электоро - самокат, скутер, мотоцикл) конкретного средства зависит его отображение. Помимо этого,  все средства передвижения различаются состоянием (новое и б/y), типом потребляемого топлива (не потребляет, бензин, электричество) и максимальным количеством людей, которые могут перевести. Напиши код, который будет создавать объекты средств передвижения  с учетом его характеристик.
 - Note: 👆 _Используй абстрактую фабрику_
*/

// Добавь код сюда:
protocol Vehicle {
    var condition: String {get}
    var fuel: String {get}
    var maxPeople: Int {get}
    func printDescription()
}
class Bicycle: Vehicle {
    var condition: String = "new"
    var fuel: String = "none"
    var maxPeople: Int = 1
    func printDescription() {
        print("\(condition) bicycle for \(maxPeople) person. Type fuel: \(fuel)")
    }
}
class Car: Vehicle {
    var condition: String = "new"
    var fuel: String = "petrol"
    var maxPeople: Int = 5
    func printDescription() {
        print("\(condition) car for \(maxPeople) person. Type fuel: \(fuel)")
    }
}
class ElectricScooter: Vehicle {
    var condition: String = "new"
    var fuel: String = "electro"
    var maxPeople: Int = 1
    func printDescription() {
        print("\(condition) electric scooter for \(maxPeople) person. Type fuel: \(fuel)")
    }
}
class Scooter: Vehicle {
    var condition: String = "new"
    var fuel: String = "petrol"
    var maxPeople: Int = 2
    func printDescription() {
        print("\(condition) scooter for \(maxPeople) person. Type fuel: \(fuel)")
    }
}
class Motorcycle: Vehicle {
    var condition: String = "new"
    var fuel: String = "petrol"
    var maxPeople: Int = 2
    func printDescription() {
        print("\(condition) motorcycle for \(maxPeople) person. Type fuel: \(fuel)")
    }
}
class UsedBicycle: Bicycle {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedCar: Car {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedElectricScooter: ElectricScooter {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedScooter: Scooter {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedMotorcycle: Motorcycle {
    override init() {
        super.init()
        self.condition = "used"
    }
}
protocol Dealer {
    func createBicycle() -> Vehicle
    func createCar() -> Vehicle
    func createElectricScooter() -> Vehicle
    func createScooter() -> Vehicle
    func createMotorcycle() -> Vehicle
}
class ShowRoom: Dealer {
    func createBicycle() -> Vehicle {
        return Bicycle()
    }
    func createCar() -> Vehicle {
        return Car()
    }
    func createElectricScooter() -> Vehicle {
        return ElectricScooter()
    }
    func createScooter() -> Vehicle {
        return Scooter()
    }
    func createMotorcycle() -> Vehicle {
        return Motorcycle()
    }
}
class Market: Dealer {
    func createBicycle() -> Vehicle {
        return UsedBicycle()
    }
    func createCar() -> Vehicle {
        return UsedCar()
    }
    func createElectricScooter() -> Vehicle {
        return UsedElectricScooter()
    }
    func createScooter() -> Vehicle {
        return UsedScooter()
    }
    func createMotorcycle() -> Vehicle {
        return UsedMotorcycle()
    }
}

let showRoom: Dealer = ShowRoom()
let market: Dealer = Market()

showRoom.createBicycle().printDescription()
market.createBicycle().printDescription()
showRoom.createScooter().printDescription()
market.createElectricScooter().printDescription()

/*:
---
#### Задание 3
- Предположим, твой модуль связан с созданием автомобиля. Автомобиль - это очень сложный обьект, так как машины  могут отличаться типом двигателя, количеством сидений, могут иметь или не иметь GPS и системы навигаций, кроме того автомобили могут быть городскими, спортивными и внедорожниками. Реализуй систему, которая будет  поэтапно конструировать  автомобиль (устанавливать  сидения,  двигатель, красить кузов  и так далее).
 - Note: 👆 _Используй паттерн строитель_
*/

// Добавь код сюда:
class NewCar {
    var seats: Int?
    var engine: Float?
    var gps: Bool?
    var model: String?
    func printResult() {
        print("\(model!) for \(seats!) person with engine \(engine!)")
    }
}
protocol Builder {
    func reset()
    func setSeats(seats: Int)
    func setEngine(value: Float)
    func setGPS(gps: Bool)
    func setName(name: String)
    func getResult() -> NewCar
}
class CarBuilder: Builder {
    func reset() {
        newCar.seats = nil
        newCar.engine = nil
        newCar.gps = nil
        newCar.model = nil
    }
    func setSeats(seats: Int) {
        newCar.seats = seats
    }
    func setEngine(value: Float) {
        newCar.engine = value
    }
    func setGPS(gps: Bool) {
        newCar.gps = gps
    }
    func setName(name: String) {
        newCar.model = name
    }
    func getResult() -> NewCar {
        return self.newCar
    }
    private let newCar = NewCar()
  
}
class Director {
   static func createMinivan(builder: Builder) -> NewCar {
        builder.reset()
        builder.setName(name: "Minivan")
        builder.setSeats(seats: 8)
        builder.setEngine(value: 2.0)
        builder.setGPS(gps: true)
        return builder.getResult()
    }
   static func createCar(builder: Builder) -> NewCar {
        builder.reset()
        builder.setName(name: "Car")
        builder.setSeats(seats: 2)
        builder.setEngine(value: 3.0)
        builder.setGPS(gps: true)
        return builder.getResult()
    }
}

var builder = CarBuilder()
Director.createCar(builder: builder).printResult()
Director.createMinivan(builder: builder).printResult()

/*:
---
#### Задание 4
- Предположим, твой модуль связан с  работой кофейни. При добавлении нового инредиента к кофе, например, взбитые сливки, необходимо рассчитать новую стоимость продукта и получить новое описание состава напитка. Представь это в виде кода.
 - Note: 👆 _Используй паттерн декоратор_
*/

// Добавь код сюда:

/*:
---
#### Задание 5
- Предположим, у тебя есть некий сервис, который выводит в консоль текущую дату, но, например, на арабском  языке, который не понимает твой клиент. Сделай так, чтобы твой клиент мог использовать сервис вывода даты в консоль на понятном ему языке.
 - Note: 👆 _Используй паттерн адаптер_
*/

// Добавь код сюда:

/*:
---
#### Задание 6
- Предположим, твой модуль представляет собой некий конвеер, который обрабатывает  различные предметы, которые на него попадают. На данный момент есть возможность переработать следующие типы предметов: пищевые отходы, электронику, бумагу и стекло. Для каждого типа предмета в системе должен быть предусмотрен свой обработчик, который принимает на вход предмет, сканирует его и определяет возможность переработки. Если этот предмет того типа, который он "умеет" обрабатывать, то он выполняет обработку, если нет, то передает следующему обработчику. Если же никто из обработчиков не смог переработать предмет, то предмет должен в конечном итоге попасть "в руки"  обьекту "Склад", который дальше уже не передает предмет, а ставит на нем специальный маркер.
 - Note: 👆 _Используй паттерн цепочка обязанностей_
*/

// Добавь код сюда:


/*:
---
#### Задание 7
 - Предположим, твой модуль представляет системное меню. Разработай систему, которая обрабатывает нажатия на пункты меню с учетом версии ПО.
 - Note: 👆 _Используй паттерн команда_
*/

// Добавь код сюда:

//: [Назад:  Универсальные шаблоны](@previous)  |  Страница 14] 



