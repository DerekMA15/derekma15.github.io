---
layout: page
icon: fas fa-newspaper
#title: Posts
order: 2
permalink: /posts/
---

# Write-ups & Artigos

Abaixo estão todos os artigos, análises de laboratório e publicações em ordem cronológica

--- 

{% for post in site.posts %}
  <div class="card mb-3" style="background: rgba(255, 255, 255, 0.02); border: 1px solid var(--main-border-color); border-radius: 8px; padding: 20px;">
    
  <h3 style="margin-top: 0; margin-bottom: 8px; border: none;">
      <a href="{{ post.url | relative_url }}" style="text-decoration: none !important; color: var(--heading-color); border-bottom: none;">
        {{ post.title }}
      </a>
    </h3>

    <!-- EXIBE A DESCRIPTION DENTRO DO CARD -->
  <p style="font-size: 0.95rem; color: var(--text-muted-color); margin-bottom: 16px; line-height: 1.5;">
    {% if post.subtitle %}
      {{ post.subtitle }}
    {% elsif post.description %}
      {{ post.description }}
    {% else %}
      {{ post.excerpt | strip_html | truncate: 160 }}
    {% endif %}
  </p>

    <!-- DATA E TAGS NO PADRÃO TRENDING TAGS -->
  <div class="d-flex align-items-center flex-wrap gap-1x'" style="font-size: 0.85rem; color: var(--text-muted-color);">
      <span class="me-2"> {{ post.date | date: "%d/%m/%Y" }}</span>
      
        {% if post.tags.size > 0 %}
        {% for tag in post.tags %}
          <a href="{{ '/tags/' | relative_url }}{{ tag | slugify }}/" 
             class="post-tag me-1" 
             style="border: 1px solid var(--btn-border-color, #343a40) !important; border-radius: 16px !important; padding: 1px 10px !important; text-decoration: none !important; background-color: var(--tag-bg, transparent) !important; color: var(--tag-color, #8a8a8a) !important; box-shadow: none !important;">
            {{ tag }}
          </a>
        {% endfor %}
      {% endif %}
    </div>

  </div>
{% else %}
  <p>Nenhum post publicado ainda.</p>
{% endfor %}