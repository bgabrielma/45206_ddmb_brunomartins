import UIKit

// Pedra Papel Tesoura
//
//
// To ISTEC
//
//
// brunonunes.martins@my.istec.pt - Bruno Martins - DDMB - 45206

// Funcionamento:
//
/*
 *       [Atributo] |    Pedra   |   Papel   |   Tesoura
 *   ---------------|-----------------------------------
 *   [Ganha a quem?] |    Tesoura |   Pedra   |   Papel
 *
 */

var mecanismoJogo:[[String]] = [["pedra", "tesoura"], ["papel", "pedra"], ["tesoura", "papel"]]
let opcoes:[String] = ["pedra", "papel", "tesoura"]

let escolhaMaquina = opcoes[1]
let escolhaUser = opcoes[0]


print("O utilizador escolhe: \(escolhaUser)")
print ("A máquina escolhe: \(escolhaMaquina)")

print("\n-----Resultado-----")
print("Empate: \(escolhaUser == escolhaMaquina ? "sim" : "não") \n")

for mecanismo in mecanismoJogo where escolhaUser != escolhaMaquina {
    guard mecanismo[0] == escolhaMaquina else {
        continue
    }
    
    if(mecanismo[1] == escolhaUser) {
        print("A máquina ganha!")
    }
    else {
        print("O Utilizador ganha!")
        break;
    }
}
