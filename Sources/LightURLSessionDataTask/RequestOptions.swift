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

  public init(mimeType: String? = MimeType.json.rawValue) {
    self.mimeType = mimeType
  }
}
