//
//  DataFormatter.swift
//  EGGO
//
//  Created by 이소현 on 3/25/24.
//

import Foundation

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter
}()

