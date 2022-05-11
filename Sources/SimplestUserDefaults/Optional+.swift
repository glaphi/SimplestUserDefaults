//
//  Optional+.swift
//  
//
//  Created by Glafira on 4.6.2020.
//

import Foundation

internal protocol SomeOptional: ExpressibleByNilLiteral {

    var nonNil: Bool { get }

}

extension Optional: SomeOptional {

    var nonNil: Bool { self != nil }

}
