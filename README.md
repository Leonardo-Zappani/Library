# Biblioteca MVC – Sistema de Gestão de Empréstimo de Livros

Uma aplicação web desenvolvida com Ruby on Rails e Tailwind CSS que permite o gerenciamento de uma biblioteca. O sistema segue o padrão de arquitetura MVC e possui funcionalidades para leitores e bibliotecários.

---

## 📚 Funcionalidades

### 👤 Leitor

- Visualizar lista de livros disponíveis
- Ver detalhes de cada livro (título, autor, descrição, código)

### 🛠️ Bibliotecário

- Login com e-mail e senha
- Gerenciar usuários:
  - Cadastrar novos leitores ou bibliotecários
  - Editar informações (nome, e-mail, código)
  - Excluir usuários
- Gerenciar livros:
  - Listar todos os livros (inclusive os emprestados)
  - Cadastrar novos livros
  - Editar e remover livros existentes
- Controlar empréstimos:
  - Atribuir livros a leitores
  - Marcar devoluções com um clique

---

## 🧠 Arquitetura MVC

- **Models**: Representam os dados (usuários, livros) e regras de negócio
- **Views**: Páginas com HTML + Tailwind CSS que exibem informações ao usuário
- **Controllers**: Recebem requisições, manipulam dados e retornam as views adequadas

---

## 🧰 Tecnologias Utilizadas

- [Ruby on Rails](https://rubyonrails.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- SQLite ou PostgreSQL
- HTML5 e JavaScript

---

## 🚀 Instalação e Execução

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/biblioteca-mvc.git
cd biblioteca-mvc
```

bundle install
yarn install # se estiver usando Webpacker


rails db:create db:migrate db:seed

rails server

Acesse no navegador:

http://localhost:3000
