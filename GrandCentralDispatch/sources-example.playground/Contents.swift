import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// разберем как работает DispatchSource c низкоуровневыми процессами
let queue = DispatchQueue(label: "wtildestar.sources", attributes: .concurrent)

// создаем таймер
let timer = DispatchSource.makeTimerSource(queue: queue)

// настраиваем таймер
// leeway запаздывание таймера
timer.schedule(deadline: .now(), repeating: .seconds(2), leeway: .milliseconds(300))
timer.setEventHandler {
    print("Hello, world")
}

// создаем cancel block
timer.setCancelHandler {
    print("timer is canceled")
}

// запускаем таймер
timer.resume()


