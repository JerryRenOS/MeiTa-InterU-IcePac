//
//  IIS.swift
//  Circprogresularity
//
//  Created by Jerry Ren on 4/23/21.
//

import Foundation

class DispatchedTimer {
    private let timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()
    internal var eventHandler: (() -> Void)?

    private enum State {
        case suspended
        case resumed
    }
    private var state: State = .suspended

    deinit {
        timer.setEventHandler {}
        timer.cancel()
        resume()
        eventHandler = nil
    }

    internal func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }

    internal func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}
