# Desafio API Consuta CEP

Api em Ruby on Rails criada para a busca de cep. Essa aplicação utiliza o Postgresql como banco de dados, está dockerizada, caso a pessoa que irá instalar não tenha ruby on rails instalado em sua maquina.

Clone o repositório em sua máquina local: `git clone git@github.com:SWillames/interview_api.git`
Vá ao diretorio backend-api

## Instalação
**Usando Docker & docker-compose**
Construindo a image do projeto com o comando build:  
```bash docker-compose build
```
Execute a task para criar o usuario default da Api:  
```bash docker-compose run --rm app bundle exec rails dev:setup```

**Sem Docker** 
### Versão Utilizada
* Ruby 2.7.1
* Rails 6.0.3

para instalar as dependencias.
```bash 
bundle install
```

Crie e popule o banco com o usuario default da Api:
```bash 
rails dev:setup
```

## Utilização

A aplicação utiliza o devise_token_auth, e em todas as requests precisam das seguintes informações nos headers:
``` bash
Accept: application/json 
Content-type: application/json 
access-token: {token} 
client: {client} 
uid: {email}
```

Para rodar a aplicação: 
**Com Docker**
```bash
docker-compose up
```

**Sem Docker**
```bash
rails s
```

### Endpoints
Para Sign Up
```bash
{base_url}/api/v1/auth
```

Para Sign in
```bash
#Método http POST
{base_url}/api/v1/auth/sign_in
```
Para buscar cep: 
```bash
# Método http GET
{base_url}/api/v1/search
```
Para buscar todos endereços já salvos de um determinado usuario:
```bash
# Método http GET
{base_url}/api/v1/address
```
## Rodando os testes

``` bash docker-compose run --rm app bundle exec rspec
```
