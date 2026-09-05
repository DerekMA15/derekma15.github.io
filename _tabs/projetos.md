---
layout: page
icon: fas fa-project-diagram
title: Projetos
order: 3
permalink: /projetos/
---

# Projetos & Homelabs
Vitrine de projetos desenvolvidos para disciplinas da faculdade, testes de segurança, arquitetura de redes e algoritmos.

---

{% for proj in site.data.projetos %}
  <div class="card mb-4" style="background: rgba(255, 255, 255, 0.02); border: 1px solid var(--main-border-color); border-radius: 8px; padding: 20px;">
    
    <div class="d-flex justify-content-between align-items-center mb-2">
      <h3 style="margin: 0; border: none; font-size: 1.2rem;">
        <span style="color: var(--heading-color);">{{ proj.title }}</span>
      </h3>
      <span class="badge bg-{{ proj.status_color }}" style="font-size: 0.75rem; padding: 4px 8px; border-radius: 6px;">
        {{ proj.status }}
      </span>
    </div>

    <p style="font-size: 0.9rem; color: var(--text-muted-color); margin-bottom: 16px; line-height: 1.5;">
      {{ proj.description }}
    </p>

    <div class="d-flex align-items-center flex-wrap gap-1x" style="font-size: 0.85rem;">
      {% for tag in proj.tags %}
        <a href="{{ '/tags/' | relative_url }}{{ tag | slugify }}/" 
             class="post-tag me-1" 
             style="border: 1px solid var(--btn-border-color, #343a40) !important; border-radius: 16px !important; padding: 1px 10px !important; text-decoration: none !important; background-color: var(--tag-bg, transparent) !important; color: var(--tag-color, #8a8a8a) !important; box-shadow: none !important;">
            {{ tag }}
          </a>
      {% endfor %}

      <div class="ms-auto d-flex gap-2">
        {% if proj.github_url != "" %}
          <a href="{{ proj.github_url }}" target="_blank" class="post-tag" style="border: 1px solid var(--btn-border-color, #343a40) !important; border-radius: 12px !important; padding: 3px 10px !important; text-decoration: none !important; font-size: 0.8rem;">
            <i class="fab fa-github me-1"></i> Code
          </a>
        {% endif %}
        {% if proj.writeup_url != "" %}
          <a href="{{ proj.writeup_url | relative_url }}" class="post-tag" style="border: 1px solid var(--btn-border-color, #343a40) !important; border-radius: 12px !important; padding: 3px 10px !important; text-decoration: none !important; font-size: 0.8rem; color: var(--heading-color) !important;">
            <i class="fas fa-file-alt me-1"></i> Write-up
          </a>
        {% endif %}
      </div>
    </div>

  </div>
{% endfor %}