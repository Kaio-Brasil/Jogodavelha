--Construir uma tabela 3x3
tabuleiro = {
				{" "," "," "},
				{" "," "," "},
				{" "," "," "}
			}

--Cria um  novo tabuleiro
function tabuleiro:novotabuleiro()
	--Criar um novo tabuleiro ou seja uma nova instancia
	local nTabuleiro = {}
	-- Novo tabuleiro herda de tabuleiro
	setmetatable(nTabuleiro, {__index = tabuleiro})
	--Retorna um novo tabuleiro
	return nTabuleiro
end

--Verifica se todos elementos de uma linha, coluna e diagonas sao iguais.
function tabuleiro:vencedor()
	for i=1, 3 do
		--verificar linhas
		if (((self[i][1] == self[i][2]) and (self[i][3] == self[i][1])) and (self[i][2] ~= " ")) then
			return true
		end

		--verificar colunas
		if (((self[1][i] == self[2][i]) and (self[3][i] == self[2][i])) and (self[2][i] ~= " ")) then
			return true
		end

	end

	--verificar diagonais da esquerda para direita
	if (((self[1][1] == self[2][2]) and (self[3][3] == self[2][2])) and (self[2][2] ~= " " )) then
		return true
	end

	--verificar diagonais da direita para esquerda
	if (((self[1][3] == self[2][2]) and (self[3][1] == self[2][2])) and (self[2][2] ~= " " )) then
		return true
	end

	return false

end

--Verifica se nao houve ganhador e caso o elemento da linha ou da coluna for igual, ele retorna verdadeiro
function tabuleiro:empate()
	 for i = 1, 3, 1 do
		for j = 1, 3, 1 do
			if (tabuleiro[i][j] == " ") then
				return false

			end

		end

	end

	return true

end

--Verifica se a jogada e valida, caso jogue em mesmo posicao sera pedido que jogue novamento.
function tabuleiro:validarJogada(posicao, simbolo)
	--Condicao sera verdadeiro caso posicao esteja entre o intevelo de 1 a 9
	if ((posicao >= 1) and (posicao <= 9)) then
		--Se a posicao for igual ao numero digitado e tambem que a posicao esteja vazia
		if ((posicao == 1) and (self[1][1] == " ")) then
			--Posicao do tabuleiro recebe o simbolo X(xis) ou O(bola)
			self[1][1] = simbolo
		elseif ((posicao == 2) and (self[1][2] == " ")) then
			self[1][2] = simbolo
		elseif ((posicao == 3) and (self[1][3] == " ")) then
			self[1][3] = simbolo
		elseif ((posicao == 4) and (self[2][1] == " ")) then
			self[2][1] = simbolo
		elseif ((posicao == 5) and (self[2][2] == " ")) then
			self[2][2] = simbolo
		elseif ((posicao == 6) and (self[2][3] == " ")) then
			self[2][3] = simbolo
		elseif ((posicao == 7) and (self[3][1] == " ")) then
			self[3][1] = simbolo
		elseif ((posicao == 8) and (self[3][2] == " ")) then
			self[3][2] = simbolo
		elseif ((posicao == 9) and (self[3][3] == " ")) then
			self[3][3] = simbolo
		else
			--Retorna falso se a posicao ja foi preenchida
			return false
		end

		--Retorna verdadeiro se o tabuleiro receber um simbolo
		return true

	else
		--Retorna falso caso o numero digitado estiver fora do intevalo de 1 a 9
		return false
	end

end

--Contrucao do tabueiro
function tabuleiro:mostrarTabuleiro()
	print(self[1][1] .. "|" .. self[1][2] .. "|" .. self[1][3])
	print("------")
	print(self[2][1] .. "|" .. self[2][2] .. "|" .. self[2][3])
	print("------")
	print(self[3][1] .. "|" .. self[3][2] .. "|" .. self[3][3])
end

--Limpar todos os campos do tabuleiro
function tabuleiro:zerarTabuleiro()
	 for i = 1, 3, 1 do
		for j = 1, 3, 1 do
			self[i][j] = " "

		end

	end

end

--Retorna o valor do tabuleiro
return tabuleiro
