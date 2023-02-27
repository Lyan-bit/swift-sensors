import SwiftUI
import CoreMotion

struct CollectSensorScreen: View {
    
    @ObservedObject var model : ModelFacade
    
    var body: some View {
	  	NavigationView {
	  		ScrollView {
        VStack{
                 HStack (spacing: 20) {
					 Text("Number of steps:").bold()
		             Text("\(model.resultStepCounter)")
		         }.frame(width: 200, height: 30).border(Color.gray)       

        }.onAppear {
	            self.model.getStepCounter()
        }
	  }.navigationTitle("collectSensor")
	}
  }
}

struct CollectSensorScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectSensorScreen(model: ModelFacade.getInstance())
    }
}

