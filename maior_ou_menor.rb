
def da_boas_vindas
    puts "█████████"
    puts " █▄█████▄█"
    puts"█▼▼▼▼▼"
    puts "█"
    puts"Bem vindo ao jogo!"
   puts" █▲▲▲▲▲"
    puts"█████████"
    puts" ██ ██"
    puts "qual o seu nome?"
    nome = gets.strip
    puts "começaremos o jogo pra voce  #{nome}"
    nome
end

def pede_dificuldade
    puts "qual o nível de dificuldade?"
    puts"(1) muito facil (2) facil (3) normal (4) dificil (5) impossível"
    dificuldade = gets.to_i

end
def ganhou
    
    puts "^^^^^^^##############^^^^^^^"
    puts"^^^^^^^^^###################^^^^^^^^^"
    puts"^^^^^^^^#####################^^^^^^^^"
    puts"^^^^^^######^^^^^^^^^^^^^######^^^^^^"
    puts"^^^^^#####^^^^^^^^^^^^^^^^^######^^^^"
    puts"^^^^####^^^^^^^^^^^^^^^^^^^^^#####^^^"
    puts"^^^####^^^^^^^^^^^^^^^^^^^^^^^#####^^"
    puts"^^####^^^^^####^^^^^^^^^###^^^^^###^^"
    puts "^^###^^^^^######^^^^^^^###^^^^^^####^"
    puts"^####^^^^^######^^^^^^###^^^^^^^^###^"
    puts "^###^^^^^^^####^^^^^^###^^^^^^^^^####"
    puts"^###^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###"
    puts"^###^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###"
    puts" ^###^^^^##^^^^^^^^^^^^^^^^^##^^^^^###"
    puts" ^###^^^^###^^^^^^^^^^^^^^^^##^^^^^###"
    puts "^####^^^^###^^^^^^^^^^^^^^###^^^^###^"
    puts" ^^###^^^^####^^^^^^^^^^^####^^^^####^"
    puts" ^^####^^^^######^^^^^######^^^^####^^"
    puts "^^^####^^^^###############^^^^####^^"
    puts" ^^^^####^^^^^###########^^^^^####^^^"
    puts  "^^^^^#####^^^^^^^^^^^^^^^^^#####^^^^"
    puts  "^^^^^^#########################^^^^^^"
    puts" ^^^^^^^^####################^^^^^^^^^"
    puts " ^^^^^^^^^^^^############ "

    puts"\n\n voce acertou! \n\n"
end
    
def sorteia_numero_secreto (dificuldade)

case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo= 150
    else 5
        maximo= 200
end

    puts"escolhendo um numero secreto de 0 e #{maximo}..."
    sorteado = rand(maximo) +1
    puts "\n escolhido... que tal adivinhar hoje nosso número secreto?"
    puts "\n\n\n"
    return sorteado

end


def pede_um_numero chutes, tentativa, limite_de_tentativas

        puts "tentativa #{tentativa} de #{limite_de_tentativas}"
        puts "chutes até agora: #{chutes}" 
        puts"\n entre com um número"

        chute = gets.strip

        puts "\n será que acertou? você chutou #{chute}"
        chute
end

def verifica_se_acertou (numero_secreto, chute)

    acertou =  numero_secreto == chute.to_i

        if acertou
            ganhou
         return true
        else 
        maior = numero_secreto > chute.to_i
        if maior 
                puts "\n o número secreto é maior"
               return false
            else
                puts "\n o número secreto é menor"
                return false
        end
    end

end

def joga (nome, dificuldade)

        numero_secreto = sorteia_numero_secreto dificuldade

        pontos_ate_agora = 1000
        limite_de_tentativas = 5
        chutes = []
        
        
        for tentativa in 1..limite_de_tentativas
            chute = pede_um_numero chutes, tentativa,limite_de_tentativas
        
            chutes << chute
        
                if nome == "samiry"
                    ganhou
                    break
                end
        
            pontos_a_perder = (chute.to_i - numero_secreto).abs / 2.0
            pontos_ate_agora -= pontos_a_perder
        
            if verifica_se_acertou(numero_secreto, chute)
                break
            end
        
        end
        
    puts "voce ganhou #{pontos_ate_agora} pontos"
end

def quer_jogar
puts"\n deseja jogar novamente? (S/N)"
quer_jogar = gets.strip
quer_jogar.upcase == "S" 
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga  nome, dificuldade

    if ! quer_jogar
        break
    end
end

