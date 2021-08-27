var number = prompt('Digite um número inteiro: ');

var sum = 0;

for(var i = 3; i < number; i++){
    if(i % 3 == 0 || i % 5 == 0){
        sum += i;
    }
}

console.log(`A soma resultante é: ${sum}`)
