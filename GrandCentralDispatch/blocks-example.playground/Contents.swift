import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

// detached - оторван от контекста в котором исполняется
// т.е. если workItem будет находиться в другой очереди то его qos будет опускаться уровнем
let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("Performing workitem")
}

workItem.perform() // выполняет workItem напрямую
// autoreleaseFrequency - управление памятью
// target - переназначить очередь для объекта
let queue = DispatchQueue(label: "wtildestar", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 1, execute: workItem)

workItem.notify(queue: .main) {
    print("workItem is completed")
}

// проверяем отменен ли workItem
workItem.isCancelled
// отменяем
workItem.cancel()
workItem.isCancelled
