---
layout: page
title: iptables
category: Cibersegurança
description: Regras rápidas de firewall, NAT e redirecionamento de portas no Linux.
tags: [iptables, firewall, linux]
---

### Bloqueio
```bash
iptables -A INPUT -s 192.168.1.100 -j DROP