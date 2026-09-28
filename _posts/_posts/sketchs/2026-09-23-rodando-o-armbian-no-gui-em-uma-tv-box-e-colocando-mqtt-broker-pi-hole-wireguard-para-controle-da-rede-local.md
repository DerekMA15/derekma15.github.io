---
title: Rodando o Armbian no GUI em uma TV Box e colocando MQTT broker + Pi-hole
  + WireGuard para controle da rede Local
date: 2026-09-23
categories:
  - Armbian
  - Redes
  - DNS
tags:
  - Linux
  - Pi-Hole
toc: true
---
Ainda estou no processo! Mas vou deixar links que estou usando como referência e afins.

## Checklist — Instalação e validação do gem5

### Fase 0 — Preparação da VM

- □

  Confirmar versão do Ubuntu (20.04, 22.04 ou 24.04)
- □

  Verificar se o processador suporta virtualização (`vmx` ou `svm`)
- □

  Alocar recursos mínimos: 4+ núcleos, 8 GB RAM, 20 GB disco
- □

  Atualizar o sistema (`sudo apt update && sudo apt upgrade`)
- □

  Confirmar versão do GCC (10+) e do Python (3.6+)

### Fase 1 — Dependências

- □

  Instalar pacotes essenciais (build-essential, scons, git, etc.)
- □

  Instalar bibliotecas de suporte (protobuf, boost, zlib, etc.)
- □

  Instalar ferramentas auxiliares (python3-venv, python3-tk, etc.)
- □

  Confirmar que não houve erro de dependência quebrada

### Fase 2 — Código-fonte

- □

  Clonar o repositório oficial do gem5
- □

  Entrar na pasta do repositório
- □

  Verificar a branch atual (`stable` ou `develop`)
- □

  Registrar a versão exata (`git log -1 --oneline`)

### Fase 3 — Compilação

- □

  Escolher o alvo de build (ex.: `build/ALL/gem5.opt`)
- □

  Executar o `scons` com número de núcleos adequado
- □

  Cronometrar o tempo de compilação
- □

  Confirmar que o binário foi gerado em `build/ALL/`
- □

  Verificar ausência de erros no final da saída do scons

### Fase 4 — Teste básico (Hello World)

- □

  Rodar o script de exemplo `simple.py`
- □

  Confirmar a saída `Hello world!`
- □

  (Opcional) Criar e rodar o script com a Standard Library
- □

  Registrar a saída como evidência

### Fase 5 — KVM (preparação para full-system)

- □

  Verificar suporte a KVM no processador
- □

  Instalar qemu-kvm, libvirt e bridge-utils
- □

  Adicionar o usuário aos grupos `libvirt` e `kvm`
- □

  Fazer logout/login para aplicar os grupos
- □

  Testar boot do Ubuntu com KVM usando script de exemplo
- □

  Confirmar que o boot ocorre sem erros

### Fase 6 — Documentação do ambiente

- □

  Registrar versão do gem5
- □

  Registrar comando de build usado
- □

  Registrar tempo de compilação
- □

  Registrar configuração da VM (SO, núcleos, RAM, disco)
- □

  Salvar evidências (saídas, prints, logs)

### Fase 7 — Próximos passos (pós-instalação)

- □

  Estudar os scripts de exemplo em `configs/learning_gem5/`
- □

  Escolher um cenário de segurança (Spectre, side-channel, etc.)
- □

  Localizar um PoC ou artigo de referência para reproduzir
- □

  Planejar o experimento em modo SE ou FS
- □

  Definir métricas a analisar (cache hits/misses, predição de desvios, etc.)  

  O que esperar da VM com VirtualBox

A abordagem funciona, mas você precisa alocar recursos com cuidado, porque o gem5 é pesado na compilação.

- **Compatibilidade**: É a rota padrão e testada. Vários guias acadêmicos e o próprio ecossistema do gem5 usam VirtualBox para distribuir ambientes prontos ou como passo inicial.
- **Recursos necessários**: Você vai precisar de uma VM com uma configuração mínima decente. O gem5 exige **pelo menos 8 GB de RAM** e cerca de **20 GB de espaço livre em disco** para o código-fonte, compilação e simulações.
- **Desempenho**: A compilação do gem5 é demorada e consome muita CPU. Em uma VM, se você não alocar **4 ou mais núcleos** para ela, a compilação pode passar de 1 hora facilmente. A simulação em si, especialmente em modo *Full-System*, também é pesada.

### Como proceder na prática

1. **Verifique o suporte**: Confirme se o seu processador Intel ou AMD suporta virtualização (`VT-x` ou `AMD-V`) e se a opção está ativa na BIOS/UEFI.
2. **Instale o VirtualBox**: Baixe a versão mais recente do site oficial.
3. **Crie a VM**: Use uma ISO do **Ubuntu 24.04 LTS** ou **22.04 LTS** (são as versões com melhor suporte para o gem5 atual).
4. **Aloque recursos**: Dê à VM pelo menos **4 núcleos de CPU**, **8 GB de RAM** e **40 GB de disco**.
5. **Habilite a virtualização aninhada**: Nas configurações da VM (em *System > Processor*), marque a opção para expor os recursos de virtualização aninhada para o sistema convidado.

Abaixo está um roteiro de passos para colocar o gem5 a funcionar na sua máquina local, com foco em testes rápidos e documentação do processo.

## Pré-requisitos: verificar a VM local

Antes de instalar, confirme que sua máquina virtual atende aos requisitos mínimos:

- **Sistema operacional**: Ubuntu 20.04, 22.04 ou 24.04 são as versões mais testadas 
- **Compilador GCC**: versão 10 ou superior (suporte até GCC 13) 
- **Python**: 3.6 ou superior 
- **Espaço em disco**: reserve pelo menos 20 GB livres para o código-fonte, compilação e simulações
- **Memória RAM**: 8 GB é o mínimo confortável; se for usar KVM para full-system, mais memória ajuda

