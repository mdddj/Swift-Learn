//
//  Server.swift
//  FlutterNet
//
//  Created by ldd on 2022/9/13.
//

import NIO
import NIOExtras


typealias ChannelConnected = (Int,ChannelHandlerContext) -> Void

class EchoHandle: ChannelInboundHandler {
    
    private static var connectCountState = 0;
    let id : Int
    
    typealias  InboundIn =  ByteBuffer
    typealias OutboundOut = ByteBuffer
    var channelConnected: ChannelConnected?
    
    init(channelConnected: ChannelConnected? = nil) {
        self.channelConnected = channelConnected
        id = EchoHandle.connectCountState
    }
    
    ///新的连接
    func channelActive(context: ChannelHandlerContext) {
        if let channelConnected = channelConnected {
            channelConnected(id,context)
        }
        EchoHandle.connectCountState+=1
    }
    
    func channelRegistered(context: ChannelHandlerContext) {
        print("执行...channelRegistered")
    }
    
    func channelInactive(context: ChannelHandlerContext) {
        print("执行...channelInactive")
    }
    
    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        var buffer = unwrapInboundIn(data)
        let readableBytes = buffer.readableBytes
        if let received = buffer.readString(length: readableBytes){
            NetApiModel.sharedInstance.addNewApi(json: received)
        }
    }
    
    func channelReadComplete(context: ChannelHandlerContext) {
        context.flush()
    }
    
    func errorCaught(context: ChannelHandlerContext, error: Error) {
        print("error \(error.localizedDescription)")
        context.close(promise: nil)
    }
}

enum EchoServerError: Error {
    case invalidHost
    case invalidPort
}

class EchoServer {
    
    ///存放所有连接
    private var connectionsById: [Int: ChannelHandlerContext] = [:]
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private var host: String?
    private var port: Int?
    
    static let sharedInstance = EchoServer(host: "192.168.199.32", port: 9999)
    
    init(host: String,port:Int) {
        self.host = host
        self.port = port
    }
    
    func start() throws {
        guard let host = host else {
            throw EchoServerError.invalidHost
        }
        guard let port = port else {
            throw EchoServerError.invalidPort
        }
        do{
            _ = try serverBootstrap.bind(host: host, port: port)
        }catch let error {
            throw error
        }

    }
    
    
    func stop() {
        do {
            try group.syncShutdownGracefully()
        }catch let error {
            print("error shutting down \(error.localizedDescription)")
            exit(0)
        }
        print("服务关闭")
    }
    
    private var serverBootstrap: ServerBootstrap {
        ServerBootstrap(group: group)
                .serverChannelOption(ChannelOptions.backlog, value: 256)
                .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
                .childChannelInitializer { channel in
                    channel.pipeline.addHandlers([
                        ByteToMessageHandler(LengthFieldBasedFrameDecoder(lengthFieldLength: .four)),
                        EchoHandle(channelConnected: { id, ctx in
                            self.connectionsById[id] = ctx
                        })
                    ])
                }
                .childChannelOption(ChannelOptions.socket(IPPROTO_TCP, TCP_NODELAY), value: 1)
                .childChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
                .childChannelOption(ChannelOptions.maxMessagesPerRead, value: 16)
                .childChannelOption(ChannelOptions.recvAllocator, value: AdaptiveRecvByteBufferAllocator())
        
    }
    
}
