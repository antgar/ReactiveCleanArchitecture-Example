//
//  Mapper.swift
//  Domain
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift

public protocol Mapper {
    associatedtype FromType
    associatedtype ToType
    
    func map(from: FromType) -> ToType
}

public extension Mapper {
    func mapObservable(from: FromType) -> Observable<ToType> {
        return Observable.just(from).map(self.map)
    }
    func mapObservable(from: [FromType]) -> Observable<[ToType]> {
        return Observable.just(from).map {$0.map(self.map)}
    }
}

public class AnyMapper<T, E>: Mapper {
    private let _map: (T) -> E
    public init<U: Mapper>(_ mapper: U) where U.FromType == T, U.ToType == E {
        _map = mapper.map
    }
    public func map(from: T) -> E {
        return _map(from)
    }
}
