import 'package:flutter_app/src/modelo/modelo_item.dart';
import 'package:flutter_app/src/modelo/modelo_item_carrinho.dart';

//Itens disponiveis

ModeloItem maca = ModeloItem(
  descricao: 'Fruta crocante e doce, disponível em variedades como Fuji, Gala e Granny Smith. Rica em fibras e antioxidantes, é conhecida por seus benefícios à saúde, especialmente no controle do colesterol e fortalecimento do sistema imunológico.',
  urlImagem: 'assets/images/maca.png',
  nomeItem: 'Maçã',
  preco: 5.5,
  tipoUnidade: 'kg',
);

ModeloItem uva = ModeloItem(
  descricao: 'Fruta pequena e suculenta, encontrada em variedades roxa, verde e vermelha. Rica em antioxidantes e vitamina C, ajuda na saúde cardiovascular. Pode ser consumida fresca, em sucos, geleias ou na forma de vinho.',
  urlImagem: 'assets/images/uva.png',
  nomeItem: 'Uva',
  preco: 7.4,
  tipoUnidade: 'kg',
);

ModeloItem goiaba = ModeloItem(
  descricao: 'Fruta tropical de polpa rosa ou branca, rica em vitamina C e fibras. Conhecida por seu sabor doce e levemente ácido, é excelente para fortalecer o sistema imunológico e melhorar a digestão.',
  urlImagem: 'assets/images/goiaba.png',
  nomeItem: 'Goiaba',
  preco: 11.5,
  tipoUnidade: 'kg',
);

ModeloItem kiwi = ModeloItem(
  descricao: 'Fruta pequena, de casca marrom peluda e polpa verde vibrante. Tem sabor ácido e refrescante. Rica em vitamina C, fibras e antioxidantes, auxilia na digestão e no fortalecimento do sistema imunológico.',
  urlImagem: 'assets/images/kiwi.png',
  nomeItem: 'Kiwi',
  preco: 2.5,
  tipoUnidade: 'un',
);

ModeloItem manga = ModeloItem(
  descricao: 'Fruta tropical suculenta, de polpa laranja e sabor doce. Rica em vitaminas A e C, além de fibras, é conhecida por seus benefícios para a pele, a visão e o sistema imunológico.',
  urlImagem: 'assets/images/manga.png',
  nomeItem: 'Manga',
  preco: 2.7,
  tipoUnidade: 'un',
);

ModeloItem mamao = ModeloItem(
  descricao: 'Fruta tropical de polpa alaranjada, doce e macia, rica em vitamina C e antioxidantes. Auxilia na digestão devido à enzima papaína e contribui para a saúde da pele e do sistema digestivo.',
  urlImagem: 'assets/images/mamao.png',
  nomeItem: 'Mamão papaya',
  preco: 7.99,
  tipoUnidade: 'kg',
);

// Lista de produtos

List<ModeloItem> items = [maca, uva, goiaba, kiwi, manga, mamao];

// Lista de Categorias
List<String> categias = ['Frutas', 'Verduras', 'Temperos', 'Cereais', 'Grãos'];

// Lista do carrinho de compra
List<ModeloItemCarrinho> itemsCarrinho = [
  ModeloItemCarrinho(item: maca, quantidade: 1),
  ModeloItemCarrinho(item: uva, quantidade: 1),
  ModeloItemCarrinho(item: goiaba, quantidade: 1),
  ModeloItemCarrinho(item: kiwi, quantidade: 1),
  ModeloItemCarrinho(item: manga, quantidade: 1),
  ModeloItemCarrinho(item: mamao, quantidade: 1),
];