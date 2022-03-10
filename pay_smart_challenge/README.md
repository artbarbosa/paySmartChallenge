# Movie App

## Contexto

Como desafio da PaySmart fui encarregado de fazer um MVP de um aplicativo móvel para cinéfilos e amadores de filmes seguindo suas recomendações: utilizar a API The Movie DB, o aplicativo deve apresentar uma lista de todos os lançamentos de filmes, não somente os 20 primeiros retornados pela API, nos itens da listagem deve conter o poster do filme, título, gêneros e data de lançamento, poder selecionar o filme especifico para ver os detalhes, da a possibilidade de acessar a lista offline e poder pesquisar o filme inserindo um nome parcial ou completo.

# Arquitetura 

A primeira vista se tratando de um projeto MVP, temos que nos preocupar com escalabilidade, mas devemos ter em vista a preocupação com as entregas e o funcionamento com recursos mínimos do aplicativo. Tende essa linha de raciocínio em vista optei pela utilização de módulos, onde em cada modulo posso seguir algum padrão arquitetural, e dando a possibilidade de refatorações posteriores.

<img src="https://user-images.githubusercontent.com/91624613/157719133-92f599ea-6333-4947-8722-00ac39febbdb.jpg" width="800" height="800">

## Module Movie 

No module movie optei por seguir o padrão MVVM, separando as camadas em Model, onde vão apresentar MovieModel, DetailsMovieUpCommingModel e GenresMoviesModel, cada classe apresentando respectivamente suas responsabilidades como modelo de domínio, ou seja, os objetos de negócios que serão utilizadas em determinada aplicação. ModelView, nas quais eu chamei de Stores, para promover o reaproveitamento separei as ViewsModels em suas respectivas responsabiliades, MoviesUpCommingStore e GenresMovies, cada uma delas vai buscar suas respectivas listas de Models aplicar a lógica de negócio e passar para próxima camada essas listas, lembrando que elas não devem criar dependências entre si, para não promover uma dependência circular. Modifiquei o padrão MVVM colocando uma nova camada de controller onde ela vai ter uma relação de um para um com as páginas e vários para um com as Stores aumentando o desacoplamento e promovendo ainda mais a reaproveitamento de um ViewModel, nesse caso chamei de HomeStore, ela vai ser responsável tanto pelo controle de estado global da HomePage quanto buscar as listas em suas respectivas stores.

## State Management 
 
Tanto pela reatividade transparente quanto pelos padrões arquiteturais impostos, escolhi utilizar a biblioteca Mobx para eu gerenciar o estado e manter os widgets(páginas e lista) atualizados.

## Composite pattern (Container)

Baseado no design pattern Composite apliquei um padrão de roteamento na Home de acordo com seu estado, HomePage, caso tudo for sucesso, HomeLoading, e HomeError.

![](https://miro.medium.com/max/1200/1*87h2uhCJ5qztBNwfck2b6g.jpeg)

## Dependency inversion principle (DiP)

Pensando na manutenibilidade e desacoplamento, apliquei o princípio do DiP, um dos princípios do SOLID, onde as classes devem seguir uma interface (abstração) e serem uma implementação dessa interface e outras classes não devem depender da implementação e sim da interface.

## Service pattern

Utilize design pattern Service tanto para implementar as interfaces do HttpClient e LocalStorageClient quanto para fazer a comunicação externa local dos serviços de cache como no GenreMoviesCache e MoviesCacheService.  

## Repository pattern

Com a necessidade de conversar com uma API, optei pela utilização do design pattern repository, implementando a conexão remota e fazendo as chamadas a API e transformando os resultados em Objetos, e caso tenha sucesso passando para frente uma lista desses mesmo Objetos. Esse mesmo Repository MovieRepository é uma implementação de uma interface IMovieRepository e depende de outra interface HttpClient. Optei por utilizar um Repository apenas para o module pois não vi necessidades de outros.

## Routers 

Baseado no sistema de rotas do Modular e Nuvigator, apliquei um padrão de sistema de roteadores, em suas respctivas camadas, no Core vai ter um Router principal para fazer a comunicação e roteamento entre os módulos, e dento de cada modulo vou ter respectivos roteadores, no caso MovieRouter, a qual tem a responsabilidade de fazer um roteamento interno no modular chamando Containers como HomeContainer ou Routes como DetailRoute, a qual chama o DetailPage, com a necessidade de passagem de Argumentos entre esses Widgets, fiz uma classe DetailArguments para fazer a passagem de múltiplos argumentos e poder ter maior controle de tipagem.

# Tratamento de Erros 

Como um dos aspectos mais importante durante o desenvolvimento de software, fiz o tratamento de error em suas respctivas camadas com classes criadas denominando possibilidades de erros e suas respctivas necessidades.

# Testes Unitários 

Para verificar o comportamento das unidades na aplicação e manter um desenvolvimento conciso e com maior quantidade de tratamento de erros e exceções apliquei testes unitários utilizando mocks para não criar dependência de dados externos.
