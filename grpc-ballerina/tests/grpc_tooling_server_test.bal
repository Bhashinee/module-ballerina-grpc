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

import ballerina/test;

@test:Config {enable:true}
function testServerHelloWorldString() {
    assertGeneratedSources("server", "helloWorldString.proto", "helloWorldString_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_1");
}

@test:Config {enable:true}
function testServerHelloWorldInt() {
    assertGeneratedSources("server", "helloWorldInt.proto", "helloWorldInt_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_2");
}

@test:Config {enable:true}
function testServerHelloWorldFloat() {
    assertGeneratedSources("server", "helloWorldFloat.proto", "helloWorldFloat_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_3");
}

@test:Config {enable:true}
function testServerHelloWorldBoolean() {
    assertGeneratedSources("server", "helloWorldBoolean.proto", "helloWorldBoolean_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_4");
}

@test:Config {enable:true}
function testServerHelloWorldBytes() {
    assertGeneratedSources("server", "helloWorldBytes.proto", "helloWorldBytes_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_5");
}

@test:Config {enable:true}
function testServerHelloWorldMessage() {
    assertGeneratedSources("server", "helloWorldMessage.proto", "helloWorldMessage_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_6");
}

@test:Config {enable:true}
function testServerHelloWorldInputEmptyOutputMessage() {
    assertGeneratedSources("server", "helloWorldInputEmptyOutputMessage.proto", "helloWorldInputEmptyOutputMessage_pb.bal", "helloWorld_sample_service.bal", "helloWorld_sample_client.bal", "tool_test_server_7");
}
