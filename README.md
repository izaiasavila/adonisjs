# Adonis API application

Testando framework AdonisJS

## Setup

npm install

### Start na aplicação

adonis server --dev

### Comandos do AdonisJS

1. Instalando o client do Adonis

npm install -g @adonisjs/cli

2. Criando um projeto Adonis

adonis new nomedoprojeto --api-only

3. Instalar componentes do adonis

adonis install @adonisjs/mail

4. Criando a migração do banco/voltar a migração

adonis migration:run
adonis migration:rollback

5. Criando um controle

adonis make:controller ForgotPassword

6. Listando rotas

adonis route:list

7. Criando model

adonis make:model File -m -c

8. Criar um validador

adonis install @adonisjs/validator
adonis make:validator User
adonis make:ehandler

