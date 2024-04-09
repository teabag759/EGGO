//
//  PlusNewRoutine.swift
//  EGGO
//
//  Created by 이소현 on 3/25/24.
//

import SwiftUI

struct PlusNewRoutineView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var time: Date = Date()
    @State private var routineName: String = ""
    var addRoutine: (Routine) -> Void

    var body: some View {
        VStack {
            TextField("Routine's Name", text: $routineName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            Button(action: {
                let newRoutine = Routine(name: routineName, isCompleted: false, time: time)
                addRoutine(newRoutine)
                
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Add Routine")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Add Routine🥚")
    }
}

struct PlusNewRoutineView_Previews: PreviewProvider {
    static var previews: some View {
            PlusNewRoutineView(addRoutine: { _ in })
        }
}
