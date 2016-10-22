protocol Repeater {
    func start(closureToRepeat: (() -> ())?)
    func stop()
}

struct DefaultRepeater: Repeater {
    func start(closureToRepeat: (() -> ())?) {
        // TODO
    }

    func stop() {
        // TODO
    }
}
