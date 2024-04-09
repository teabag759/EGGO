//
//  Count.swift
//  EGGO
//
//  Created by 이소현 on 3/27/24.
//

import Foundation

class Count{
    var eggCount:Int = 0
    
    static let shared = Count()
    
    func AddCount() {
        self.eggCount += 1
    }
}
