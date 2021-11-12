//
//  Queue.swift
//  Calculator
//
//  Created by 고은 on 2021/11/09.
//

import Foundation

class CalculatorItemQueue<T: Equatable, CalculateItem> {
    var linkedList = LinkedList<T>()
    
    func enqueue(_ value: T) {
        linkedList.insert(value)
    }
    
    func dequeue() {
        if let firstElement = linkedList.head?.value {
            linkedList.delete(firstElement)
        }
    }
    
    func elements() -> [T] {
        linkedList.elements()
    }
}