# Financial App 

### Caracteristicas

  - Importação de CNAB
  - Service Objects
  - PostgreSQL
  - Bootstrap

> Este projeto tem como finalidade aceitar um upload de arquivo CNAB, normalizar os dados, armazenar em um banco relacional e exibir essas informações em tela.


### Ambiente para desenvolvimento 

| Item | Versão |
| ------ | ------ |
| Ruby | 2.5.1 |
| Rails | 5.2.3 |
| PostgreSQL | 11.3 |
| Bootstrap sass  | 3.4.1 |
| Sassc | 2.2.1  |

### Configurando ambiente

##### Primeira etapa
- [Ruby on Rails guia de instalação](https://guides.rubyonrails.org/getting_started.html "Instalação")
- [PostgreSQL Linux](https://e-tinet.com/linux/postgresql/ "Instalação Linux")
- [PostgreSQL MAC](https://postgresapp.com/
"Instalação")


##### Segunda etapa

Configurado o ambiente podemos seguir adiante.

> Baixando o projeto enviado via link por email.
```sh
$ cd "financial_app"
```


##### Terceira etapa


> Instalando dependências do projeto e executando o projeto.
```sh
$ bundle
$ rake db:drop db:create db:migrate
$ rails s
```

Licença
----
**Allan Flavio da Silva** @Defyland
