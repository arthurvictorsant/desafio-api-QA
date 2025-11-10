# Desafio API QA - ServeRest

Testes automatizados da API ServeRest usando Postman e Newman.

URL Base: https://serverest.dev

## Estrutura do Projeto

```
desafio-api-qa/
├── collections/          # Collections do Postman
├── environments/         # Variáveis de ambiente
├── reports/             # Relatórios de execução
└── scripts/             # Scripts auxiliares
```

## Levantamento de Cenários

### Login

**Positivos:**
- Login com credenciais válidas
- Validar estrutura do token retornado
- Token pode ser usado em requisições autenticadas

**Negativos:**
- Login com email inválido
- Login com senha incorreta
- Login sem email
- Login sem senha
- Email não cadastrado
- Formato de email inválido

**Automatizados (2 cenários críticos):**
1. **Login com credenciais válidas** - fluxo principal
2. **Login com credenciais inválidas** - validação de segurança

---

### Usuários

**Positivos:**
- Criar usuário com dados válidos
- Criar usuário administrador
- Criar usuário comum
- Listar todos os usuários
- Buscar usuário por ID
- Buscar com filtros (nome, email)
- Atualizar dados do usuário
- Deletar usuário

**Negativos:**
- Criar usuário com email duplicado
- Criar sem campos obrigatórios (nome, email, senha)
- Email em formato inválido
- Buscar usuário inexistente
- Atualizar com email já existente
- Deletar usuário com carrinho vinculado

**Automatizados (2 cenários críticos):**
1. **Criar usuário com sucesso** - fluxo de cadastro
2. **Impedir email duplicado** - integridade de dados

---

### Produtos

**Positivos:**
- Criar produto (usuário admin)
- Listar todos os produtos
- Buscar produto por ID
- Buscar com filtros (nome, preço, descrição)
- Atualizar produto
- Deletar produto

**Negativos:**
- Criar produto sem autenticação
- Criar produto com usuário não-admin
- Nome duplicado
- Campos obrigatórios faltando
- Preço negativo ou zero
- Quantidade negativa
- Deletar produto em carrinho

**Automatizados (2 cenários críticos):**
1. **Criar produto autenticado como admin** - fluxo principal
2. **Impedir criação sem autenticação** - segurança

---

### Carrinhos

**Positivos:**
- Criar carrinho com produtos válidos
- Criar carrinho com múltiplos produtos
- Validar cálculo do preço total
- Listar carrinhos
- Buscar carrinho por ID
- Concluir compra (deletar carrinho)
- Cancelar carrinho (produtos voltam ao estoque)

**Negativos:**
- Criar carrinho sem autenticação
- Produto inexistente
- Quantidade maior que estoque
- Produto duplicado no carrinho
- Usuário já tem carrinho ativo
- Quantidade zero ou negativa

**Automatizados (2 cenários críticos):**
1. **Criar carrinho e validar preço total** - regra de negócio
2. **Impedir quantidade maior que estoque** - integridade

---

## Cenários Automatizados (Resumo)

Total: 8 cenários (2 por funcionalidade)

| Funcionalidade | Crítico 1 | Crítico 2 |
|---|---|---|
| Login | Credenciais válidas | Credenciais inválidas |
| Usuários | Criar usuário | Email duplicado |
| Produtos | Criar produto (admin) | Sem autenticação |
| Carrinhos | Criar carrinho | Estoque insuficiente |

## Como Executar

### Pré-requisitos
- Node.js instalado
- Newman instalado globalmente

```bash
npm install -g newman
npm install -g newman-reporter-html
```

### Executar os testes

```bash
newman run collections/ServeRest-API-Tests.postman_collection.json -e environments/serverest-env.postman_environment.json -r cli -r html --reporter-html-export reports/report.html
```

### Results

Os resultados do testes estão na em desafio-api-QA/reports

## Instalação

```bash
git clone https://github.com/seu-usuario/desafio-api-qa.git
cd desafio-api-qa
```
