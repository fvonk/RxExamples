import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"
print(str)

let elementsPerSecond = 1
let maxElements = 5
let replayedElements = 1
let replayDelay: TimeInterval = 3


let sourceObservable = Observable<Int>.create { observer in
    var value = 1
    let timer = DispatchSource.timer(interval: 1.0 / Double(elementsPerSecond), queue: .main) {
        if value <= maxElements {
            observer.onNext(value)
            value += 1
        }
    }
    return Disposables.create {
        timer.suspend()
    }
}


extension DispatchSource {
    static func timer(interval: Double, queue: DispatchQueue, block: () -> Void) -> Self {
        return DispatchSource(timer)
    }
}
