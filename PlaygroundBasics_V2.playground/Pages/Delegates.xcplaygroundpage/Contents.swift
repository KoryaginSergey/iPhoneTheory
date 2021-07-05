import Foundation
import UIKit
/*:
 # Делегаты

 Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность экземпляру другого типа. Этот шаблон реализуется определением протокола, который инкапсулирует делегируемые полномочия, таким образом, что соответствующий протоколу тип (делегат) гарантировано получит функциональность, которая была ему делегирована. Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.
 */
/*:
 Более подробно ты можешь прочитать [тут.](https://docs.google.com/document/d/1ZRHiPgmIqsOQIihG8Ad0WPgyajWR2zKux-EKt0pYQwQ/edit?usp=sharing)
 */

/*:
 ---
 ## Задание 1
 
 Ты завел будильник и после того как он зазвонит, тебе надо его выключить. Напиши программный код. Схематически это выглядит так:\
  ![Delegate.Task1](Playground.Delegate.Task1.png)
 */

// Добавь код сюда:
class User {
    func startAlarm() {
        let alarmClock = AlarmClock()
        alarmClock.delegate = self
        alarmClock.turnOn()
    }
}
extension User : AlarmClockDelegate {
    func alarmDidRing() {
        print("The alarm clock rings. Turt it off")
    }
}
protocol AlarmClockDelegate: class {
    func alarmDidRing()
}

class AlarmClock {
    weak var delegate: AlarmClockDelegate?
    func turnOn() {
        print("Started the alarm")
        sleep(2)
        delegate?.alarmDidRing()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.delegate?.alarmDidRing()
//        }
    }
}

let user = User()
user.startAlarm()
/*:
---
## Задание 2

Ты решил сделать ремонт у себя в комнате и  нанял строителя. После того как строитель выполнит подготовительные работы, он должен позвонить тебе с определенным вопросом. Получив от тебя ответ на вопрос, строитель продолжит свою работу. Через некоторое время он позвонит тебе еще раз и сообщит, что закончил ремонт. Опиши эту ситуацию программно. Схематически это выглядит так:\
![Delegate.Task2](Playground.Delegate.Task2.png)
*/
// Добавь код сюда:
class CLient {
    let builder = Builder()
    func hireBuilder() {
        builder.delegate = self
        print("Hire a builder")
        builder.startedToWork()
    }
   private func chooseColor () {
    print("Choose paint? I want green.")
        builder.chooseColor(color: UIColor.green)
    }
}
extension CLient : BuilderDelegate {
    func callForCompletionWork() {
        print("Work is done")
    }
    func choisePaint() {
        self.chooseColor()
    }
    func continueWork() {
        print("Continue work.")
    }
}
protocol BuilderDelegate: class {
    func choisePaint()
    func continueWork()
    func callForCompletionWork()
}

class Builder {
    weak var delegate: BuilderDelegate?
    func startedToWork() {
        print("Builder started working")
        delegate?.choisePaint()
    }
    func chooseColor(color: UIColor) {
        delegate?.continueWork()
        delegate?.callForCompletionWork()
    }
}
let client = CLient()
client.hireBuilder()
//: [Назад: Протоколы](@previous)  |  Страница 12]  [Вперед:  Универсальные шаблоны](@next)
