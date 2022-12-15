//
//  FlutterNetApp.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/14.
//

import Network
import SwiftUI
fileprivate let maxLen = 1024 * 1048

/// 客户端连接模型
class Connection {
    @ObservedObject var netApiModel: NetApiModel = NetApiModel.sharedInstance

    private static var nextId: Int = 0
    let newConnection: NWConnection
    let id: Int
    var didStopCallback: ((Error?) -> Void)?

    init(newConnection: NWConnection) {
        self.newConnection = newConnection
        id = Connection.nextId
        Connection.nextId += 1
    }

    func start() {
        print("\(id) 开始连接")
        newConnection.stateUpdateHandler = stateDidChange(to:)
        setupReceive()
        newConnection.start(queue: .global())
    }

    private func stateDidChange(to state: NWConnection.State) {
        switch state {
        case .setup:
            break
        case let .waiting(error):
            connectionDidFail(error: error)
            break
        case .preparing:
            print("准备连接中")
            break
        case .ready:
            print("连接已准备好")
        case let .failed(error):
            connectionDidFail(error: error)
        case .cancelled:
            print("连接关闭:cancelled...")
            break
        @unknown default:
            break
        }
    }

    private func connectionDidFail(error: Error) {
        print("connect \(id) 出现错误: \(error)")
    }

    func stop() {
        print("连接结束")
    }

    private func stop(error: Error?) {
        newConnection.stateUpdateHandler = nil
        newConnection.cancel()
        if let didStopCallback = didStopCallback {
            self.didStopCallback = nil
            didStopCallback(error)
        }
    }
    
    func hw_getInt(_ array: [UInt8]) -> Int {
        var value: UInt32 = 0
        let data = NSData(bytes: array, length: array.count)
        data.getBytes(&value, length: array.count)
        value = UInt32(bigEndian: value)
        return Int(value)
    }
    
    
    var strLen:Int?
    var strData: NSMutableData?
    
    /// 开始接收数据
    private func setupReceive() {
        newConnection.receive(minimumIncompleteLength: 1, maximumLength: maxLen) { content, contentContext, isComplete, error in
            
            let buffCount = content?.count
            print("开始处理数据:大小:\(buffCount ?? -1)")
            
            
            
            
            if let content = content {
                
                if(buffCount == 3069) {
                    let str = String(bytes: content, encoding: .utf8)
                    print(">>>>>>>>>>>>>>>>>>>>>>\(str)")
                }
                
                
                
                
                let int32Size = MemoryLayout<UInt32>.size
                if(int32Size == content.count){
                    //说明是数据长度的数据
                    let len = self.hw_getInt([UInt8](Data(content)))
                    self.strLen = len
                    self.strData = NSMutableData()
                    print("获取到数据长度:\(len) ")
                  
                }else{
                    if let strData = self.strData {
                        //说明是字符串数据
                        self.strData!.append(Data(content))
                        if let strLen = self.strLen {
                            //判断一下是否到结尾
                            let currentDataLen = self.strData!.count
//                            print("strdata的长度:\(currentDataLen)   >> 预期长度:\(strLen)")
                            if(currentDataLen == strLen) {
                                print(">>读取数据一轮成功:当前缓冲区长度\(currentDataLen)  预计数据长度\(strLen)  buff长度:\(content.count)<<")
                                //获取完成,打印一下数据
                                let string = String(bytes: strData, encoding: .utf8)
                                if let string = string {
//
                                    self.netApiModel.addNewApi(json: string)
                                    ///清空重置
                                    self.strLen = nil
                                    self.strData = nil
                                }
                            }
                        }
                    }
                }
            }
            
            
            
            if isComplete {
                self.connectionDidEnd()
            } else if let error = error {
                self.connectionDidFail(error: error)
            } else {
                self.setupReceive()
            }
        }
 //       newConnection.receive(minimumIncompleteLength: 0, maximumLength: maxLen) { content, _, isComplete, error in
 //           if var data = content, content != nil && !content!.isEmpty {
  //              print(" \n\n>>>>>> \(String(bytes: data, encoding: .utf8))<<<<\n\n")
//                if let string =  String(bytes: data, encoding: .utf8) {
//                 self.netApiModel.addNewApi(json: string)
//
//             }else{
//                 print("装换字符串失败")
//             }
   //         }
            
//        }
    }

    private func connectionDidEnd() {
        print("连接\(id)结束")
        stop(error: nil)
    }

    /// 发送数据
    func send(data: Data) {
        newConnection.send(content: data, completion: .contentProcessed { (error: NWError?) in
            if let error = error {
                self.connectionDidFail(error: error)
                return
            }
            if let string = String(bytes: data, encoding: .utf8) {
                // print("连接ID:\(self.id),发送数据:\(string)")
            }

        })
    }
}

/**
 socket服务区
 */
class Server {
    static let sharedInstance = Server()

    let protocolFramerOptions = NWProtocolFramer.Options(definition: NWProtocolFramer.Definition(implementation: MyPipeFramer.self))

