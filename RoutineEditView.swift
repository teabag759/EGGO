//
//  RoutineEditView.swift
//  EGGO
//
//  Created by 이소현 on 3/25/24.
//

import SwiftUI

struct RoutineEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var routineManager: RoutineManager
    @Binding var routine: Routine
    @State private var showingCompletionAlert = false
    @State private var showingDeleteAlert = false
    @State private var navigateToCompletionView = false
    
    var deleteRoutine: () -> Void
    
    var body: some View {
        VStack {
            Form {
                TextField("Routine's Name", text: $routine.name)
                DatePicker("Setting time", selection: $routine.time, displayedComponents: .hourAndMinute)
            }
            
            
            
            HStack {
                Button("Complete") {
                    showingCompletionAlert = true
                    print(Count.shared.eggCount)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
                .alert(isPresented: $showingCompletionAlert) {
                    Alert(
                        title: Text("Complete your Routine"),
                        message: Text("\(routine.name)을(를) 수행하셨나요?"),
                        primaryButton: .destructive(Text("No")),
                        secondaryButton: .default(Text("Yes"), action: {
                            Count.shared.AddCount()
                            navigateToCompletionView = true
                            
                        })
                    )
                    
                }
                .sheet(isPresented: $navigateToCompletionView) {

                    RoutineCompleteView(routineManager: routineManager, routineName: routine.name, onDelete: {
                        deleteRoutine()
                    })
                }
                
                
                Button("Delete") {
                    showingDeleteAlert = true
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                .alert(isPresented: $showingDeleteAlert) {
                    Alert(
                        title: Text("Delete your Routine"),
                        message: Text("\(routine.name)을(를) 삭제하시겠습니까?"),
                        primaryButton: .cancel(Text("No")),
                        secondaryButton: .default(Text("Yes"), action: {
                            deleteRoutine()
                            presentationMode.wrappedValue.dismiss()
                        })
                    )
                }
            }
        }
        .padding()
        .background(Color("customGray"))
        .navigationTitle("Edit your Routine")
        .sheet(isPresented: $navigateToCompletionView) {
            RoutineCompleteView(routineManager: routineManager, routineName: routine.name, onDelete: {}/*, buttonTapCount: routineManager.completionCount*/)
        }
        
    }
    
    
}

struct RoutineEditView_Previews: PreviewProvider {
    @State static private var previewRoutine = Routine(name: "샘플 루틴", isCompleted: false, time: Date())
    static var previews: some View {
        let routineManager = RoutineManager()
        
        RoutineEditView(routineManager: routineManager, routine: $previewRoutine, deleteRoutine: {
            print("루틴 삭제")
        })
    }
}


class RoutineManager: ObservableObject {
    @Published var completionCount = 0
    
    func imageView() -> Image {
        switch Count.shared.eggCount {
        case 1: return Image("SecondEGGO")
        case 2: return Image("ThirdEGGO")
        case 3: return Image("FourthEGGO")
        case 4: return Image("SixthEGGO")
        case 5: return Image("SeventhEGGO")
        case 6: return Image("EighthEGGO")
        case 7: return Image("LastEGGO")
        default: return Image("EighthEGGO")
        }
        
        
    }
    
    
    @Published var isPresentingRoutineEdit = false
}


