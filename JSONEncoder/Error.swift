//
//  Error.swift
//  JSONEncoder
//
//  Created by Nobuo Saito on 2016/01/07.
//  Copyright © 2016年 tarunon. All rights reserved.
//

import Foundation

enum JSONError: ErrorType {
    case UnsupportedType(Any)
    case IncorrectTopLebel(AnyObject)
    case FailedDecoding(NSData)
    case FailedStringify(ErrorType)
}