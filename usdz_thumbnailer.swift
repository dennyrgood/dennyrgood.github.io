#!/usr/bin/env swift
import Foundation
import SceneKit
import SceneKit.ModelIO
import AppKit

class ARQLThumbnailGenerator {
    private let device = MTLCreateSystemDefaultDevice()!
    
    func thumbnail(for url: URL, size: CGSize, time: TimeInterval = 0) -> NSImage? {
        let renderer = SCNRenderer(device: device, options: [:])
        renderer.autoenablesDefaultLighting = true
        
        let asset = MDLAsset(url: url)
        asset.loadTextures()
        let scene = SCNScene(mdlAsset: asset)
        
        // Check if scene has content
        guard scene.rootNode.childNodes.count > 0 else {
            return nil
        }
        
        renderer.scene = scene
        let image = renderer.snapshot(atTime: time, with: size, antialiasingMode: .multisampling4X)
        return image
    }
}

// Main execution
let args = CommandLine.arguments
guard args.count >= 2 else {
    print("Usage: swift usdz_thumbnailer.swift /path/to/usdz/directory")
    exit(1)
}

let directory = args[1]
let generator = ARQLThumbnailGenerator()
let files = try FileManager.default.contentsOfDirectory(atPath: directory).filter { $0.hasSuffix(".usdz") }

// Create log file
let logPath = directory + "/usdz_thumbnailer.log"
let logFile = open(logPath, O_WRONLY | O_CREAT | O_TRUNC, 0o644)

var successCount = 0
var failCount = 0

for file in files {
    let inputURL = URL(fileURLWithPath: directory + "/" + file)
    let outputPath = directory + "/" + file.replacingOccurrences(of: ".usdz", with: ".png")
    
    // Redirect stderr to log file
    let originalStderr = dup(STDERR_FILENO)
    dup2(logFile, STDERR_FILENO)
    
    let thumbnail = generator.thumbnail(for: inputURL, size: CGSize(width: 512, height: 512))
    
    // Restore stderr
    dup2(originalStderr, STDERR_FILENO)
    close(originalStderr)
    
    if let thumbnail = thumbnail {
        let data = thumbnail.tiffRepresentation!
        let bitmap = NSBitmapImageRep(data: data)!
        let pngData = bitmap.representation(using: .png, properties: [:])!
        try pngData.write(to: URL(fileURLWithPath: outputPath))
        print("✓ \(file)")
        successCount += 1
    } else {
        print("✗ \(file)")
        failCount += 1
    }
}

print("Done: \(successCount) success, \(failCount) failed")
close(logFile)
if failCount > 0 {
    print("Errors logged to: \(logPath)")
}
