//
//  ImagePicker.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/29.
//
import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
  let configuration: PHPickerConfiguration
  @Binding var isPresented: Bool
  func makeUIViewController(context: Context) -> PHPickerViewController {
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = context.coordinator
    return controller
  }

  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  // Use a Coordinator to act as your PHPickerViewControllerDelegate
  class Coordinator: PHPickerViewControllerDelegate {
    private let parent: PhotoPicker

    init(_ parent: PhotoPicker) {
      self.parent = parent
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      print(results)
      parent.isPresented = false // Set isPresented to false because picking has finished.
    }
  }
}
