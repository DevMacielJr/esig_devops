## Esig DevOps

Projeto para a vaga de estagio da Esig.

-- Nesse projeto temos como objetivo:

Gerenciar os recursos de TI (hardware, software, e serviços), analisando-os, a fim de
proporcionar aos utilizadores (colaboradores internos e clientes) disponibilidade e melhor
qualidade nos serviços oferecidos. Bem como garantir a execução de aplicações e
disponibilidade dos sistemas.

-- Atividade Tecnica:

Você deverá criar um script que realize um dump e restore de um banco de dados
PostgreSQL, além de verificar o status das instâncias do JBoss e Tomcat em um ambiente
de teste. A atividade deve ser desenvolvida de forma a demonstrar suas habilidades práticas
e compreensão dos conceitos envolvidos. O projeto completo deve ser disponibilizado no
GitHub.

-- Requisitos da Atividade:

Dump e Restore de Banco de Dados PostgreSQL:
	Crie um banco de dados PostgreSQL com pelo menos uma tabela de exemplo.
	Escreva um script que faça o dump deste banco de dados.
	Escreva um script que restaure este banco de dados a partir do dump gerado.
Verificação de Instâncias do JBoss e Tomcat:
	Escreva scripts que verifiquem se as instâncias do JBoss e Tomcat estão rodando em um servidor.
	Extra: Atualize o script anterior adicionando a condição: caso a instância esteja parado por mais de 1min, inicializar a instância.

Os scripts devem retornar informações básicas como status da instância e tempo de
atividade.

Documentação:

Inclua um README detalhado no repositório do GitHub, explicando como configurar o
ambiente, como rodar os scripts e qualquer outra informação relevante para a execução da
atividade.

-- Submissão:
	Suba todos os arquivos necessários em um repositório público no GitHub.
	Forneça o link do repositório como parte da sua submissão.

------------------------------------------------------------------------------------------------------

# Desafio Técnico - Estágio em Infraestrutura | ESIG Group

## Contexto

A atividade proposta consiste em:
- Criar scripts de dump e restore de banco PostgreSQL
- Monitorar serviços JBoss (WildFly) e Tomcat
- Automatizar reinicialização em caso de falha
- Documentar todo o processo

## Objetivo

Demonstrar habilidades práticas em:
- Administração de sistemas Linux
- Automação com Shell Script
- Gerenciamento de serviços
- Organização e documentação técnica

## Estrutura do Projeto
esig-devops-challenge/
├── db/
│ ├── dump.sh
│ ├── restore.sh
│ └── backup.sql
├── services/
│ ├── check_tomcat.sh
│ └── check_jboss.sh
├── backup/
├── logs/
└── README.md

## Pré-requisitos

- Sistema Operacional: Ubuntu 20.04 ou superior
- Banco de Dados: PostgreSQL 12+
- Servidores de Aplicação:
  - Tomcat 9
  - WildFly (JBoss)
- Ferramentas: Git, cron (para agendamento)

## Instalação e Configuração

### 1. Atualizar sistema e instalar dependências

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install postgresql postgresql-contrib tomcat9 git curl -y

# Acessar PostgreSQL
sudo -u postgres psql

# Criar banco de dados
CREATE DATABASE esigdb;

# Criar usuário
CREATE USER esig_user WITH PASSWORD 'senha_segura';

# Conceder privilégios
GRANT ALL PRIVILEGES ON DATABASE esigdb TO esig_user;

# Sair do PostgreSQL
\q

# Conectar ao banco criado
sudo -u postgres psql -d esigdb

# Executar SQL para criar tabela
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Inserir dados de exemplo
INSERT INTO users (name, email) VALUES 
    ('João Silva', 'joao@example.com'),
    ('Maria Santos', 'maria@example.com');

# Verificar dados
SELECT * FROM users;

# Sair
\q

---------------------------------------------------------------------------------------

Operações com Banco de Dados

# Backup (Dump)

cd db
chmod +x dump.sh
./dump.sh

# Saída esperada:

[INFO] Iniciando backup do banco esigdb...
[SUCCESS] Backup concluído: backup/dump_20240101_120000.sql
[INFO] Tamanho do arquivo: 15KB

# Restauração:

cd db
chmod +x restore.sh
./restore.sh ../backup/dump_20240101_120000.sql

# Saída esperada:

[INFO] Restaurando banco de dados...
[SUCCESS] Banco restaurado com sucesso!
[INFO] 2 registros importados.


-------------------------------------------------------------------------------

Monitoramento de Serviços

# Tomcat 9:

cd services
chmod +x check_tomcat.sh
./check_tomcat.sh

# JBoss/WildFly:

cd services
chmod +x check_jboss.sh
./check_jboss.sh

-------------------------------------------------------------------------------

# Testes Realizados

Backup completo do banco
Restauração do backup
Detecção de serviço inativo
Reinicialização automática
Logging adequado
Tratamento de erros

-------------------------------------------------------------------------------

AUTOR:

Edson Maciel de Barros Junior.
