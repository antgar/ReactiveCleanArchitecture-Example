//
//  APIClient.swift
//  Core
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift

public protocol APIClient {
    func send<T: Decodable>(apiRequest: APIRequest) -> Observable<T>
}
public final class RemoteAPI: APIClient {
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    
    public func send<T: Decodable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
