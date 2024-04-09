//
//  SwiftUIView.swift
//  EGGO
//
//  Created by 이소현 on 3/22/24.
//

import SwiftUI

struct RoutineListView: View {
    
    // 기본 루틴 설정
    @State private var routines: [Routine] = [
        Routine(name: "침대에서 일어나기", isCompleted: false, time: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!),
        Routine(name: "점심 맛있게 먹기", isCompleted: false, time: Calendar.current.date(bySettingHour: 12, minute: 30, second: 0, of: Date())!),
        Routine(name: "노래 들으면서 산책하기", isCompleted: false, time: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!),
        Routine(name: "저녁 만들어 먹기", isCompleted: false, time: Calendar.current.date(bySettingHour: 19, minute: 0, second: 0, of: Date())!),
        Routine(name: "오늘 하루 일기 쓰기", isCompleted: false, time: Calendar.current.date(bySettingHour: 21, minute: 30, second: 0, of: Date())!)
    ]
    
    
    @StateObject private var routineManager = RoutineManager()
    @State private var showingRoutineEditSheet = false
    @State private var showingAddRoutineSheet = false
    @State private var selectedRoutine: Routine?
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(routines.sorted(by: { $0.time < $1.time }), id: \.id) {
                        routine in
                        Button(action: {
                            self.selectedRoutine = routine
                            self.routineManager.isPresentingRoutineEdit = true
                        }) {
                            RoutineRow(routine: routine)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(15)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 70)
                                .background(Color("customYellow"))
                                .cornerRadius(10)
                        }
                        .padding(5)
                        .padding(.horizontal, 7)
                    }
                            routineManager.imageView()
                        .resizable()
                        .scaledToFit()
                        .padding()
                            }
                            
                            
                            }
                            
                        .navigationTitle("Routines🥚")
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    self.showingAddRoutineSheet = true
                                }) {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                        .sheet(isPresented: $showingAddRoutineSheet) {
                            PlusNewRoutineView(addRoutine: { newRoutine in
                                self.routines.append(newRoutine)
                            })
                        }
                        .sheet(isPresented: $routineManager.isPresentingRoutineEdit) {
                            if let selectedRoutine = selectedRoutine {
                                RoutineEditView(routineManager: RoutineManager(), routine: .constant(selectedRoutine), deleteRoutine: {
                                    if let index = self.routines.firstIndex(where: {$0.id == selectedRoutine.id}) {
                                        self.routines.remove(at: index)
                                    }
                                })
                            }
                        }
                            }
                            }
                            
                            
                            
                            func deleteRoutine(at offsets: IndexSet) {
                        routines.remove(atOffsets: offsets)
                    }
                            }
                            
                            struct Routine: Identifiable {
                        let id = UUID()
                        var name: String
                        var isCompleted: Bool
                        var time: Date
                    }
                            
#Preview {
                        RoutineListView()
                    }
