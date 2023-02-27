	                  
import Foundation
import SwiftUI
import CoreMotion


class ModelFacade : ObservableObject {
		                      
	static var instance : ModelFacade? = nil
	private var modelParser : ModelParser? = ModelParser(modelFileInfo: ModelFile.modelInfo)
	@Published var resultAccelerometer : String = ""	
	let motionManager = CMMotionManager()
	let queue = OperationQueue()
	@Published var xAccelerometer: Double = 0.0
	@Published var yAccelerometer: Double = 0.0
	@Published var zAccelerometer: Double = 0.0
	private let pedometer = CMPedometer()
	@Published var resultStepCounter : String = ""

	static func getInstance() -> ModelFacade { 
		if instance == nil
	     { instance = ModelFacade() 
	        }
	    return instance! }
	                          
	init() { 
	}
	      

    func accelerometerClassification(obj : [[Float]]) -> String? {
		guard let result = self.modelParser?.runModel(input: obj)
		else { return "Classification Error" }
		return result
	}
	
	func getAccelerometeraccelerometerClassification () {
        var accelerometerArray: [[Float]] = [[Float]]()
        motionManager.startAccelerometerUpdates(to: queue) {
            (data: CMAccelerometerData?, error: Error?) in
            guard let data = data else {
            print("Error: \(error!)")
            return
        } 
            let trackMotion: CMAcceleration = data.acceleration
            self.motionManager.accelerometerUpdateInterval = 0.2
            DispatchQueue.main.async { [self] in
                self.xAccelerometer = trackMotion.x
                self.yAccelerometer = trackMotion.y
                self.zAccelerometer = trackMotion.z
                
                let xyzArray : [Float] = [Float] ([Float(trackMotion.x)/4000, Float(trackMotion.y)/4000, Float(trackMotion.z)/4000])
                
                accelerometerArray.append(xyzArray)
                
                if accelerometerArray.count == 26 {
                    resultAccelerometer = accelerometerClassification(obj: accelerometerArray) ?? ""
                    accelerometerArray.removeAll()
                }		
            }		
        }
    }
	func cancelAccelerometerClassification() {
		//cancel function
	}
	    
    func getStepCounter () {
		print("getSteps1")
        if CMPedometer.isStepCountingAvailable() {
        	print("getSteps2")
            pedometer.startUpdates(from: Date()) { pedometerData, error in
            	print("getSteps3")
                guard let pedometerData = pedometerData, error == nil else { return }
                print("getSteps4")
                DispatchQueue.main.async {
                	print(pedometerData.numberOfSteps.intValue)
                    self.resultStepCounter = String(pedometerData.numberOfSteps.intValue)
                }
            }
        }
    }


	}
