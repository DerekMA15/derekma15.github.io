---
title: Guia de Estudos de Cibersegurança
date: 2026-10-13
toc: true
---
# Guia de Estudos de Cibersegurança

Após algumas pesquisa e formulações do que precisa ser feito, decidi pedi uma reformulação básica com suporte do claude para criar um Guia de Estudos para Cibersegurança mais voltada ao Blue Team. Um ponto crucial que queria adicionar era de sempre tornar os estudos em projetos práticos, além disso, tornar eles em possiveis "produtos" na minha na "vitrine" do meu portifólio, foi um ponto que apenas pedi citações para levar de exemplo a primeiro momento e conforme for avançando no tempo ir decidindo de forma mais inpositiva quais são mains interessantes e legais(ninguém merece fazer projeto pessoal chato!). 

---

## 1. Panorama de tempo (assumindo ~8–10h/semana)

### Meses 0–3: fundamentos + hábito

- Terminar a trilha iniciante do HTB Academy e reforçar o básico: redes (TCP/IP, DNS, HTTP), Linux, Windows, noções de Python/Bash.
- **Entregável:** 5–10 máquinas/labs resolvidos com anotações próprias.

### Meses 3–6: especialização inicial

- Escolher uma linha (defensiva) e montar o primeiro home lab.
- Fazer o primeiro projeto de portfólio e abrir um blog ou repositório no GitHub.

### Meses 6–12: profundidade e prova

- Projetos mais completos (detecção, resposta a incidentes), CTFs em equipe e uma certificação de entrada.
- Nessa fase já é possível se candidatar a estágio ou vaga júnior em SOC.

### Meses 12–24: consolidação

- Aprofundar em DFIR, detection engineering ou threat hunting.
- Uma certificação intermediária e contribuições em projetos open source.

> Os prazos variam conforme a rotina. Constância (um pouco por dia) rende mais do que maratonas de fim de semana.

---

## 2. Projetos para o portfólio

### Defensivos (prioridade)

1. **Home lab de SIEM:** subir Wazuh, Security Onion ou ELK/Splunk Free em VMs, coletar logs de uma máquina Windows e uma Linux, criar dashboards e alertas.
2. **Sysmon + Atomic Red Team:** simular técnicas do MITRE ATT&CK no lab, observar os logs e escrever regras de detecção (Sigma é um bom formato).
3. **Honeypot na nuvem:** Cowrie ou T-Pot em um VPS barato, analisando ataques reais e publicando estatísticas e conclusões.
4. **Ferramentas de análise de log em Python:** parser de logs de SSH/web que detecta brute force e gera relatório.
5. **Investigação de incidente simulada:** usar datasets públicos (CyberDefenders, Blue Team Labs) e escrever um relatório profissional com linha do tempo, IOCs e recomendações.
6. **Análise básica de malware** em ambiente isolado (FLARE VM ou REMnux).

### Ofensivos (complemento)

1. **Lab de Active Directory:** montar um AD, atacar e depois detectar o que foi feito. É o que une os dois lados.
2. **Writeups de máquinas retiradas do HTB:** nunca publicar de máquinas ativas, pois viola as regras da plataforma.
3. **CTFs** (CTFtime lista os eventos) com writeups dos desafios.

> **Dica de portfólio:** o diferencial não é a ferramenta, e sim documentar o raciocínio: o que fiz, o que vi, o que aprendi, o que faria diferente.

---

## 3. Plataformas além do HTB


| Plataforma | Para quê |
| ------------------------- | -------------------------------------------------------------- |
| **HTB Academy** | Caminho *SOC Analyst* e certificação **CDSA** (lado defensivo) |
| **TryHackMe** | Trilhas *SOC Level 1* e *Cyber Defense*, bem guiadas |
| **LetsDefend** | Simula o dia a dia de analista de SOC |
| **CyberDefenders** | Desafios de blue team e forense |
| **Blue Team Labs Online** | Labs de investigação e resposta a incidentes |
| **OverTheWire (Bandit)** | Treino de Linux |


---

## 4. Vídeos e canais (em inglês, busque pelo nome)

- **John Hammond:** malware, CTFs e análise de ameaças, com ótima didática.
- **IppSec:** walkthroughs de máquinas HTB; assista depois de tentar sozinho.
- **The Cyber Mentor (Heath Adams):** cursos completos gratuitos de pentest e noções gerais.
- **13Cubed:** referência em forense digital e resposta a incidentes.
- **Black Hills Information Security / Antisyphon:** webcasts gratuitos de blue e red team.
- **Chris Greer:** Wireshark e análise de tráfego, essencial para defensiva.
- **Gerald Auger (Simply Cyber):** carreira e visão de mercado.
- **David Bombal:** entrevistas e redes.
- **LiveOverflow:** mais técnico, bom quando já há base.

---

## 5. Dicas gerais

- **Anote tudo:** Obsidian, Notion ou um repositório no GitHub. Seu "segundo cérebro" de cybersec vira material de portfólio.
- **Pense como defensor mesmo nos labs ofensivos:** depois de cada máquina, pergunte "como eu detectaria e bloquearia isso?".
- **Aprenda o MITRE ATT&CK cedo:** é o vocabulário comum entre red e blue team.
- **Linux, redes e scripting** pesam mais do que qualquer ferramenta específica.
- **Comunidade:** Discords do HTB e THM e grupos brasileiros de segurança ajudam a manter a motivação.
- **Certificações para o futuro (sem pressa):** Security+ (geral), BTL1 ou CDSA (defensiva), eJPT (entrada em ofensiva).
- **Ética:** pratique apenas em ambientes próprios ou plataformas autorizadas.

---

## 6. Próximos passos sugeridos

- Concluir a trilha iniciante do HTB
- Montar o primeiro home lab de SIEM
- Criar o repositório/blog de anotações
- Publicar o primeiro writeup (máquina retirada)
- Escolher a primeira certificação

