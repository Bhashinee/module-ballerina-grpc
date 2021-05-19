// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Defines the Bearer token auth handler for client authentication.
public class ClientBearerTokenAuthHandler {

    BearerTokenConfig config;

    # Initializes the Bearer token auth handler for client authentication.
    #
    # + config - The Bearer token
    public isolated function init(BearerTokenConfig config) {
        self.config = config;
    }

    # Enriches the headers with the relevant authentication requirements.
    #
    # + headers - The `map<string|string[]>` headers map  as an input
    # + return - The Bearer token as a `string` or else a `grpc:ClientAuthError` in case of an error
    public isolated function enrich(map<string|string[]> headers) returns map<string|string[]>|ClientAuthError {
        string token = AUTH_SCHEME_BEARER + " " + self.config.token;
        headers[AUTH_HEADER] = [token];
        return headers;
    }
}
