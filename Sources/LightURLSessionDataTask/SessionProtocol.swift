//
//  SessionProtocol.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev on 05/03/2021.
//

import Foundation

public protocol SessionProtocol {
  func dataTask<T: Decodable>(
    with request: URLRequest,
    dataType: T.Type,
    completionHandler: @escaping (Result<T, Swift.Error>) -> Void
  ) -> URLSessionDataTask

  func dataTask<T: Decodable>(
    with request: URLRequest,
    dataType: T.Type,
    requestOptions: RequestOptionsProtocol,
    responseOptions: ResponseOptionsProtocol,
    completionHandler: @escaping (Result<T, Swift.Error>) -> Void
  ) -> URLSessionDataTask
}
