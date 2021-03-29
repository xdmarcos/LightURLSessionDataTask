//
//  ResponseOptions.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev on 05/03/2021.
//

import Foundation

public protocol DataDecoderProtocol {
  func decode<T: Decodable>(_ type: T.Type, from: Data) throws -> T
}

public protocol ResponseOptionsProtocol {
  var decoder: DataDecoderProtocol { get }
  var statusCodes: Range<Int>? { get }
  var mimeTypes: [String]? { get }
}

public struct ResponseOptions: ResponseOptionsProtocol {
  public let decoder: DataDecoderProtocol
  public let statusCodes: Range<Int>?
  public let mimeTypes: [String]?

  public init(
    decoder: DataDecoderProtocol = JSONDecoder(),
    statusCodes: Range<Int>? = Consts.successStatusCodeRange,
    mimeTypes: [String]? = [MimeType.json.rawValue]
  ) {
    self.decoder = decoder
    self.statusCodes = statusCodes
    self.mimeTypes = mimeTypes
  }
}

extension JSONDecoder: DataDecoderProtocol {}
