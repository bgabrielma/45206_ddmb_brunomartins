import UIKit

// Pedra Papel Tesoura
//
//
// To ISTEC
//
//
// brunonunes.martins@my.istec.pt - Bruno Martins - DDMB - 45206
/*
 *
 * Caso Int.random não funcionar, usar -> Int(arc4random_uniform(2)
 *
 */


// Funcionamento:
//
/*
 *       [Atributo] |    Pedra   |   Papel   |   Tesoura
 *   ---------------|-----------------------------------
 *   [Ganha a quem?] |    Tesoura |   Pedra   |   Papel
 *
 */

let mecanismoJogo:[[String]] = [["pedra", "tesoura"], ["papel", "pedra"], ["tesoura", "papel"]]
let opcoes:[String] = ["pedra", "papel", "tesoura"]

let escolhaMaquina = Int.random(in: 0...2)
let escolhaUser = Int.random(in: 0...2)


print("O utilizador escolhe: \(opcoes[escolhaUser])")
print ("A máquina escolhe: \(opcoes[escolhaMaquina])")

print("\n-----Resultado-----")

print("Resultado:  \( (escolhaUser == escolhaMaquina)  ? "Empate" :  (mecanismoJogo[escolhaUser][0] == opcoes[escolhaMaquina]) ?  "Utilizador" : "Máquina")")
