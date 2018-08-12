//
//  MetalView.swift
//  Metal001
//
//  Created by Michael Vilabrera on 8/12/18.
//  Copyright © 2018 Michael Vilabrera. All rights reserved.
//

import Cocoa
import MetalKit

class MetalView: MTKView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        render()
    }

    func render () {
        let device = MTLCreateSystemDefaultDevice()!
        self.device = device
        let rpd = MTLRenderPassDescriptor()
        let bleen = MTLClearColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        rpd.colorAttachments[0].texture = currentDrawable!.texture
        rpd.colorAttachments[0].clearColor = bleen
        rpd.colorAttachments[0].loadAction = .clear
        let commandQueue = device.makeCommandQueue()
        let commandBuffer = commandQueue?.makeCommandBuffer()
        let encoder = commandBuffer?.makeRenderCommandEncoder(descriptor: rpd)
        encoder?.endEncoding()
        commandBuffer?.present(currentDrawable!)
        commandBuffer?.commit()
    }
}