## Passo 1: instalar dependências

Escolha o comando conforme a versão do Ubuntu. Para **Ubuntu 24.04** (recomendado para gem5 >= v24.0) :

```bash

sudo apt install build-essential scons python3-dev git pre-commit zlib1g zlib1g-dev \

    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \

    libboost-all-dev libhdf5-serial-dev python3-pydot python3-venv python3-tk mypy \

    m4 libcapstone-dev libpng-dev libelf-dev pkg-config wget cmake doxygen clang-format

```

Para **Ubuntu 22.04** (gem5 >= v21.1) :

```bash

sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \

    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \

    python3-dev libboost-all-dev pkg-config python3-tk clang-format-15

```

> **Nota**: as dependências `protobuf` e `Boost` são opcionais, mas úteis se você for gerar traces ou usar SystemC futuramente .

## Passo 2: clonar o código-fonte

```bash

git clone [https://github.com/gem5/gem5](https://github.com/gem5/gem5)

cd gem5

```

A branch padrão `stable`) é atualizada a cada release estável. A branch `develop` recebe novidades com mais frequência .

## Passo 3: compilar o gem5

O comando de compilação básico para a arquitetura **ALL** (que inclui todos os ISAs e protocolos de coerência de cache) :

```bash

scons build/ALL/gem5.opt -j$(nproc)

```

**Sobre o tempo de compilação**: em uma máquina com 16 núcleos leva cerca de 10–15 minutos; em um único núcleo pode passar de 1 hora . Como você está em VM, quanto mais núcleos alocados, melhor.

**Sobre o tipo de binário**: `gem5.opt` é a escolha recomendada para uso geral — tem otimizações ativadas mas mantém símbolos de debug .

## Passo 4: testar com um “Hello World”

O teste mais rápido é rodar o script de exemplo que já vem no repositório :

```bash

build/ALL/gem5.opt configs/learning_gem5/part1/[simple.py](http://simple.py)

```

Se aparecer `Hello world!` na saída, a instalação está funcionando.

### Alternativa: usar a Standard Library (mais moderno)

Para um teste ainda mais simples com o padrão atual do gem5, crie um arquivo `hello-world.py` com o conteúdo abaixo :

```python

from gem5.components.boards.simple_board import SimpleBoard

from [gem5.components.cachehierarchies.classic.no](http://gem5.components.cachehierarchies.classic.no)_cache import NoCache

from gem5.components.memory.single_channel import SingleChannelDDR3_1600

from gem5.components.processors.cpu_types import CPUTypes

from gem5.components.processors.simple_processor import SimpleProcessor

from gem5.isas import ISA

from gem5.resources.resource import obtain_resource

from gem5.simulate.simulator import Simulator

cache_hierarchy = NoCache()

memory = SingleChannelDDR3_1600("1GiB")

processor = SimpleProcessor(cpu_type=CPUTypes.ATOMIC, num_cores=1, isa=ISA.X86)

board = SimpleBoard(

    clk_freq="3GHz",

    processor=processor,

    memory=memory,

    cache_hierarchy=cache_hierarchy,

)

board.set_workload(obtain_resource("x86-hello64-static"))

simulator = Simulator(board=board)

[simulator.run](http://simulator.run)()

```

Execute com:

```bash

build/ALL/gem5.opt [hello-world.py](http://hello-world.py)

```

## Passo 5: preparar o terreno para testes de segurança

Como seu foco é cibersegurança, o próximo passo é habilitar o **KVM** para acelerar a inicialização de simulações full-system. O KVM permite bootar o Linux em velocidade próxima à nativa antes de alternar para um modelo de CPU detalhado (como O3) para rodar o experimento .

### Verificar suporte a KVM

```bash

grep -E -c '(vmx|svm)' /proc/cpuinfo

```

Se retornar 0, seu processador não suporta virtualização por hardware. Se retornar 1 ou mais, está OK .

### Instalar KVM e adicionar seu usuário aos grupos

```bash

sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

sudo adduser `id -un` libvirt

sudo adduser `id -un` kvm

```

Depois, **saia e entre novamente** na sessão para que os grupos tenham efeito .

### Testar KVM com gem5

```bash

build/ALL/gem5.opt configs/example/gem5_library/[x86-ubuntu-run-with-kvm.py](http://x86-ubuntu-run-with-kvm.py)

```

Se a simulação iniciar o boot do Ubuntu sem erros, o KVM está funcionando .

## Passo 6: validar e registrar

Para o seu relatório, registre:

- **Versão do gem5**: `git log -1 --oneline` na pasta do repositório
- **Comando de build usado**: `scons build/ALL/gem5.opt -jX`
- **Tempo total de compilação**: use `time` antes do comando scons
- **Configuração da VM**: SO, núcleos alocados, RAM, espaço em disco
- **Saída do teste Hello World**: evidência de que o ambiente está funcional

## Resumo do fluxo

| Etapa | Comando/Ação | Resultado esperado |

|---|---|---|

| Dependências | `apt install ...` | Pacotes instalados sem erro |

| Código | `git clone ...` | Repositório na VM |

| Build | `scons build/ALL/gem5.opt -j` | Binário gerado em `build/ALL/` |

| Teste | `gem5.opt simple.py` | `Hello world!` na tela |

| KVM | Instalar e testar | Boot do Ubuntu com KVM |

Com isso, você tem um ambiente gem5 funcional e documentado, pronto para os experimentos de segurança (Spectre, side-channel, etc.) que virão na próxima fase.  
  
irei ajeitar ainda



&nbsp;