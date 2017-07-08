//
//  LinkedList.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 6/25/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation

public class Node<T>
{
    public var value: T?
    public var next: Node?
    
    public init(withValue: T)
    {
        value = withValue
    }
}


public class LinkedList<T: Equatable>
{
    public var root: Node<T>?
    
    public func add(value: T)
    {
        guard let rootNode = root else
        {
            root = Node(withValue: value)
            return
        }
        
        rootNode.next = Node(withValue: value)
    }
    
    public func remove(withValue value: T)
    {
        if let rootNode = root
        {
            guard rootNode.value != value else
            {
                root = rootNode.next
                return
            }
        }
        else { return }
        
        var currentNode = root
        var previousNode: Node<T>?
        
        while let node = currentNode
        {
            if let nodeValue = node.value, nodeValue == value, let prev = previousNode
            {
                prev.next = node.next
                return
            }
            
            previousNode = node
            currentNode = node.next
        }
    }

    
    public func find(withValue value: T) -> Node<T>?
    {
        var currentNode = root
        
        while let node = currentNode
        {
            if let nodeValue = node.value, nodeValue == value
            {
                return node
            }
            
            currentNode = node.next
        }
        
        return nil
    }
    
    public func contains(value: T) -> Bool
    {
        if find(withValue: value) != nil { return true }
        return false
    }
}
