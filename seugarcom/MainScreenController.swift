//
//  ViewController.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 26/11/15.
//  Copyright © 2015 Alysson Nazareth. All rights reserved.
//

import UIKit
import AVFoundation
import CryptoSwift

class MainViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // MARK: Properties
    @IBOutlet weak var qrCodeView: UIView!
    
    var objCaptureSession:AVCaptureSession?
    var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    var vwQRCode:UIView?
    
    func configureVideoCapture() {
        let objCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error:NSError?
        let objCaptureDeviceInput: AnyObject!
        do {
            objCaptureDeviceInput = try AVCaptureDeviceInput(device: objCaptureDevice) as AVCaptureDeviceInput
        } catch let error1 as NSError {
            error = error1
            objCaptureDeviceInput = nil
        }
        if (error != nil) {
            print("teste");
            return
        }
        objCaptureSession = AVCaptureSession()
        objCaptureSession?.addInput(objCaptureDeviceInput as! AVCaptureInput)
        let objCaptureMetadataOutput = AVCaptureMetadataOutput()
        objCaptureSession?.addOutput(objCaptureMetadataOutput)
        objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        objCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
    }
    
    func addVideoPreviewLayer()
    {
        objCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: objCaptureSession)
        objCaptureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        objCaptureVideoPreviewLayer?.frame = qrCodeView.layer.frame
        qrCodeView.layer.addSublayer(objCaptureVideoPreviewLayer!)
//        self.view.layer.addSublayer(objCaptureVideoPreviewLayer!)
        objCaptureSession?.startRunning()
    }
    
    func initializeQRView() {
        vwQRCode = UIView()
        vwQRCode?.layer.borderColor = UIColor.red.cgColor
        vwQRCode?.layer.borderWidth = 5
        qrCodeView.addSubview(vwQRCode!)
//        self.view.addSubview(vwQRCode!)
        qrCodeView.bringSubview(toFront: vwQRCode!)
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            vwQRCode?.frame = CGRect.zero;
            return
        }
        let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if objMetadataMachineReadableCodeObject.type == AVMetadataObjectTypeQRCode {
            let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObject(for: objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            
            vwQRCode?.frame = objBarCode.bounds;
            
            if objMetadataMachineReadableCodeObject.stringValue != nil {
                let stringValue = objMetadataMachineReadableCodeObject.stringValue
                if (stringValue!.hasPrefix("seugarçom")) {
                    self.performSegue(withIdentifier: "segueToLogin", sender: self)
                }
            }
        }
        
        //let aes: AES = try! AES(key: "3zTvzr3p67VC61jmV54rIYu1545x4TlY", iv: "a2xhcgAAAAAAAAAA");
        //print(aes.blockMode)
        //print(aes.variant)
        //let encrypted: String = try! "teste".encrypt(aes)
        //print(encrypted)
        //lblQRCodeResult.text = encrypted;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureVideoCapture()
        self.addVideoPreviewLayer()
        self.initializeQRView()
    }
    
    @IBAction func OnCreateTableClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToLogin", sender: self)
    }
}

