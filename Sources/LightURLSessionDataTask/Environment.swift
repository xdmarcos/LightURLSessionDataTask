//
//  Environment.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev on 05/03/2021.
//

import Foundation

public enum Environment {
  public static let successStatusCodeRange: Range<Int> = 200 ..< 300
}

public enum MimeType: String {
  case json = "application/json"
  case plain = "text/plain"
  case javascript = "text/javascript"
  case gif = "image/gif"
  case png = "image/png"
  case jpg = "image/jpg"
  case jpeg = "image/jpeg"
  case svg = "image/svg"
  case multipart = "multipart/form-data"
  case urlEncoded = "application/x-www-form-urlencoded"
}
