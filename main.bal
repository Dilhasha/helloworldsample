import ballerina/http;

// import ballerinax/wso2.controlplane as _;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function get greeting() returns error|json|http:InternalServerError {
        do {
            string message = string `Hello ${name}`;
            return {"message": message};
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
