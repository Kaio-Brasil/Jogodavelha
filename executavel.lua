--Chamando uma instancia de jogo
local jogo = require("jogo")

while true do
	--Escolher jogar partida
	print("--------- JOGO DA VELHA ---------")
	print("Escolha um opcao:\n 1 - para iniciar uma nova partida\n 0 - para sair")
	local exercutar = io.read("*number")

	if (exercutar == 1) then
		--Jogar recebe um novo jogo
		local jogar = jogo:novojogo()

		--Instrucao de como jogar
		jogar:regra()

		--Incia um novo jogo
		jogar:iniciar()

	else
		--Sair do jogo
		print("Ate logo...")
		break
	end

end
