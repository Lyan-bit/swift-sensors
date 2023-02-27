              
              
              
import SwiftUI

struct ContentView : View {
	
	@ObservedObject var model : ModelFacade
	                                       
	var body: some View {
		TabView {
            AccelerometerClassificationScreen (model: model).tabItem { 
                        Image(systemName: "1.square.fill")
	                    Text("AccelerometerClassification")} 
            CollectSensorScreen (model: model).tabItem { 
                        Image(systemName: "2.square.fill")
	                    Text("CollectSensor")} 
				}.font(.headline)
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ModelFacade.getInstance())
    }
}

