import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "wtildestar.semaphores", attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 0) // указываем кол-во потоков которые могут пройти через секцию
semaphore.signal()
// distantFuture - ждем пока не получим сигнал
queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 4)
    print("Block 1")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("Block 2")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 3")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 4")
    semaphore.signal()
}
