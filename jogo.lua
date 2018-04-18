--Chama uma instancia de tabuleiro
local tabuleiro = require("Tabuleiro")

----Chama uma instancia de jogador
local jogador = require("jogador")

--Classe jogo
local jogo = {
				jogador1,
				jogador2,
				tabuleiro,
				jogadordaVez
			}

--Instrução do jogo(como jogar o jogo)
function jogo:regra()
	print("Como jogar: ")
	print("Ao iniciar um novo jogo, o jogador 1 sera representado pelo simbolo X(xis) e o jogador 2 sera o simbolo O(bola).")
	print("O jogador 1 comeca escolhendo de 1 a 9 posicoes, depois passa a vez para o jogador 2 que escolhe de 1 a 8 posicoes isso ate o jogo finalizar.")
	print("Exemplo do tabuleiro abaixo:\n\n1|2|3\n------\n4|5|6\n------\n7|8|9\n")
	print("So sera valida a jogada se a posicao escolhida estiver vazia, nao contendo X(xis) e nem O(bola).")
	print("O jogo so finalizara quando formar tres simbolos iguais na posicao vertical ou na horizontal ou na diagonal.\n")

end

--Cria um novo jogo
function jogo:novojogo()
	--Cria um novo jogo
	local novoJogo = {}
	--Herda de jogo
	setmetatable(novoJogo, {__index = jogo})
	--Chama o metodo novo tabuleiro
	novoJogo.tabuleiro = tabuleiro:novotabuleiro()
	--Chama um novo jogador
	novoJogo.jogador1 = jogador:novojogador()
	--Jogador 1 recebe o simbolo X
	novoJogo.jogador1.simbolo = "X"
	--Chama outro jogador
	novoJogo.jogador2 = jogador:novojogador()
	--Jogador 2 recebe o simbolo O
	novoJogo.jogador2.simbolo = "O"
	--Chama um metado Novo Jogador para o jagador da vez
	novoJogo.jogadordaVez = jogador:novojogador()
	--Jogador da vez recebe simbolo X para iniciar a jogada
	novoJogo.jogadordaVez.simbolo = "X"
	-- Retorna novo jogo
	return novoJogo

end

--Verifica quem ta jogando
function jogo:vez()
	--Verifica o jogador e passa vez para o outro
	if (self.jogador1.simbolo == self.jogadordaVez.simbolo) then
		self.jogadordaVez = self.jogador2
	else
		self.jogadordaVez = self.jogador1
	end

end

--Iniciar uma nova partida
function jogo:iniciar()
	print("COMECANDO A PARTIDA \n")
	--Mostra tabuleiro vazio
	print(self.tabuleiro:mostrarTabuleiro())

	--Inicia Loop infinito
	while true do
		--Mostra a vez de que e que joga
		print("Faca sua jogada jogador: "..self.jogadordaVez.simbolo)
		print("Digite uma posicao: ")
		--Recebe valor digitada da posicao escolhida para a jogada
		local posicao = io.read("*number")
		print()

		if (type(posicao) == "number") then
			--Se for valida a jogada ele ira mostrar o tabuleiro com a jogada feita
			if self.tabuleiro:validarJogada(posicao, self.jogadordaVez.simbolo) then
				print(self.tabuleiro:mostrarTabuleiro())
				print()

				--Mostra o vencedor da partida caso haja vencedor
				if (self.tabuleiro:vencedor()) then
					print("Parabens o jogador "..self.jogadordaVez.simbolo.." venceu!\n")
					self.tabuleiro:zerarTabuleiro()
					break
				--Mostra uma mensagem de empate caso nao haja vencedor
				elseif (self.tabuleiro:empate()) then
					print("Deu VELHA a partida foi empatada.")
					self.tabuleiro:zerarTabuleiro()
					break
				else
					--Proximo da vez
					self:vez()
				end
			else
				--Mosta a mensagem se a posicao digitada ja foi preenchida ou digitada errada
				print("Posicao digitada invalida")
			end
		else
			--Mensagem de erro ao digitar valor invalido.
			print("Valor invalido.\n")

		end

	end
end

--Retorna jogo
return jogo
