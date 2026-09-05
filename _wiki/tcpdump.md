---
layout: page
title: tcpdump
category: Redes
description: Cheatsheet de captura e filtragem de pacotes na camada de rede.
tags: [tcpdump, redes, pcap]
---

#### Captura Básica
Capturar tráfego na interface `eth0` sem resolver nomes
``` bash
tcpdump -i eth0 -n 
``` 