//
//  FSObserver.swift
//  DirectoryObserver
//
//  Created by Ravi Tripathi on 28/06/20.
//  Copyright © 2020 Ravi Tripathi. All rights reserved.
//

import Foundation

public class FSObserver {
    
    private let fileDescriptor: CInt
    private let source: DispatchSourceProtocol
    
    deinit {
        self.source.cancel()
        close(fileDescriptor)
    }
    
    public init(URL: URL,
         fileSystemEvent: DispatchSource.FileSystemEvent,
         block: @escaping ()->Void) {
        self.fileDescriptor = open(URL.path, O_EVTONLY)
        self.source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: self.fileDescriptor, eventMask: fileSystemEvent, queue: DispatchQueue.global())
        self.source.setEventHandler {
            block()
        }
        self.source.resume()
    }
}
