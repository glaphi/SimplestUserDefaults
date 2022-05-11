//
//  SimpleUserDefaults.swift
//
//
//  Created by Glafira on 4.6.2020.
//

import Foundation

@propertyWrapper
public struct SimpleUserDefaults<T> {

    private let key: String
    private let defaultValue: T

    private let database: UserDefaults

    public init(key: String, defaultValue: T, database: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.database = database
        self.wrappedValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            if let savedValue = (UserDefaults.standard.value(forKey: key) as? T) {
                return savedValue
            } else {
                database.set(defaultValue, forKey: key)
                return defaultValue
            }
        }

        set {
            if let optional = newValue as? SomeOptional {
                guard optional.nonNil else {
                    database.removeObject(forKey: key)

                    return
                }
            }

            database.set(newValue, forKey: key)
        }
    }

}

public extension SimpleUserDefaults where T: ExpressibleByNilLiteral {

    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }

}
