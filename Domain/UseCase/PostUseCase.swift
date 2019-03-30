//
//  PostUseCase.swift
//  Domain
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostUseCase {
    func getPosts() -> Observable<[Post]>
}
