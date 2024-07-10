namespace go lep_backend
// idl/hello.thrift
namespace go hello.example

struct HelloReq {
    1: string name
}

struct HelloResp {
    1: string resp_body;
}

service LepBackend {
    HelloResp HelloMethod(1: HelloReq request) (api.get="/hello");
}