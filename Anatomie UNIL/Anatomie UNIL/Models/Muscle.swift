//
//  Muscle.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftData

@Model
final class Muscle {
    var id: UUID
    var name: String
    var origin: String
    var insertion: String
    var innervation: String
    var vascularization: String
    var category: MuscleCategory
    var subcategory: MuscleSubcategory

    init(
        name: String,
        origin: String,
        insertion: String,
        innervation: String,
        vascularization: String,
        category: MuscleCategory,
        subcategory: MuscleSubcategory
    ) {
        self.id = UUID()
        self.name = name
        self.origin = origin
        self.insertion = insertion
        self.innervation = innervation
        self.vascularization = vascularization
        self.category = category
        self.subcategory = subcategory
    }
}

enum MuscleCategory: String, CaseIterable, Codable {
    case upperLimb = "Membre supérieur"
    case lowerLimb = "Membre inférieur"
    case trunk = "Tronc"
}

enum MuscleSubcategory: String, CaseIterable, Codable {
    // Upper Limb
    case shoulderAnterior = "Épaule antérieur"
    case shoulderPosterior = "Épaule postérieur"
    case arm = "Bras"
    case forearmAnterior = "Avant-bras antérieur"
    case forearmPosterior = "Avant-bras postérieur"
    case hand = "Main"

    // Lower Limb
    case hip = "Hanche"
    case thigh = "Cuisse"
    case leg = "Jambe"
    case foot = "Pied"

    // Trunk
    case neckAndNape = "Nuque et cou"
    case back = "Dos"
    case thoraxAndAbdomen = "Thorax et abdomen"
}