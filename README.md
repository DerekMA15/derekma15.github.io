# Resumo
Aba Projetos (_tabs/projetos.md): É o seu índice fixo/vitrine (ex: "Projeto 1: Lab OpenWrt | Status: Em andamento").

Posts (_posts/): São os capítulos daquele projeto (ex: "Parte 1: Flashing do Firmware", "Parte 2: Analisando pacotes no Wireshark").

Aba Wiki (_tabs/wiki.md): É o seu bloco de notas fixo de comandos rápidos para consulta do dia a dia.
## Estrutura 
```
meu-blog-jekyll/
├── _config.yml          # Configurações globais (título, autor, plugins)
├── _posts/              # Seus artigos/write-ups em Markdown
│   ├── 2026-08-25-piloto-openwrt-lab.md
│   └── 2026-09-10-analise-trafego-wireshark.md
├── _projects/           # Seus projetos de portfólio (opcional)
├── assets/              # Imagens, diagramas, prints e arquivos CSS
│   └── img/
│       └── openwrt-lab-topology.png
└── index.md             # Página inicial (sua bio e links)
```

## Estuturas Adotadas

### 1. Estrutura Híbrida: Portfólio Landing Page + Blog

Focada em **conversão e apresentação pessoal**. A página inicial vende quem você é e o que sabe fazer; o blog comprova essa narrativa com projetos aprofundados.

- **Arquitetura Visual:**
    - **Página Inicial (`/`):** Foto/avatar, mini bio ("Estudante de Redes & Cibersegurança"), links rápidos (GitHub, LinkedIn, Email), cartões de **Projetos em Destaque** (ex: *Lab OpenWrt*, *Analisador de Tráfego em Python*) e uma lista dos posts mais recentes.
    - **Sessão do Blog (`/blog`):** Lista cronológica de artigos/write-ups, com busca por palavras-chave e navegação por *tags* (`#NetworkSecurity`, `#Firmware`, `#Pentest`).
    - **Página Sobre (`/about`):** Seu currículo visual, certificações, objetivos de carreira e mapa de estudos.
- **Por que escolher:** Se o seu objetivo imediato for passar em entrevistas, conseguir um estágio ou vaga *Junior*. Recrutadores e gestores técnicos conseguem entender o seu nível em menos de 30 segundos ao acessar a página principal.
- **Tema recomendado para Jekyll:** **Minimal Mistakes** ou **Chirpy**.

### 2. Estrutura Wiki / Base de Conhecimento (Segundo Cérebro)

Focada em **organização contínua e documentação técnica**. Funciona como uma biblioteca de documentação encadeada (estilo Wikipedia ou Notion), onde cada conceito, comando ou ferramenta tem sua própria página indexada.

- **Arquitetura Visual:**
    - **Menu Lateral (Sidebar) Permanente:** Navegação hierárquica por tópicos e sub-tópicos.
        - 📁 **Fundamentos de Redes**
            - 📄 Modelo OSI vs TCP/IP
            - 📄 Sub-roteamento e VLANs (802.1Q)
        - 📁 **Homelab & Firmware**
            - 📄 Guia de Instalação do OpenWrt
            - 📄 Comandos úteis do `iptables`
        - 📁 **Ferramentas de Cibersegurança**
            - 📄 Wireshark / `tcpdump` Cheatsheet
            - 📄 Nmap para Mapeamento de Redes
    - **Área Central:** Conteúdo limpo, com índice automático da página (*Table of Contents* - TOC) à direita.
- **Por que escolher:** Se o seu foco principal é o **aprendizado diário**. Você não precisa esperar ter um projeto "pronto" para publicar; pode ir criando pequenas páginas com comandos, cheatsheets e anotações de aula. O portfólio torna-se o efeito colateral da sua rotina de estudos.
- **Tema recomendado para Jekyll:** **Just the Docs**.

## Como Fica a Mesclagem de ambos os Modelos ? 

### Como Fica a Estrutura de Navegação

A navegação principal (menu superior da página) fica limpa e dividida por intenções:

```
[ Logo / Seu Nome ]     Home  |  Projetos  |  Blog  |  Wiki  |  Sobre
```

### 1. `Home ( / )` e `Projetos ( /projects )` — O Lado Híbrido

- **Objetivo:** Captar a atenção de recrutadores nos primeiros 10 segundos.
- **O que exibe:**
    - Apresentação curta (*"Estudante de Redes & Segurança da Informação"*).
    - Seção de **Projetos em Destaque** (ex: o card do seu *Lab com Roteador Antigo/OpenWrt*).
    - Links diretos para GitHub, LinkedIn e e-mail.

