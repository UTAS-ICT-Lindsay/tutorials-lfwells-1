//
//  Movie.swift
//  week9livelecture
//
//  Created by Lindsay Wells on 27/4/2026.
//



import Firebase
import FirebaseFirestore

public struct Movie : Codable
{
    @DocumentID var documentID:String?
    var title:String
    var year:Int32
    var duration:Float
}
