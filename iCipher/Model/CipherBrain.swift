//
//  CipherBrain.swift
//  iCipher
//
//  Created by Md. Mahinur Rahman on 3/15/23.
//

import Foundation

struct CipherBrain{
    let side:String?
    var numberOfShifts:Int?
    let inputText:String?
    
    func newPos(currentPosistion:Int)->Int //a is position
    {
        let newPosition:Int
        if(currentPosistion<0)
        {
            var flag:Bool = true
            var n:Int = 0
            while(flag){
                n = n - 1
                if((n*26)<currentPosistion){
                    flag = false
                }
            }
            newPosition = currentPosistion - (n*26)
        }
        else{
            newPosition = currentPosistion % 26
        }
        return newPosition
    }
    
    mutating func runningCipher()->String{
        var result = ""
        var tempNumberOfShifts = 0
        if(side == "Left"){
            tempNumberOfShifts = (-1) * (numberOfShifts ?? 1)
        }
        else{
            tempNumberOfShifts = numberOfShifts ?? 1
        }
        if let safeInputText = inputText{
            for i in safeInputText{
                if(i>="a" && i<="z"){
                    result = result + [Character(UnicodeScalar(newPos(currentPosistion: ((Int(UnicodeScalar(String(i))!.value))-97)+tempNumberOfShifts)+97)!)]
                }
                else if(i>="A" && i<="Z"){
                    result = result + [Character(UnicodeScalar(newPos(currentPosistion: ((Int(UnicodeScalar(String(i))!.value))-65)+tempNumberOfShifts)+65)!)]
                }
                else{
                    result = result + [i] //[] converts char to string
                }
            }
        }
        else{
            result = "No input text!"
        }
        return result
    }
}
