//
//  MapItemDetailViewControllerRepresentable.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 1/29/25.
//

import SwiftUI
import MapKit

struct MapItemDetailViewControllerRepresentable: UIViewControllerRepresentable {
    var mapItem: MKMapItem

    func makeUIViewController(context: Context) -> MKMapItemDetailViewController {
        let mapItemDetailViewController = MKMapItemDetailViewController(mapItem: mapItem, displaysMap: true)
        mapItemDetailViewController.delegate = context.coordinator
        return mapItemDetailViewController
    }

    func updateUIViewController(_ uiViewController: MKMapItemDetailViewController, context: Context) {
        // Update the view controller if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MKMapItemDetailViewControllerDelegate {
        func mapItemDetailViewControllerDidFinish(_ detailViewController: MKMapItemDetailViewController) {
            detailViewController.dismiss(animated: true)
        }
    }
}
