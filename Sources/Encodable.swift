//
//  Encodable.swift
//  JSONEncoder
//
//  Created by Nobuo Saito on 2016/01/07.
//  Copyright © 2016年 tarunon. All rights reserved.
//

import Foundation

public protocol Encodable {
    func encode() throws -> JSON
}

extension Encodable {
    // workaround: We cannot overload class method and global function.
    public func encode(_ object: Any?) throws -> JSON {
        return try _encode(object)
    }

    // workaround: Escape swift compiler warnigns: `Expression implicitly coerced from 'String?' to Any`
    public func encode(dictionary: [String: Any?]) throws -> JSON {
        return try _encode(dictionary)
    }
    
    // Syntax sugar for Enum
    public func encode(_ f: () -> Any?) throws -> JSON {
        return try _encode(f())
    }
}

extension String: Encodable {
    public func encode() throws -> JSON {
        return .string(self)
    }
}

extension Bool: Encodable {
    public func encode() throws -> JSON {
        return .bool(self)
    }
}

public protocol Number: Encodable {
    func asObject() -> AnyObject
}

extension Number {
    public func encode() throws -> JSON {
        return .number(self)
    }
}

extension Int: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: self)
    }
}

extension UInt: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: self)
    }
}

extension Float: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: self)
    }
}

extension Double: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: self)
    }
}

extension Int8: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: Int(self))
    }
}

extension Int16: Number  {
    public func asObject() -> AnyObject {
        return NSNumber(value: Int(self))
    }
}

extension Int32: Number  {
    public func asObject() -> AnyObject {
        return NSNumber(value: Int(self))
    }
}

extension Int64: Number  {
    public func asObject() -> AnyObject {
        return NSNumber(value: Int(self))
    }
}

extension UInt8: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: UInt(self))
    }
}

extension UInt16: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: UInt(self))
    }
}

extension UInt32: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: UInt(self))
    }
}

extension UInt64: Number {
    public func asObject() -> AnyObject {
        return NSNumber(value: UInt(self))
    }
}

extension ImplicitlyUnwrappedOptional: Encodable {
    public func encode() throws -> JSON {
        switch self {
        case .none:
            return JSON.null
        case .some(let value):
            return try _encode(value)
        }
    }
}