    let listener: NWListener
    let timer: DispatchSourceTimer
    init() {
        let options = NWProtocolTCP.Options()
        options.enableKeepalive = true
        options.keepaliveIdle = 2
        options.keepaliveCount = 2
        options.keepaliveInterval = 2
        options.connectionTimeout = 10
        options.enableFastOpen = true

        let params = NWParameters(tls: nil, tcp: options)
//        params.defaultProtocolStack.applicationProtocols.insert(protocolFramerOptions, at: 0)
        listener = try! NWListener(using: params, on: 9998)

        timer = DispatchSource.makeTimerSource()
    }

    func start() throws {
        print("socket 服务即将启动")
        listener.stateUpdateHandler = stateDidChange(to:)
        listener.newConnectionHandler = didAccept(newConnection:)
        listener.start(queue: .global())

        timer.setEventHandler(handler: heartbeat)
        timer.schedule(deadline: .now() + 5.0, repeating: 5.0)
        timer.activate()
    }

    /// 存放全部连接
    private var connectionsById: [Int: Connection] = [:]

    private func didAccept(newConnection: NWConnection) {
        let connection = Connection(newConnection: newConnection)
        connectionsById[connection.id] = connection
        connection.didStopCallback = { _ in
            self.connectionDidStop(connection)
        }
        connection.start()
        print("新的连接已经打开 \(connection.id)")
    }

    private func connectionDidStop(_ connection: Connection) {
        connectionsById.removeValue(forKey: connection.id)
        print("连接已被关闭")
    }

    private func stop() {
        for connection in connectionsById.values {
            connection.didStopCallback = nil
            connection.stop()
        }
        listener.stateUpdateHandler = nil
        listener.newConnectionHandler = nil
        listener.cancel()
        connectionsById.removeAll()
        timer.cancel()
    }

    private func heartbeat() {
        let timestamp = Date()
        for connection in connectionsById.values {
            let data = "心跳包,连接ID: \(connection.id), 时间:\(timestamp)\r\n"
            connection.send(data: Data(data.utf8))
        }
    }

    static func run() {
        let listener = Server.sharedInstance
        try! listener.start()
    }

    static func exit() {
        let server = Server.sharedInstance
        server.stop()
    }

    func stateDidChange(to newState: NWListener.State) {
        switch newState {
        case .setup:
            break
        case .waiting:
            break
        case .ready:
            print("socket服务启动成功.")
            break
        case let .failed(error):
            print("服务启动异常,error:\(error)")
            stop()
        case .cancelled:
            stop()
            break
        @unknown default:
            break
        }
    }
}

class MyPipeFramer: NWProtocolFramerImplementation {
    static var label: String = "Pipe framer"
    var str: String = ""

    required init(framer: NWProtocolFramer.Instance) {
    }

    func start(framer: NWProtocolFramer.Instance) -> NWProtocolFramer.StartResult {
        return .ready
    }

    func handleInput(framer: NWProtocolFramer.Instance) -> Int {
       
        var count : Int = 0
        let isEnd =  framer.parseInput(minimumIncompleteLength: 1, maximumLength: maxLen) { buffer, _ in
            if let buffer = buffer {
                if(buffer.count == 4) {
                    framer.deliverInput(data: Data(buffer), message: .init(instance: framer), isComplete: false)
                    return buffer.count
                }else{
                    count = hw_getInt([UInt8](Data(buffer)))
                    framer.deliverInput(data: Data(buffer), message: .init(instance: framer), isComplete: false)
                }
                
            }
            return count
        }
        return count
    }

    func handleOutput(framer: NWProtocolFramer.Instance, message: NWProtocolFramer.Message, messageLength: Int, isComplete: Bool) {
       
    }

    func wakeup(framer: NWProtocolFramer.Instance) {
    }

    func stop(framer: NWProtocolFramer.Instance) -> Bool {
        true
    }

    func cleanup(framer: NWProtocolFramer.Instance) {
    }

    func hw_getInt(_ array: [UInt8]) -> Int {
        var value: UInt32 = 0
        let data = NSData(bytes: array, length: array.count)
        data.getBytes(&value, length: array.count)
        value = UInt32(bigEndian: value)
        return Int(value)
    }
}

@main
struct FlutterNetApp: App {
    
    let serverWork = DispatchWorkItem {
        do {
            try EchoServer.sharedInstance.start()
        }catch let error {
            print("Error: \(error.localizedDescription)")
            EchoServer.sharedInstance.stop()
        }
    }
    
    let queue = DispatchQueue.global()
    
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                queue.sync(execute: serverWork)
            }
        }.commands {
            CommandMenu("My Menu") {
                Text("Some text")
                Button(action: {}, label: {
                    Image(systemName: "clock")
                    Text("Date & Time")
                })

                Divider()

                Button(action: {}, label: {
                    Text("1️⃣ Item 1")
                })
                Button(action: {}, label: {
                    Text("2️⃣ Item 2")
                })

                Divider()

                Menu("Sub Menu") {
                    Button(action: {}, label: {
                        Text("Sub Item 1")
                    })
                    Button(action: {}, label: {
                        Text("Sub Item 2")
                    })
                }
            }
        }
        WindowGroup {
            InfoWindow()
        }.handlesExternalEvents(matching: ["infowindow"])
    }
}
