---
layout: page
icon: fas fa-brain
title: Wiki
order: 4
permalink: /wiki/
---

# Base de Conhecimento (Wiki)

Anotações técnicas agrupadas por área. Selecione uma tecnologia para visualizar as cheatsheets.

---

{% assign categories = site.wiki | map: 'category' | uniq %}

{% for cat in categories %}
  <h2 class="mt-4 mb-3" style="border-bottom: 1px solid var(--main-border-color); padding-bottom: 8px;">
    📁 {{ cat }}
  </h2>

  <div class="row">
    {% assign notes = site.wiki | where: "category", cat %}
    {% for note in notes %}
      <div class="col-md-6 mb-3">
        <div class="card h-100" style="background: rgba(255, 255, 255, 0.02); border: 1px solid var(--main-border-color); border-radius: 8px; padding: 16px;">
          <h3 style="margin-top: 0; margin-bottom: 6px; font-size: 1.1rem; border: none;">
            <a href="{{ note.url | relative_url }}" style="text-decoration: none !important; color: var(--heading-color);">
              📄 {{ note.title }}
            </a>
          </h3>
          <p style="font-size: 0.85rem; color: var(--text-muted-color); margin-bottom: 12px; line-height: 1.4;">
            {{ note.description }}
          </p>
          <div>
            {% for tag in note.tags %}
              <a href="{{ '/tags/' | relative_url }}{{ tag | slugify }}/" 
                 class="post-tag me-1" 
                 style="border: 1px solid var(--btn-border-color, #343a40) !important; border-radius: 12px !important; padding: 1px 8px !important; text-decoration: none !important; font-size: 0.75rem;">
                {{ tag }}
              </a>
            {% endfor %}
          </div>
        </div>
      </div>
    {% endfor %}
  </div>
{% endfor %}

---

### Boas Práticas para Arquivos na Wiki

* **Linhas em branco:** Mantenha sempre 1 linha em branco antes e depois de blocos de código (`bash`).
* **Uso de `layout: page`:** Mantém o layout limpo e focado no texto.
* **Separadores (`---`):** Utilize três hífens para dividir os tópicos da cheatsheet, garantindo uma leitura escaneável e organizada.