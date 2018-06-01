clc;
clearvars;
clear;
clear all;

listaArquivos = dir(fullfile('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\', '*.jpeg'));
quantidadeArquivo = length(listaArquivos);


for indice = 1 : quantidadeArquivo
    nomeArquivo = listaArquivos(indice).name;

    %Redimensionar imagem
    imagemReescalada = imread(strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'original_', nomeArquivo));

    %inverte a cor da imagem
    imagemReescaladaInvertida = imread(strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'invertida_', nomeArquivo));
    
    %Dilatacao 3x3
    dilatacao = strel('line', 3, 0);
    imagemSaida = imdilate(imagemReescalada, dilatacao);
    imagemSaidaInvertida = imdilate(imagemReescaladaInvertida, dilatacao);
    
    imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'dilateD3_', nomeArquivo));    
    imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'dilateD3Invertida_', nomeArquivo));    
    
    %Dilatacao 5x5
    dilatacao = strel('line', 5, 0);
    imagemSaida = imdilate(imagemReescalada, dilatacao);
    imagemSaidaInvertida = imdilate(imagemReescaladaInvertida, dilatacao);
    imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'dilateD5_', nomeArquivo));    
    imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'dilateD5Invertida_', nomeArquivo));    


end
