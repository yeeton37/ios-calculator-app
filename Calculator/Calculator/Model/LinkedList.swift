//
//  Node.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var front: Node<T>?
    var rear: Node<T>?
    
    init(front: Node<T>? = nil) {
        self.front = front
        self.rear = front
    }
    
    func isEmpty() -> Bool {
        return front == nil
    }
    
    mutating func append(_ data: T?) {
        if isEmpty() {
            front = Node(data: data)
            rear = front
            return
        }
        rear?.next = Node(data: data)
        rear = rear?.next
    }
    
    mutating func deQueue() -> T? {
        let data = front?.data
        
        if isEmpty() {
            return nil
        }
        front = front?.next
        return data
    }
    
    mutating func removeAll() {
        front = nil
    }
    
    mutating func returnList() -> Array<T> {
        var queue: Array<T> = []
        var node = front
        
        while node?.data != nil {
            guard let data = node?.data else {
                return []
            }
            queue.append(data)
            node = node?.next
        }
        return queue
    }
}
