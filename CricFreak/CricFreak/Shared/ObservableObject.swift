//
//  ObservableObject.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

class ObservableObject<T> {
    var listener: (T?) -> Void = { _ in }
    
    var result: T? {
        didSet {
            listener(result)
        }
    }
    
    func binding(_ listener: @escaping (T?) -> Void ) {
        self.listener = listener
    }
}
