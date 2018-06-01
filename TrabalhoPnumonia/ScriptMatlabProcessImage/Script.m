listaArquivos = dir(fullfile('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\', '*.jpeg'));
quantidadeArquivo = length(listaArquivos);

for indice = 1 : quantidadeArquivo
    nomeArquivo = listaArquivos(indice).name;
    
    %Redimensionar imagem
    imagemOriginal = imread(strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\', nomeArquivo));
    dadosImagem = imfinfo(strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\', nomeArquivo));
    diferenca = dadosImagem.Width - dadosImagem.Height;
    imagemAjustada = padarray(imagemOriginal, abs(round(diferenca /2)), 0, 'both');
    imagemReescalada = imresize(imagemAjustada, [150 150]);

    %original
    imwrite(imagemReescalada, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'original_', nomeArquivo));    
    
    %inverte a cor da imagem
    imagemReescaladaInvertida = imcomplement(imagemReescalada);
    imwrite(imagemReescaladaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'invertida_', nomeArquivo));    
    
    %Filtro motion
    %filtro = fspecial('motion', 3, 3);
    %imagemSaida = imfilter(imagemReescalada, filtro);
    %imagemSaidaInvertida = imfilter(imagemReescaladaInvertida, filtro);

    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'motion_', nomeArquivo));    
    %imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'motionInvertida_', nomeArquivo));    
    
    %Filtro laplaciano
    %filtro = fspecial('laplacian',0);
    %imagemSaida = imagemReescalada - imfilter(imagemReescalada, filtro, 'replicate');
    %imagemSaidaInvertida = imagemReescaladaInvertida - imfilter(imagemReescaladaInvertida, filtro, 'replicate');
    
    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'laplacian_', nomeArquivo));    
    %imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'laplacianInvertida_', nomeArquivo));    
    
    %Filtro convolucional
    filtro = [-1 0 1];
    
    imagemSaida = imagemReescalada - imfilter(imagemReescalada, filtro, 'conv');
    imagemSaidaInvertida = imagemReescaladaInvertida - imfilter(imagemReescaladaInvertida, filtro, 'conv');

    imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'conv_', nomeArquivo));    
    imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'convInvertida_', nomeArquivo));    
    
    %Filtro sal e pimenta
    %imagemSaida = imnoise(im2double(imagemReescalada),'salt & pepper', 0.01);
    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'saltpepper_', nomeArquivo));    
       %Filtro motion
    %filtro = fspecial('motion', 3, 3);
    %imagemSaida = imfilter(imagemReescalada, filtro);
    %imagemSaidaInvertida = imfilter(imagemReescaladaInvertida, filtro);

    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'motion_', nomeArquivo));    
    i%mwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'motionInvertida_', nomeArquivo));    
    
    %Filtro laplaciano
    %filtro = fspecial('laplacian',0);
    %imagemSaida = imagemReescalada - imfilter(imagemReescalada, filtro, 'replicate');
    %imagemSaidaInvertida = imagemReescaladaInvertida - imfilter(imagemReescaladaInvertida, filtro, 'replicate');
    
    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'laplacian_', nomeArquivo));    
    %imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'laplacianInvertida_', nomeArquivo));    
    
    %Filtro convolucional
    matriz = magic(5); %Matriz 5x5 com valores inicializados aleatoriamente
    filtro = [-1 0 1];
    
    imagemSaida = imagemReescalada - imfilter(imagemReescalada, filtro, 'conv');
    imagemSaidaInvertida = imagemReescaladaInvertida - imfilter(imagemReescaladaInvertida, filtro, 'conv');

    imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'conv_', nomeArquivo));    
    imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\new\', 'convInvertida_', nomeArquivo));    
     
    %Filtro sal e pimenta
    %imagemSaida = imnoise(im2double(imagemReescalada),'salt & pepper', 0.01);
    %imagemSaidaInvertida = imnoise(im2double(imagemReescaladaInvertida),'salt & pepper', 0.01);
    %imwrite(imagemSaida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'saltpepper_', nomeArquivo));    
    %imwrite(imagemSaidaInvertida, strcat('C:\Users\Marcos\Documents\ProjetosDeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\new\', 'saltpepperInvertida_', nomeArquivo));        
end
