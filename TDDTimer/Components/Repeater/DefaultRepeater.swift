protocol Repeater {
    func start(timeInterval: Float, closureToRepeat: (() -> ())?)
    func stop()
}

struct DefaultRepeater: Repeater {
    func start(timeInterval: Float, closureToRepeat: (() -> ())?) {
        // TODO
    }

    func stop() {
        // TODO
    }
}
