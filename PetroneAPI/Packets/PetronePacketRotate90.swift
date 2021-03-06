//
//  PetronePacketRotate90.swift
//  Petrone
//
//  Created by Byrobot on 2017. 8. 9..
//  Copyright © 2017년 Byrobot. All rights reserved.
//

import Foundation

class PetronePacketRotate90 : PetronePacketLedCommand {
    override init() {
        super.init()
        lightMode = PetroneLigthMode.ArmHold
    }
    
    override func getBluetoothData() -> Data {
        if (Petrone.instance.status?.mode.rawValue)! < PetroneMode.Drive.rawValue {
            lightColor = PetroneColors.Red
            command = PetroneCommand.FlightEvent
            option = PetroneFlightEvent.Rotate180.rawValue
        } else {
            lightColor = PetroneColors.Blue
            command = PetroneCommand.DriveEvent
            option = PetroneDriveEvent.Rotate90Left.rawValue
        }
        return super.getBluetoothData()
    }
    
    override func getSerialData() -> Data {
        lightColor = PetroneColors.Red
        if (Petrone.instance.status?.mode.rawValue)! < PetroneMode.Drive.rawValue {
            command = PetroneCommand.FlightEvent
            option = PetroneFlightEvent.Rotate180.rawValue
        } else {
            lightColor = PetroneColors.Blue
            command = PetroneCommand.DriveEvent
            option = PetroneDriveEvent.Rotate90Left.rawValue
        }
        return super.getSerialData()
    }
}
