              
              
import SwiftUI

@main 
struct sensorsMain : App {

	var body: some Scene {
	        WindowGroup {
	            ContentView(model: ModelFacade.getInstance())
	        }
	    }
	} 
