//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by yeton on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var queue = LinkedList<T>()
    
    mutating func enqueue(data: T) {
        queue.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}
