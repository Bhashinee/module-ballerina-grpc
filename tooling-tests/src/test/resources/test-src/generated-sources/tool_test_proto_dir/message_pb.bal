import ballerina/protobuf;

public const string MESSAGE_DESC = "0A0D6D6573736167652E70726F746F22240A0C48656C6C6F5265717565737412140A0567726565741801200128095205677265657422210A0D48656C6C6F526573706F6E736512100A037361791801200128095203736179620670726F746F33";

@protobuf:Descriptor {value: MESSAGE_DESC}
public type HelloResponse record {|
    string say = "";
|};

@protobuf:Descriptor {value: MESSAGE_DESC}
public type HelloRequest record {|
    string greet = "";
|};

