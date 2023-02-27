//
//  EasyRecentModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

struct EasyRecentModel {
    var data: [RecentTableData] = []
}

struct RecentTableData {
    var id: Int = -1
    var leagueID: Int = -1
    var status: String = ""
    var stage: String = "Unknown"
    var round: String = "Unknown"
    var originalDateTime: String = ""
    var matchDate: String = "YYYY-MM-dd"
    var matchTime: String = "00:00"
    var venue: String = "Unknown"
    var capacity: Int = -1
    var venuCity: String = "Unknown"
    var localteamImg: String = ""
    var visitorteamImg: String = ""
    var localteamCode: String = "Team A"
    var visitorteamCode: String = "Team B"
    var localteamName: String = ""
    var visitorteamName: String = ""
    var localteamId: Int = -1
    var visitorteamId: Int = -1
    var localteamRun: String = "-"
    var localteamWicket: String = "-"
    var localteamOver: String = "-"
    var visitorteamRun: String = "-"
    var visitorteamWicket: String = "-"
    var visitorteamOver: String = "-"
    var note: String = "No Result Found"
}
