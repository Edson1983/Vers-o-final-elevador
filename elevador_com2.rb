def processar_entrada(andar_inicial, abaixo_do_solo, acima_do_solo, botoes)
    andar_atual = andar_inicial
    paradas = 0
  
    botoes.each do |botao|
      if botao.start_with?('+')
        andar_atual += botao[1..-1].to_i
      elsif botao.start_with?('-')
        andar_atual -= botao[1..-1].to_i
      end
  
      # Verifica se o elevador está dentro dos limites
      if andar_atual < -abaixo_do_solo 
        andar_atual = -abaixo_do_solo

      elsif andar_atual > acima_do_solo
        andar_atual = acima_do_solo
        
      end
  
      paradas += 1
      puts " #{paradas} #{andar_atual}"
    end
  
    
  end
  
  def ler_arquivo_elevador(nome_arquivo)
    File.open(nome_arquivo, 'r') do |arquivo|
      while (linha = arquivo.gets)
        entrada = linha.split.map(&:to_i)
        andar_inicial, abaixo_do_solo, acima_do_solo = entrada[0], entrada[1], entrada[2]
        botoes = arquivo.gets.split
        processar_entrada(andar_inicial, abaixo_do_solo, acima_do_solo, botoes)
      end
    end
  end
  
  # Lê o arquivo elevador.txt
  ler_arquivo_elevador('elevador2.txt')