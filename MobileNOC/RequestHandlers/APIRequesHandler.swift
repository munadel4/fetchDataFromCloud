//
//  APIRequesHandler.swift
//  CLoudConnective
//
//  Created by Munadel Qubbaj on 8/10/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import Alamofire

class APIRequestHandler: NSObject {


    // MARK: Delegate Method for Self Signed Server
    private static var Manager: Alamofire.SessionManager = {

        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [

            Constants.KCBaserURL: .disableEvaluation
        ]

        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )

        return manager
    }()


    // Fetch Data From Server Method
    func fetchDataFromServer(page: Int, size: Int, responseCode: @escaping (Int) -> Void) {

        // Handle Authentication challenge
        let delegate: Alamofire.SessionDelegate = APIRequestHandler.Manager.delegate
        delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = APIRequestHandler.Manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }

        //Web service Request
        let params: Parameters = [
            Constants.KCpage: page,
            Constants.KCSize: size
        ]

        APIRequestHandler.Manager.request(Constants.KCBaserURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).authenticate(user: Constants.KCServerUserName, password: Constants.KCServerPassword).responseJSON
            { (response) in
                guard let jsonResponse = response.result.value as? NSDictionary, let contentsResponse = ContentsModel.deserialize(from: jsonResponse) else {return}
                DataManager.shared.contentsData = contentsResponse
                return responseCode(0)
        }
}
}
