[![Ruby Testing](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/test-ruby.yml/badge.svg)](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/test-ruby.yml)
[![Ruby Linting](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/lint-ruby.yml/badge.svg)](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/lint-ruby.yml)
[![Sorbet](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/sorbet-ruby.yml/badge.svg)](https://github.com/mario-adriano/bbook/blob/main/.github/workflows/sorbet-ruby.yml)

# Bbook

## Descrição | Description

PT-BR
Este projeto consiste em uma API Rest para o empréstimo de livros, desenvolvida como um exercício para experimentar o Sorbet e a gem Tapioca no ambiente Rails. Pode parecer incomum incorporar uma gem que forneça tipagem estática ao Ruby, dado que a tipagem dinâmica é frequentemente vista como um dos maiores benefícios da linguagem. Entretanto, após um estudo aprofundado sobre postagens e documentações fornecidas por empresas como Shopify e Stripe, pude perceber diversas vantagens associadas ao Sorbet. Dentre elas estão a verificação rigorosa de 'nil' e, a capacidade de identificar métodos inexistentes e a integração fornecida com o VSCode através de uma extensão. Constatei que a gem Tapioca é bastante eficiente, listando e integrando os métodos das gems instaladas de maneira fluida. Em suma, notei que a utilização dessas ferramentas auxilia na minimização de bugs durante o desenvolvimento.

EN
This project is a REST API for book lending, developed as an exercise to test Sorbet and the Tapioca gem in the Rails environment. It may seem unusual to incorporate a gem that provides static typing to Ruby, given that dynamic typing is often seen as one of the language's greatest benefits. However, after a thorough study of posts and documentation provided by companies like Shopify and Stripe, I noticed several advantages associated with Sorbet. Among them are the rigorous 'nil' checking, the ability to identify non-existent methods, and the integration provided with VSCode through an extension. I found that the Tapioca gem is quite efficient, listing and integrating the methods of the installed gems in a fluid manner. In summary, I noticed that the use of these tools aids in minimizing bugs during development.

## Versões | Versions

* Versão do Ruby | Ruby version
  3.2.1

* Versão do Rails | Rails version
  7.0.4

* Versão do Postgresql | Postgresql version
  15.2

## Inicializar a aplicação | Initialize the application

* Crie o arquivo .env.development a partir do .env.example e preencha-o com dados | Create the .env.development file from the .env.example and populate it with data

* Executar serviço do banco de dados através do podman | Run the db service through podman
  podman-compose -f podman-compose-service.yml up

* Configurar a base de dados | Configure the database
  rails db:create
  rails db:migrate

* Executar a aplicação | Run the application
  rails s

## Dados complementares | Complementary data

* Executar a verificação do sorbet | Run sorbet check
  bundle exec srb tc

* Executar os testes | Run the tests
  bundle exec rspec spec

* Gera arquivos RBI para DSLs Ruby | Generates RBI files for Ruby DSLs
  bin/tapioca dsl

* Gera arquivos RBI para todas as gems Ruby | Generates RBI files for all Ruby gems
  bin/tapioca gems
