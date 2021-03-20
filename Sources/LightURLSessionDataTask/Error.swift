//
//  Error.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev on 05/03/2021.
//

public enum Error: Swift.Error {
  case operationCancelled
  case requestFailed(error: Swift.Error)
  case statusCodeUnavailable
  case statusCodeUnsupported(code: Int)
  case mimeTypeUnavailable
  case mimeTypeUnsupported(mimeType: String)
  case contentDataUnavailable
  case contentDataDecodingFailed(error: Swift.Error)
}
