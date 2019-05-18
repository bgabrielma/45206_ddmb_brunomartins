//: Playground - noun: a place where people can play

import UIKit

// Exercicio 1
var arrPar:[Int] = []

for a in 1...100 where a % 2 == 0{
    arrPar.append(a)
}

print("Array: \(arrPar)")

// Exercicio 2

var somatorio:Int = 0;

arrPar.forEach { a in
    somatorio += a
}

print("Somatório do par: \(somatorio)")

// Exercicio 3

var arrImpar:[Int] = []

for a in 1...100 where a % 2 != 0 {
    arrImpar.append(a)
}

for a in 0...arrImpar.count - 1{
    arrImpar[a] += arrPar[a]
}

print("Array par + array impar: \(arrImpar)")

// Exercicio 4

var array4: [Int] = Array(0...100)

//reverse array

array4.reverse()
print("Array 4 invertido: \(array4)")

// Array ordenado (Novamente, sendo meio estúpido zzz)
array4.sort()
print("Array 4 voltando ao original: \(array4)")

// Exercicio 5
for a in 0...arrPar.count - 1 {
    arrPar[a] += arrImpar[a] + 1
}

print("Array par após exercício 5: \(arrPar)")

// Exercício 6

let setInt = Set<Int>(0...50) // 1 a 50
// OU
var setInt2 = Set<Int>()
for _ in 0...50 {
    setInt2.insert(Int.random(in: 0...100))
}

print("\n\n\n \(setInt2)")

// Exercicio 7

/* Bitoque */
let bitoque:Set = ["Batata", "Ovo", "Carne", "Arroz", "Molho", "Couve-flor assada", "Alho"]
let massaBolonhesa:Set = ["Carne", "Massa", "Quejo", "Molho", "Ovo", "Ervas"]

// Propriedades "comuns"
print("Propriedades comuns: \(bitoque.intersection(massaBolonhesa))")

//Propriedades únicas (do 1 em relaçao ao 2 = subtracting else symmetricDifference)
print("Propriedades únicas: \(bitoque.subtracting(massaBolonhesa))")

// Exercicio 8

let dictAluno:[Int:Int] = [45206 : 20, 45207 : 17, 45208 : 14, 45209 : 10, 45210 : 19]

for a in dictAluno where a.value >= 17 {
    print(a)
}

for a in dictAluno.keys {
    print(a)
}

for a in dictAluno.values {
    print(a)
}


