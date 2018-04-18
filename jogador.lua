--Cria novo jogador
local jogador = {
				simbolo
			}

--Chama um novo jogador
function jogador:novojogador()
	--Cria um novo jogador
	local nJogador = {}

	--Herda de jogador
	setmetatable( nJogador, {__index = jogador})

	--Recebe simbolo vazio
	self.simbolo = " "

--Retorna um novo jogador
	return  nJogador

end

--Retorna um jogador
return jogador


