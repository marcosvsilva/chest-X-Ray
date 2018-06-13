%diretorioEntrada = 'C:\Users\Marcos\Documents\Projetos\DeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\';
diretorioEntrada = 'C:\Users\Marcos\Documents\Projetos\DeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\';
diretorioSaida = strcat(diretorioEntrada, 'new\');

imgWidth = 224;
imgLength = 224;

gerarRotateFlips = 0;
gerarRotate20 = 0;

listaArquivos = dir(fullfile(diretorioEntrada, '*.jpeg'));
quantidadeArquivo = length(listaArquivos);

for indice = 1 : quantidadeArquivo
    nomeArquivo = listaArquivos(indice).name;

    %Redimensionar imagem
    imagemOriginal = imread(strcat(diretorioEntrada, nomeArquivo));
    dadosImagem = imfinfo(strcat(diretorioEntrada, nomeArquivo));
    diferenca = dadosImagem.Width - dadosImagem.Height;
    imagemAjustada = padarray(imagemOriginal, abs(round(diferenca /2)), 0, 'both');
    imagemReescalada = imresize(imagemAjustada, [imgWidth imgLength]);
    %imagemReescalada = imresize(imagemOriginal, [imgWidth imgLength]);
    
    %original reescalada
    imwrite(imagemReescalada, strcat(diretorioSaida, 'original_', nomeArquivo));    
    
    %Espelho
    imagemEspelho = fliplr(imagemReescalada);
    imwrite(imagemEspelho, strcat(diretorioSaida, 'flip_', nomeArquivo));
    
    %Rotacionada em 5 graus direita
    imagemSaida = imrotate(imagemReescalada,5,'bilinear','crop');
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate05d_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,5,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip05d_', nomeArquivo));
    end
    
    %Rotacionada em 10 graus direita
    imagemSaida = imrotate(imagemReescalada,10,'bilinear','crop');
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate10d_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,10,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip10d_', nomeArquivo));
    end
    
    %Rotacionada em 15 graus direita
    imagemSaida = imrotate(imagemReescalada,15,'bilinear','crop');
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate15d_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,15,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip15d_', nomeArquivo));
    end
    
    %Rotacionada em 20 graus direita
    if gerarRotate20 == 1
        imagemSaida = imrotate(imagemReescalada,20,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotate20d_', nomeArquivo));
        if gerarRotateFlips == 1
            imagemSaida = imrotate(imagemEspelho,20,'bilinear','crop');
            imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip20d_', nomeArquivo));
        end
    end
        
    %Rotacionada em 5 graus esquerda
    imagemSaida = imrotate(imagemReescalada,355,'bilinear','crop');
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate05e_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,355,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip05e_', nomeArquivo));
    end
    
    %Rotacionada em 10 graus esquerda
    imagemSaida = imrotate(imagemReescalada,350,'bilinear','crop');
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate10e_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,350,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip10e_', nomeArquivo));
    end
    
    %Rotacionada em 15 graus esquerda
    imagemSaida = imrotate(imagemReescalada,345,'bilinear','crop')
    imwrite(imagemSaida, strcat(diretorioSaida, 'rotate15e_', nomeArquivo));
    if gerarRotateFlips == 1
        imagemSaida = imrotate(imagemEspelho,345,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip15e_', nomeArquivo));
    end
    
    %Rotacionada em 20 graus esquerda
    if gerarRotate20 == 1        
        imagemSaida = imrotate(imagemReescalada,340,'bilinear','crop');
        imwrite(imagemSaida, strcat(diretorioSaida, 'rotate20e_', nomeArquivo));
        if gerarRotateFlips == 1
            imagemSaida = imrotate(imagemEspelho,340,'bilinear','crop');
            imwrite(imagemSaida, strcat(diretorioSaida, 'rotateflip20e_', nomeArquivo));
        end
    end
end