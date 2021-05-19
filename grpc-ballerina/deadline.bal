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

import ballerina/time;

# Represents the deadline header name.
public const string DEALINE_HEADER = "deadline";

# Enables the deadline by adding the `deadline` header to the given headers.
# ```ballerina
# time:Utc current = time:utcNow();
# time:Utc deadline = time:utcAddSeconds(current, 300);
# map<string|string[]> headers = grpc:setDeadline(deadline);
# ```
#
# + deadline - The deadline time value (this should be a specific time and not a duration)
# + headerMap - Optional header map (if this is not specified, it creates a new header set)
# + return - The header map that includes the deadline
public isolated function setDeadline(time:Utc deadline, map<string|string[]> headerMap = {}) returns map<string|string[]> {
    string deadlineStringValue = time:utcToString(deadline);
    headerMap[DEALINE_HEADER] = deadlineStringValue;
    return headerMap;
}

# Checks whether the deadline is already exceeded or not.
# ```ballerina
# boolean|time:Error isCancelled = grpc:isCancelled(map<string|string[]> headerMap);
# ```
#
# + headerMap - Optional header map sent by the client
# + return - `true` when the deadline is exceeded, `false` when the deadline is not exceeded, or else a `time:Error` when a `deadline`-parsing error occurred
public isolated function isCancelled(map<string|string[]> headerMap) returns boolean|time:Error {
    time:Utc currentTime = time:utcNow();
    string|string[]? deadlineStringValue = headerMap[DEALINE_HEADER];
    if deadlineStringValue is string {
        time:Utc deadline = check time:utcFromString(deadlineStringValue);
        [int, decimal] [deadlineSeconds, deadlineSecondFraction] = deadline;
        [int, decimal] [currentSeconds, currentSecondFraction] = currentTime;
        if currentSeconds > deadlineSeconds {
            return true;
        } else if currentSeconds == deadlineSeconds {
            return currentSecondFraction >= deadlineSecondFraction;
        }
    }
    return false;
}

# Returns the deadline value as `time:Utc`. This can be used to get the deadline and propagate it to subsequent internal calls.
# ```ballerina
# time:Utc?|time:Error deadline = grpc:getDeadline(map<string|string[]> headerMap);
# ```
#
# + headerMap - Optional header map sent by the client
# + return - `deadline` value when the deadline is correctly specified, `()` when the deadline is not specified, or else a `time:Error` when a `deadline`-parsing error occurred
public isolated function getDeadline(map<string|string[]> headerMap) returns time:Utc?|time:Error {
    string|string[]? deadlineStringValue = headerMap[DEALINE_HEADER];
    if (deadlineStringValue is string) {
        time:Utc deadline = check time:utcFromString(deadlineStringValue);
        return deadline;
    }
    return ();
}
