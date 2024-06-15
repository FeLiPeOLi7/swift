//
//  data.swift
//  Aula7
//
//  Created by Turma02-8 on 13/06/24.
//

import Foundation
import MapKit

struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

var Locais = [
    Location(name:"Brasil", coordinate: CLLocationCoordinate2DMake(-22.43275,-44.1725749), flag:"https:upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1280px-Flag_of_Brazil.svg.png", description: "Brasil neh, tu conhece"),
    Location(name:"Italia", coordinate: CLLocationCoordinate2DMake(41.89411035250981, 12.48929161676468), flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1024px-Flag_of_Italy.svg.png", description: "Italia neh, tu conhece"),
    Location(name:"Alemanha", coordinate: CLLocationCoordinate2DMake(51.022223,9.0304671), flag:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP8AAACZCAMAAADXexy/AAAACVBMVEUAAADdAAD/zgDGIigcAAAAjklEQVR4nO3PAQ0AIAAEodf+oa3hdtCADQAAAAAAAAAAAAAAAD522vzb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zbdtv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82/zb/Nv82x4uIZho613S3wAAAABJRU5ErkJggg==", description: "Alemanha neh, tu conhece"),
    Location(name:"Argentina", coordinate: CLLocationCoordinate2DMake(-34.622859, -58.450125), flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1280px-Flag_of_Argentina.svg.png", description: "Argentina neh, tu conhece"),
]
