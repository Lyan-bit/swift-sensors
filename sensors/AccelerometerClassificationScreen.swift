import SwiftUI
import CoreMotion

struct AccelerometerClassificationScreen: View {
    
    @ObservedObject var model : ModelFacade
    
    var body: some View {
	  	NavigationView {
	  		ScrollView {
        VStack{
        	HStack (spacing: 20) {
            Text("Accelemeter:").bold()
			VStack {
	            Text("x: \(model.xAccelerometer)")
	            Text("y: \(model.yAccelerometer)")
	            Text("z: \(model.zAccelerometer)")
	        }
            }.frame(width: 250, height: 90).border(Color.gray)
            
            HStack (spacing: 20) {
                Text("Result:").bold()
                Text("\(model.resultAccelerometer)")
            }.frame(width: 250, height: 60).border(Color.gray)
     

        }.onAppear {
	            self.model.getAccelerometeraccelerometerClassification()
        }
       }.navigationTitle("accelerometerClassification")
      }
    }
}

struct AccelerometerClassificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerClassificationScreen(model: ModelFacade.getInstance())
    }
}