### 2. `Blog / Write-ups ( /blog )` — O Lado Narrativo

- **Objetivo:** Mostrar resolução de problemas e capacidade de comunicação técnica.
- **O que exibe:** Artigos completos e cronológicos sobre projetos finalizados (ex: *"Como transformei um roteador de R$ 30 em um laboratório de análise de tráfego"*).

### 3. `Wiki / Segundo Cérebro ( /wiki )` — O Lado Documentação

- **Objetivo:** Demonstrar consistência nos estudos diários e ter um local de rápida consulta.
- **Como funciona:** Ao clicar em **Wiki**, a interface altera para o formato de documentação, exibindo um **menu lateral (sidebar)** dinâmico por tópicos.

### Topologia Visual da Navegação

```
               ┌──────────────────────────────────────────────┐
               │         MENU SUPERIOR (Navegação Global)     │
               │   Home   │   Projetos   │   Blog   │  WIKI   │
               └──────────────────┬───────────────────────────┘
                                  │
                       [ Ao clicar em WIKI ]
                                  │
    ┌─────────────────────────────┴───────────────────────────────┐
    │  SIDEBAR LATERAL (Wiki)        Conteúdo da Nota/Documento   │
    │  ├─ 📁 Redes                                                │
    │  │  ├─ Modelo OSI vs TCP/IP    # Comandos Úteis do iptables  │
    │  │  └─ VLANs (802.1Q)                                       │
    │  │                             Para bloquear o tráfego de   │
    │  ├─ 📁 Homelab                 um IP específico na porta    │
    │  │  ├─ OpenWrt Flash           80:                          │
    │  │  └─ Cheatsheet iptables  ◄───                            │
    │  │                             ```bash                      │
    │  └─ 📁 Cibersegurança          iptables -A INPUT -s ...     │
    │     └─ Wireshark Filters       ```                          │
    └─────────────────────────────────────────────────────────────┘
```

## Como Estruturar as Pastas no Jekyll

Para fazer essa separação no Jekyll sem bagunçar os arquivos, você pode organizar o diretório do seu projeto da seguinte forma:

```
meu-site-jekyll/
├── _config.yml               # Configurações globais
│
├── index.md                  # Página Inicial (Landing Page)
├── about.md                  # Página "Sobre mim"
│
├── _posts/                   # Artigos do BLOG (Linha do tempo)
│   ├── 2026-08-25-writeup-openwrt-lab.md
│   └── 2026-09-01-analise-pcap-wireshark.md
│
└── wiki/                     # Seção da WIKI (Estrutura em árvore)
    ├── index.md              # Página principal da Wiki
    ├── redes/
    │   ├── modelo-osi.md
    │   └── vlans-8021q.md
    ├── homelab/
    │   ├── openwrt-setup.md
    │   └── iptables-cheatsheet.md
    └── seguranca/
        └── wireshark-filtros.md
```

## Configuração Básica no Front Matter (Exemplo)

No Jekyll, a forma como uma página se comporta é definida pelo cabeçalho (Front Matter) no topo de cada arquivo `.md`.

### Exemplo de um Post do Blog (`_posts/2026-08-25-writeup-openwrt-lab.md`):

```
---
layout: post
title: "Projeto Piloto: Transformando Roteador Antigo em Lab de Segurança"
date: 2026-08-25
categories: [Homelab, Redes]
tags: [openwrt, firmware, wireshark]
---
```

### Exemplo de uma Nota da Wiki (`wiki/homelab/iptables-cheatsheet.md`):

```
---
layout: wiki              # Usa o layout com sidebar lateral
title: "iptables - Guia Rápido de Referência"
parent: Homelab           # Agrupa no menu da Wiki
nav_order: 2
---
```

## Qual Tema Utilizar para Fazer Isso?

Se quiser fazer isso sem ter que construir todo o CSS do zero:

1. **Tema Chirpy ou Minimal Mistakes (com personalização na Wiki):** O Chirpy é um dos temas mais populares para blogs de cibersegurança. Ele já vem com layout híbrido excelente e suporte a tags e categorias que podem servir como Wiki.
2. **Just the Docs em subdiretório `/wiki`:** Você pode usar um tema genérico para o site principal e incorporar a estrutura do Just the Docs especificamente para a pasta `/wiki/`.

`OBS: Não encher a cabeça com esse negocio de estilo agora, apenas faça, se não gostar, muda.`