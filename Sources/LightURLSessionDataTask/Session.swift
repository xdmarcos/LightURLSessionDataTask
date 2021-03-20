//
//  Session.swift
//  LightURLSessionDataTask
//
//  Created by xdmgzdev
//

import Foundation

open class Session: SessionProtocol {
  public let session: URLSession

  public init(session: URLSession = .shared) {
    self.session = session
  }

  open func dataTask<T: Decodable>(
    with request: URLRequest,
    dataType: T.Type,
    completionHandler: @escaping (Result<T, Swift.Error>) -> Void
  ) -> URLSessionDataTask {
    dataTask(
      with: request,
      dataType: dataType,
      requestOptions: RequestOptions(),
      responseOptions: ResponseOptions(),
      completionHandler: completionHandler
    )
  }

  open func dataTask<T: Decodable>(
    with request: URLRequest,
    dataType: T.Type,
    requestOptions: RequestOptionsProtocol,
    responseOptions: ResponseOptionsProtocol,
    completionHandler: @escaping (Result<T, Swift.Error>) -> Void
  ) -> URLSessionDataTask {
    var request = request
    update(request: &request, options: requestOptions)
    return session.dataTask(with: request) { [weak self] data, response, error in
      completionHandler(Result<T, Swift.Error> {
        guard let self = self else {
          throw Error.operationCancelled
        }
        if let error = error {
          throw Error.requestFailed(error: error)
        }
        try self.validate(response: response, with: responseOptions)
        return try self.decode(data: data, type: dataType, options: responseOptions)
      })
    }
  }

  open func update(request: inout URLRequest, options: RequestOptionsProtocol) {
    request.addMIMEType(string: options.mimeType)
  }

  open func validate(response: URLResponse?, with options: ResponseOptionsProtocol) throws {
    try validate(response: response, statusCodes: options.statusCodes)
    try validate(response: response, mimeTypes: options.mimeTypes)
  }

  open func validate(response: URLResponse?, statusCodes: Range<Int>?) throws {
    guard let allowlist = statusCodes else {
      return
    }
    guard let httpResponse = response as? HTTPURLResponse else {
      throw Error.statusCodeUnavailable
    }
    if !allowlist.contains(httpResponse.statusCode) {
      throw Error.statusCodeUnsupported(code: httpResponse.statusCode)
    }
  }

  open func validate(response: URLResponse?, mimeTypes: [String]?) throws {
    guard let allowlist = mimeTypes else {
      return
    }
    guard let mimeType = response?.mimeType else {
      throw Error.mimeTypeUnavailable
    }
    if !allowlist.contains(mimeType) {
      throw Error.mimeTypeUnsupported(mimeType: mimeType)
    }
  }

  open func decode<T: Decodable>(
    data: Data?,
    type: T.Type,
    options: ResponseOptionsProtocol
  ) throws -> T {
    guard let data = data, data.count > 0 else {
      throw Error.contentDataUnavailable
    }
    do {
      return try options.decoder.decode(type, from: data)
    } catch {
      throw Error.contentDataDecodingFailed(error: error)
    }
  }
}

private extension URLRequest {
  mutating func addMIMEType(string: String?) {
    guard let value = string, !value.isEmpty else { return }
    addValue(value, forHTTPHeaderField: "Accept")
  }
}
