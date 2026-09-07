---
layout: page
icon: fas fa-newspaper
title: Uso de Mecânismos Criptograficos em Serviços de encurtamento de URL - Uma Revisão Sistemática
date:   2026-09-04 23:39:13 -0300
categories: [posts, segurança, redes]
tags: [url-shortener, criptografia, hashing, segurança, desempenho]
subtitle: "Uma Revisão Sistemática da Literatura sobre o uso de criptografia e hashing em encurtadores de URL, analisando segurança, desempenho e lacunas de pesquisa."
#permalink: /posts/
---

## Introdução

Serviços de encurtamento de URL são infraestruturas essenciais na web moderna. Eles transformam links longos em identificadores curtos e gerenciáveis, facilitando o compartilhamento em redes sociais, e-mails e mensagens.

O problema? A maioria desses serviços usa **sequências numéricas incrementais** convertidas para **Base62**. Isso é previsível. E previsibilidade, em segurança, é uma vulnerabilidade.

Este artigo é resultado de uma **Revisão Sistemática da Literatura (RSL)** conduzida para investigar o uso de mecanismos criptográficos em encurtadores de URL e seus impactos na segurança e no desempenho.

## Por que isso importa?

Imagine que você compartilha um link privado com um cliente. O encurtador gera: `short.ly/abc123`.

Um atacante pode simplesmente tentar `short.ly/abc124`, `abc125`, e assim por diante. Com um pouco de automação, ele pode mapear todos os links gerados pelo serviço — incluindo os seus.

Isso é chamado de **ataque de enumeração por força bruta**, e é uma das principais falhas dos encurtadores convencionais.

## O que a pesquisa encontrou

Foram analisados **100 artigos primários** publicados entre 2021 e 2026, das principais bases acadêmicas (ACM, IEEE, ScienceDirect, Elsevier). Após a aplicação de critérios rigorosos, apenas **4 estudos** abordavam diretamente a segurança algorítmica no backend.


**Dado relevante:** A maioria dos estudos foca em detecção de phishing e análise comportamental — não em como o link é gerado.


### Os 4 estudos relevantes

| Estudo | Mecanismo | Foco |
|--------|-----------|------|
| Deepali (2025) | Base62 + Roteamento Dinâmico | Escalabilidade e previsibilidade |
| Haripriya (2024) | Funções de Hash | Controle de acesso e anti-enumeração |
| Agrawal (2022) | Rede Descentralizada | Imutabilidade e eliminação de falhas |
| Barbhuyan (2025) | Cifragem no Cliente | Privacidade e extensão de navegador |

## O dilema: segurança vs. desempenho

Serviços de encurtamento precisam de **alta vazão (throughput)** e **baixa latência** — cada redirecionamento é uma requisição HTTP que precisa ser respondida em milissegundos.

Adicionar criptografia complexa aumenta o custo computacional. O desafio é encontrar um equilíbrio:

- **Hash com salt:** aumenta a segurança, mas pode adicionar latência
- **Caching (Redis/Memcached):** reduz latência, mas precisa ser integrado com validações criptográficas
- **Roteamento dinâmico:** distribui carga, mas requer infraestrutura mais robusta

  <strong> O que isso significa na prática:</strong> Um encurtador seguro precisa ser rápido. Se uma solução criptográfica adiciona 100ms de latência, ela pode inviabilizar o serviço em escala.


## Oportunidades de pesquisa

Com base nos achados, identifiquei três direções promissoras:

1. **Codificação criptograficamente segura:** Algoritmos Base62 com salting e permutação pseudoaleatória.
2. **Caching de baixa latência:** Redis com validação criptográfica de integridade no redirecionamento.
3. **Modelos híbridos:** Proteção no backend + verificação leve no cliente.

## Conclusão

Os serviços de encurtamento de URL são amplamente utilizados, mas a segurança algorítmica no backend é negligenciada. A literatura científica foca em ameaças periféricas (phishing), deixando uma lacuna crítica na geração de identificadores.

Este estudo evidencia a necessidade de **arquiteturas robustas** que equilibrem proteção criptográfica e eficiência computacional.

---

## Referências Acadêmicas

- Deepali, Y. Singh, K. K. Ghatrora, H. Singh, e S. Sachar. *"Ziplink: A scalable and customizable url shortening service using base62 encoding and dynamic routing."* IEEE, 2025.
- K. Haripriya, C. Preethi, S. S. Hameed, S. Pavalarajan, T. Shushmmitha, e V. Haripriya. *"Enhancing url security and access control using hash-based shortening algorithm."* IEEE, 2024.
- S. Agrawal e S. Bhadauria. *"Storing url shortener links in the decentralized network."* IEEE, 2022.
- M. F. Khan Barbhuyan, S. Nath, S. A. Ahmed, e A. Kumar Roy. *"A performance optimised multi-function browser extension for enhanced web privacy and secure link shortening."* IEEE, 2025.

---

## O que aprendi com esta pesquisa

- **A lacuna é real:** poucos pesquisadores estão olhando para o problema da previsibilidade de links.
- **Segurança não pode ser um "plus":** precisa ser nativa e transparente.
- **O equilíbrio é difícil:** criptografia forte vs. latência baixa é um trade-off que precisa ser medido e documentado.

---

*Este artigo foi submetido para análise na Sociedade Brasileira de Computação (SBC) e aguarda publicação.*

---

> "A segurança algorítmica não pode ser uma reflexão tardia. Ela precisa estar na arquitetura desde o início."