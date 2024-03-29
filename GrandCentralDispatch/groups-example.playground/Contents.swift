import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true // позволяет плейграунду все время производить вычисления в зависимости от того закончил ли свою работу основной поток или нет

let queue = DispatchQueue(label: "wtildestar", attributes: .concurrent)
let group = DispatchGroup()

queue.async(group: group) {
    for i in 0...10 {
        if i == 10 {
            print(i)
        }
    }
}

queue.async(group: group) {
    for i in 0...20 {
        if i == 20 {
            print(i)
        }
    }
}

group.notify(queue: .main) {
    print("Все завершено в группе: group")
}

let secondGroup = DispatchGroup()
secondGroup.enter()
queue.async(group: group) {
    for i in 0...30 {
        if i == 30 {
            print(i)
            sleep(2)
            secondGroup.leave()
        }
    }
}

let result = secondGroup.wait(timeout: .now() + 1)
print(result)

secondGroup.notify(queue: .main) {
    print("Все завершено в группе: secondGroup")
}

print("Принт должен быть выше последнего")

secondGroup.wait() // выполнение дальше не пойдет если не выполнится secondGroup
