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
 *       [Atributo]  |    Pedra    [0] [0] |   Papel [1] [0]   |   Tesoura [2] [0]
 *   --------------- |---------------------|-------------------|--------------------
 *   [Ganha a quem?] |    Tesoura [0] [1]  |   Pedra [1] [1]   |   Papel   [2] [1]
 *
 *
 *
 *  Ou seja, se eu quiser saber o atributo que perde contra a pedra, basta fazer: array[0][1].
 *
 *
 *  Se eu quiser saber se tesoura gamhaa pedra s
 *      se array[2][0] == pedra. Como é falso, tesoura perde contra pedra
 *
 */

let mecanismoJogo:[[String]] = [["pedra", "tesoura"], ["papel", "pedra"], ["tesoura", "papel"]]
let opcoes:[String] = ["pedra", "papel", "tesoura"]

let escolhaUser = Int(arc4random_uniform(2))
let escolhaMaquina = Int(arc4random_uniform(2))

print("O Utilizador escolhe: \(opcoes[escolhaUser])")
print ("A Máquina escolhe: \(opcoes[escolhaMaquina])")

print("\n-----Resultado-----")

if escolhaUser != escolhaMaquina  {
    print("Vencedor: \(mecanismoJogo[escolhaUser][1] == opcoes[escolhaMaquina] ? "Utilizador" :  "Máquina")")
} else {
    print("Empate")
}
