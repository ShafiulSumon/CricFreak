//
//  Adapter.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

final class Adapter {
    static let shared = Adapter()
    private init() {}
    
    func convertToEasyForRecentTable(from val: RecentModel?) -> EasyRecentModel {
        guard let val = val else {
            return EasyRecentModel()
        }
        var result = EasyRecentModel()
        for i in 0..<(val.data?.count ?? 0) {
            var res = RecentTableData()
            res.id = (val.data?[i].id) ?? -1
            res.localteamId = (val.data?[i].localteam?.id) ?? -1
            res.visitorteamId = (val.data?[i].visitorteam?.id) ?? -1
            res.leagueID = (val.data?[i].leagueID) ?? -1
            res.status = (val.data?[i].status) ?? ""
            res.stage = val.data?[i].stage?.name ?? "Unknown"
            res.round = val.data?[i].round ?? "Unknown"
            res.matchDate = String(val.data?[i].startingAt?.prefix(10) ?? "YYYY-MM-dd")
            res.matchTime = DateManager.shared.makeTime(date: val.data?[i].startingAt ?? "")
            res.venue = val.data?[i].venue?.name ?? "Unknown Place"
            res.capacity = val.data?[i].venue?.capacity ?? -1
            res.venuCity = val.data?[i].venue?.city ?? "Unknown"
            res.localteamImg = val.data?[i].localteam?.imagePath ?? ""
            res.visitorteamImg = val.data?[i].visitorteam?.imagePath ?? ""
            res.localteamCode = val.data?[i].localteam?.code ?? "Team A"
            res.visitorteamCode = val.data?[i].visitorteam?.code ?? "Team B"
            res.localteamName = val.data?[i].localteam?.name ?? ""
            res.visitorteamName = val.data?[i].visitorteam?.name ?? ""
            
            if(val.data?[i].runs?.isEmpty == false) {
                if(val.data?[i].runs?[0].teamID == val.data?[i].localteam?.id) {
                    res.localteamRun = String(val.data?[i].runs?[0].score ?? 0)
                    res.localteamWicket = String(val.data?[i].runs?[0].wickets ?? 0)
                    if(res.localteamWicket == "10") {
                        res.localteamWicket = ""
                    }
                    else {
                        res.localteamWicket = "-" + res.localteamWicket
                    }
                    res.localteamOver = String(val.data?[i].runs?[0].overs ?? 0)
                    
                    res.visitorteamRun = String(val.data?[i].runs?[1].score ?? 0)
                    res.visitorteamWicket = String(val.data?[i].runs?[1].wickets ?? 0)
                    if(res.visitorteamWicket == "10") {
                        res.visitorteamWicket = ""
                    }
                    else {
                        res.visitorteamWicket = "-" + res.visitorteamWicket
                    }
                    res.visitorteamOver = String(val.data?[i].runs?[1].overs ?? 0)
                }
                else {
                    res.localteamRun = String(val.data?[i].runs?[1].score ?? 0)
                    res.localteamWicket = String(val.data?[i].runs?[1].wickets ?? 0)
                    if(res.localteamWicket == "10") {
                        res.localteamWicket = ""
                    }
                    else {
                        res.localteamWicket = "-" + res.localteamWicket
                    }
                    res.localteamOver = String(val.data?[i].runs?[1].overs ?? 0)
                    
                    res.visitorteamRun = String(val.data?[i].runs?[0].score ?? 0)
                    res.visitorteamWicket = String(val.data?[i].runs?[0].wickets ?? 0)
                    if(res.visitorteamWicket == "10") {
                        res.visitorteamWicket = ""
                    }
                    else {
                        res.visitorteamWicket = "-" + res.visitorteamWicket
                    }
                    res.visitorteamOver = String(val.data?[i].runs?[0].overs ?? 0)
                }
            }
            
            res.note = val.data?[i].note ?? "No result found!"
            
            result.data.append(res)
        }
        return result
    }
}
