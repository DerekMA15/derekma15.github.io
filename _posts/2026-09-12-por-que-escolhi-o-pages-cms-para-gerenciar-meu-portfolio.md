---
title: Por que escolhi o Pages CMS para gerenciar meu portfólio
date: 2026-09-12
categories:
  - posts
  - ferramentas
tags:
  - pages-cms
  - jekyll
  - git
  - workflow
description: Como saí de um fluxo puramente Git para uma interface visual de
  edição, sem perder o controle sobre o repositório.
toc: false
---
## O que eu considerei


| Opção | Por que não escolhi |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Jekyll Admin** | É plugin oficial e integra perfeitamente com Jekyll, mas só roda localmente. Não funciona no GitHub Pages porque exige um servidor Ruby por trás. |
| **Decap CMS** (ex-Netlify CMS) | Também é gratuito e baseado em Git, mas o ritmo de manutenção desacelerou. Preferi algo com desenvolvimento mais ativo. |
| **TinaCMS** | Poderoso, mas é um produto comercial com cobrança por usuário. Não se encaixa no meu requisito de custo zero. |
| **Spinal CMS** | Também é comercial e focado em colaboração de equipe. Exagero para um projeto pessoal. |
| **Escrever tudo manualmente no Git** | É o que eu fazia. Funciona, mas o atrito é alto para edições rápidas. |


## Por que o Pages CMS

O [Pages CMS](https://app.pagescms.org) resolveu o problema com duas características que considero essenciais:

1. **É gratuito e open-source.** Todos os recursos estão disponíveis sem camada paga, e a versão hospedada oficialmente também é gratuita.
2. **É um editor Git-based, não um CMS tradicional.** Ele não guarda conteúdo em um banco de dados. Ele lê e escreve diretamente os arquivos Markdown do meu repositório, criando commits automaticamente. Isso significa que **eu continuo dono do meu conteúdo** — se eu quiser parar de usar o CMS amanhã, meus arquivos continuam lá, intactos.

A curva de aprendizado foi mínima: criar um arquivo `.pages.yml` na raiz do repositório, fazer login em `app.pagescms.org` com GitHub e autorizar o acesso. Em poucos minutos eu já estava editando posts.

## Como configurei

O coração da integração é o arquivo `.pages.yml`, que fica na raiz do repositório. Ele descreve:

- **Posts** (`_posts/`) com campos como título, data, categorias, tags e corpo em Markdown.
- **Páginas** (`_pages/`) para páginas estáticas como Sobre e Contato.
- **Wiki** (`_wiki/`) para minhas anotações rápidas.
- **Projetos** (`_data/projetos.yml`) como uma lista editável de itens.

Cada campo do front matter é mapeado explicitamente, então o CMS sabe exatamente o que editar e onde salvar.

## O que eu ganhei

- **Edição pelo navegador**, em qualquer dispositivo.
- **Commits automáticos** com mensagens descritivas.
- **Zero mudança no fluxo de deploy** — o GitHub Actions continua funcionando exatamente como antes.
- **Controle total**: o conteúdo continua sendo arquivos versionados no meu repositório.

## O que ainda não é perfeito

- **Pré-visualização limitada.** O editor mostra o Markdown renderizado, mas não o layout final do tema Chirpy. Para isso, ainda rodo `jekyll serve` localmente.
- **Configurações do tema não são editáveis.** Arquivos como `_config.yml` continuam exigindo edição manual via Git.
- **Dependência do serviço hospedado.** Se o `app.pagescms.org` sair do ar, posso implantar minha própria instância no Cloudflare Pages, mas isso exige trabalho adicional.

## Conclusão

O Pages CMS não substitui o Git — ele o complementa. Para quem quer a conveniência de um CMS visual sem abrir mão do controle sobre os arquivos, é uma escolha difícil de bater.

Se você também mantém um site Jekyll no GitHub Pages e sente o atrito de editar tudo pelo terminal e todo o esquema de precisar ajustar diretamente na pasta do arquivo. O Pages CMS proporciona uma vantagem de poder escrever em qualquer local, salvar e continuar modificando depois, vale a pena testar.

---

## Referências

- [Pages CMS — site oficial](https://pagescms.org)
- [Documentação do Pages CMS](https://pagescms.org/docs)
- [Repositório no GitHub](https://github.com/pages-cms/pages-cms)

