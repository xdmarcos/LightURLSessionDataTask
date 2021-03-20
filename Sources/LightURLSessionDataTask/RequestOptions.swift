//
//  RequestOptions.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev on 05/03/2021.
//

public protocol RequestOptionsProtocol {
  var mimeType: String? { get }
}

public struct RequestOptions: RequestOptionsProtocol {
  public let mimeType: String?

  public init(mimeType: String? = "application/json") {
    self.mimeType = mimeType
  }
}
